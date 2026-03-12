Faster, cheaper and better using Claude Code in VS Code to improve OpenClaw performance. Claude did this in less than 2 minutes - having OpenClaw do it for itself well - a lot longer - closer to 10 minutes and a lot more token usage costs for most setups. 

I know it *sounds* complicated but I find it so much faster and easier to do it this way. 

What you need: 
OpenClaw setup and running.
a Pro (or Max) Claude subscription (authorized already).
VS Code (or AntiGravity or Cursor) as the IDE

- Fire up VScode in your openclaw directory, 
- use the claude extension because it's nicer :-) 
- point claude at your openclaw (~/.openclaw/) with a prompt.

Here is the prompt I used: 

My OpenClaw config and global memory live at `~/.openclaw/`.​

Before changing anything, review the official memory docs here: [https://docs.openclaw.ai/concepts/memory.](https://docs.openclaw.ai/concepts/memory.)[](https://docs.openclaw.ai/cli/memory)​

Using those settings and best practices, please do all of the following:

1. Enable hybrid memory search
    
    - Turn on OpenClaw’s built‑in hybrid search so it uses both vector and keyword signals.
        
    - Tune the hybrid balance so semantic similarity is primary but strong exact‑match keywords still matter (adjust `vectorWeight` and `textWeight` accordingly).[](https://repovive.com/roadmaps/openclaw/skills-memory-automation/memory-configuration-options)​
        
    - Keep embeddings cached on disk for faster restarts if supported by this setup.[](https://repovive.com/roadmaps/openclaw/skills-memory-automation/memory-configuration-options)​
        
2. Enable temporal decay for memories
    
    - Turn on temporal decay so newer memories are weighted higher than older ones.
        
    - Use a half‑life of roughly 30/60/90 days so memories gradually decay but never disappear entirely, adjust according to results and your needs.​
        
    - Confirm that no ongoing manual cleanup is required; the decay should be handled automatically by the memory search layer.​
        
3. Configure time‑window behavior
    
    - Prefer memories from roughly the last 30 days when multiple candidates have similar semantic and keyword scores.
        
    - Allow older memories to surface when they are clearly the best semantic match, but bias ranking toward recent context first.​
        
4. Set up a compaction‑aware memory flush
    
    - Ensure that pre‑compaction “memory flush” is enabled so important context is written out to disk before compaction summaries run (e.g., `memoryFlush.enabled: true` or the nearest equivalent in this version).
        
    - Every 3 hours, run a compaction‑style maintenance pass that:
        
        - Scans recent session history and memory logs.
            
        - Extracts key learnings, decisions, and durable facts.
            
        - Appends those as concise bullets to a root‑level `LEARNINGS.md` file (creating it if it does not exist).
            
        - Updates any project or global memory files as needed (for example `MEMORY.md` under the project and `~/.openclaw/MEMORY.md`) so they stay in sync with the learnings.
            
5. Keep SOUL.md aligned with learnings
    
    - Update `SOUL.md` so that the agent explicitly:
        
        - Knows `LEARNINGS.md` exists and should be consulted for long‑term behavior and preferences.
            
        - Treats items in `LEARNINGS.md` as durable guidance that survives compaction and session resets.
            
    - Add a short internal instruction in `SOUL.md` telling the agent to periodically consolidate important recurring patterns from day‑to‑day memory into `LEARNINGS.md` rather than relying only on transient chat history.​
        
6. Quality and safety checks
    
    - After applying these changes, run a quick self‑check:
        
        - Verify that hybrid search is active (try a query that mixes fuzzy wording and exact terms).
            
        - Confirm temporal decay is working by comparing results from an older vs. a very recent memory.
            
        - Confirm that `LEARNINGS.md`, `MEMORY.md`, and `SOUL.md` are all being used and stay consistent after a simulated compaction event.
            
7. Suggest and implement additional improvements
    
    - If the docs recommend any other best‑practice toggles for memory stability and performance (for example: reasonable limits on memory chunk size, indexing strategy, or search result count), enable or tune them.
        
    - If there are plugin‑level or per‑project overrides (e.g., project‑level `MEMORY.md` or agent‑specific memory profiles), propose a sensible default layout for a multi‑project workflow and implement it where possible.
        

Use minimal, well‑commented changes to existing files, preserve any existing customizations, and briefly describe what you changed when you are done.

---
#### Here is the output from one session - an experiment with LEARNINGS.md (and yes SOUL is not the best way to do this, just an experiment - use TOOLS or AGENT instead). 


## What was changed

### openclaw.json — `memory.qmd`


|Setting|Before|After|
|---|---|---|
|`searchMode`|`"vsearch"`|`"hybrid"`|
|`query.hybrid`|—|vector 0.7 + BM25 0.3, 4× candidate pool|
|`temporalDecay`|—|enabled, **30-day half-life**|
|`mmr`|—|enabled, lambda 0.7 (relevance-biased diversity)|

`temporalDecay` uses exponential decay — a memory at day 30 scores at 50%, day 60 at 25%. Dated files (`YYYY-MM-DD.md`) get their age from their filename. Evergreen files (`LEARNINGS.md`, `MEMORY.md`, `SOUL.md`) bypass decay entirely.

### openclaw.json — `agents.defaults.compaction`

Added `memoryFlush` — fires silently when a session nears the context limit, instructing the agent to flush key learnings to `LEARNINGS.md` and update `SOUL.md` if needed before the session compacts.




In the terminal, navigate to your openclaw directory. for me that is 

```
cd ~/.openclaw/
code
```
to get VScode in on the game



then... 


Here is the output from one session - an experiment with LEARNINGS.md (and yes SOUL is not the best way to do this, just an experiment - use TOOLS or AGENT instead).

## What was changed

### openclaw.json — `memory.qmd`


|Setting|Before|After|
|---|---|---|
|`searchMode`|`"vsearch"`|`"hybrid"`|
|`query.hybrid`|—|vector 0.7 + BM25 0.3, 4× candidate pool|
|`temporalDecay`|—|enabled, **30-day half-life**|
|`mmr`|—|enabled, lambda 0.7 (relevance-biased diversity)|

`temporalDecay` uses exponential decay — a memory at day 30 scores at 50%, day 60 at 25%. Dated files (`YYYY-MM-DD.md`) get their age from their filename. Evergreen files (`LEARNINGS.md`, `MEMORY.md`, `SOUL.md`) bypass decay entirely.

### openclaw.json — `agents.defaults.compaction`

Added `memoryFlush` — fires silently when a session nears the context limit, instructing the agent to flush key learnings to `LEARNINGS.md` and update `SOUL.md` if needed before the session compacts.

### [cron/jobs.json](vscode-webview://1gqgve0ci5epkb4vcddv4g5u6ucpsk34jhfnnom7eo6fn1708q7g/.openclaw/cron/jobs.json)

New job: **Compaction Flush (every 3h, silent)**. Every 3 hours it reads recent memory, extracts durable insights, appends to `LEARNINGS.md` under the current date heading, and updates `SOUL.md` only if behaviour/identity guidance needs changing. No Telegram/Discord noise. OpenClaw auto-added a `staggerMs: 300000` to avoid thundering herd at exact top-of-hour.

### [workspace/LEARNINGS.md](vscode-webview://1gqgve0ci5epkb4vcddv4g5u6ucpsk34jhfnnom7eo6fn1708q7g/.openclaw/workspace/LEARNINGS.md)

New file. Append-only, auto-maintained. Seeded with the key rules already in `MEMORY.md` so the first flush has something to diff against.

### [workspace/SOUL.md](vscode-webview://1gqgve0ci5epkb4vcddv4g5u6ucpsk34jhfnnom7eo6fn1708q7g/.openclaw/workspace/SOUL.md)

Added a **Continuity** reading order: SOUL → MEMORY → LEARNINGS → today's log. Documents when to write to `LEARNINGS.md` mid-session (durable insight discovered) vs. when to touch `SOUL.md` (identity/behaviour-level change).