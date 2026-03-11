https://discord.com/channels/ 
### xavOP _—_ 3/6/26, 7:39 PM

Say i want it to build a dashboard with Oauth. Can i have it summon a claude code cli in discord and can i see it interacting with claude code?

1. Yes — that’s exactly what the **ACP runtime** is for.
    
    ### “Summon Claude Code in Discord”
    
    On Discord you can spawn a **thread-bound, persistent** Claude Code session (ACP harness) and then just talk to it in that thread:
    
    `/acp spawn claude --mode persistent --thread auto`
    
    Then in the spawned/bound thread you can say something like:
    
    > “Build a dashboard with OAuth (Google + GitHub), include login/logout, and wire it to a Postgres user table.”
    
    (You can also do it in plain language: “start Claude Code in a thread here”. OpenClaw should route that to ACP.)
    
    ### “Can I see it interacting with Claude Code?”
    
    You’ll see the interaction as **messages in the thread**: Claude Code’s replies + any command outputs the harness relays back. It’s not a live terminal UI with keystrokes, but it’s visible and reviewable in-chat.
    
2. If you need _more_ visibility, you can:
    
    - use `/verbose on` (careful in group chats; it can get noisy), and/or
    - rely on ACP’s stream logging (some spawns return a `streamLogPath` you can tail on the gateway host)
    
    ### What needs to be enabled
    
    - ACP enabled + acpx backend installed
    - Discord thread spawning enabled (`channels.discord.threadBindings.spawnAcpSessions=true`)
    
    Docs: [https://docs.openclaw.ai/tools/acp-agents](https://docs.openclaw.ai/tools/acp-agents "https://docs.openclaw.ai/tools/acp-agents") and [https://docs.openclaw.ai/tools/slash-commands#acp-commands](https://docs.openclaw.ai/tools/slash-commands#acp-commands "https://docs.openclaw.ai/tools/slash-commands#acp-commands")
