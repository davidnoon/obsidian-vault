

## 🔁 `/new` — Fresh Session

**What it does:** Creates a new conversation thread, clears context completely

**Use when:**
- ✅ Starting a **new topic** unrelated to previous work
- ✅ Want to **reset context** to save tokens ( pricey conversations)
- ✅ Switching between **different modes** (coding vs research vs planning)
- ✅ Previous session hit **token limit** or became sluggish
- ✅ Want **isolated conversation** (won't see previous messages)

**Result:** Alfred wakes up fresh, reads SOUL.md, USER.md, MEMORY.md like it's the first time

---

## 🔄 `/restart` — Gateway Reboot

**What it does:** Restarts the OpenClaw Gateway service (SIGUSR1)

**Use when:**
- ✅ **Config changes** need to take effect (edited `openclaw.json`)
- ✅ **Plugins/skills** need reload
- ✅ **Cron jobs** or timers aren't firing
- ✅ **Memory/storage** seems corrupted
- ✅ **Sessions stuck** or hanging

**What I fixed today:**
- Added `"tools.sessions.visibility": "all"` — needed restart
- Agent bindings not working — needed restart

**Downtime:** ~5-10 seconds

---

## 📦 `/compact` — Context Compression

**What it does:** Summarizes old conversation history, replaces with condensed version

**Use when:**
- ✅ **Approaching token limit** (262k context)
- ✅ **Sluggish performance** on long conversations  
- ✅ **Want to keep conversation** but reduce memory footprint
- ✅ **Summary is acceptable** — some detail lost, intent preserved

**Example:**
- 50,000 tokens of back-and-forth → Compacted to 500-token summary
- Keeps gist: "We were fixing Discord bindings and Dev handoff"
- Loses: Exact phrasing, failed attempts, partial code

**Result:** Same session, fresh start, smaller context

---

## 🎯 Decision Framework

| Situation | Use | Why |
|-----------|-----|-----|
| New project, different task | `/new` | Clean slate |
| 40k+ tokens, getting slow | `/compact` | Keep conversation, reduce size |
| Edited config, skills broken | `/restart` | Reload system |
| Working on same thing, just big | `/compact` | Preserve progress |
| Want to forget this conversation happened | `/new` | Full reset |
| Gateway errors, failed tools | `/restart` | Fix system |

---

## My Recommendation

**Daily workflow:**
- Morning: `/compact` or `/new` (clean start)
- During work: Stay in session
- End of day: `/compact` (keep summary, shed details)
- Config changes: `/restart`

---

The **difference between what happens automatically** vs **what I've been doing manually**. 

## 📝 Memory File Types

| File | Purpose | Update Trigger |
|------|---------|----------------|
| `memory/YYYY-MM-DD.md` | Daily raw log | **Manual** — I write context here |
| `MEMORY.md` | Curated long-term | **Manual** — Only when I update it |
| Session JSONL | Full transcript | **Auto** — Every message via session hook |
| QMD index | Hybrid search | **Auto** — Every 15 min (config in openclaw.json) |

## 🔄 Auto-Write Behaviors

### **Session Transcripts** (Automatic)
```
Location: ~/.openclaw/agents/main/sessions/*.jsonl
Trigger: Every message, immediately
Contains: Everything — tools, results, metadata
Access: System uses this for /history
```

### **QMD Index** (Automatic)
```
From your config:
"qmd": {
  "update": {
    "interval": "15m",     // Re-index every 15 min
    "debounceMs": 15000
  }
}
```

Every 15 minutes, it re-indexes:
- MEMORY.md
- memory/*.md
- Session transcripts (optional)

### **Daily Memory Files** (Manual, by me)
What I've been doing:
- Explicitly writing to `memory/2026-03-08.md` at end of session
- Or you telling me "remember this"
- Not automatic unless I do it

## 🎯 When I Actually Write Memory

| Action                  | What Gets Written    | Where                   |
| ----------------------- | -------------------- | ----------------------- |
| `/new` or `/restart`    | ❌ Nothing            | Session starts fresh    |
| `/compact`              | ❌ Nothing            | Just compresses context |
| End of long session     | Maybe summary        | If I choose to write it |
| You say "remember this" | ✅ That specific info | memory/YYYY-MM-DD.md    |
| I complete a milestone  | ✅ Project status     | MEMORY.md + daily file  |

## ⚠️ The Gap

**What's NOT happening:**
- Automatic daily summaries
- Auto-capture of decisions
- Session-to-session memory persistence (unless I write it)

**What SHOULD happen:**
- Every major decision → memory/YYYY-MM-DD.md
- Every project completion → MEMORY.md
- End of day → Summarize to daily file



