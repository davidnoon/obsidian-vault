
Krill posted:  https://discord.com/channels/1456350064065904867/1478992387815510120
using the custom skill approach: 
1. OpenClaw will **refuse to inject “sensitive-looking” env vars** (API keys, tokens, etc.) via `skills.entries.<skill>.env` / `.apiKey` **unless the skill explicitly declares that env var in its metadata** (`metadata.openclaw.requires.env` and/or `metadata.openclaw.primaryEnv`). You copied `openai-whisper-api` but switched the key name to `GROQ_API_KEY` — if you didn’t also update the metadata, OpenClaw treats that injection as suspicious and blocks it.
    
    ### Fix 1: Update your skill metadata to declare the Groq key
    
    In your custom `SKILL.md` frontmatter, make sure you have something like:
    
    `metadata:   {     "openclaw": {       "requires": { "bins": ["curl"], "env": ["GROQ_API_KEY"] },`
    
2.       `"primaryEnv": "GROQ_API_KEY"     }   }`
    
    (Do the same for `agentmail` if you’re trying to inject `AGENTMAIL_API_KEY` — its metadata must declare it too.)
    
    ### Fix 2: Set the key in a supported place
    
    Any of these are fine:
    
    - `~/.openclaw/.env` on the **gateway host**:
        
        `GROQ_API_KEY=...`
        
    - `~/.openclaw/openclaw.json`:
    
3.   `{     env: { vars: { GROQ_API_KEY: "..." } },     // or:     skills: {       entries: {         "groq-whisper": {           apiKey: { source: "env", provider: "default", id: "GROQ_API_KEY" }         }       }     }   }`
      
    
    Docs: [https://docs.openclaw.ai/tools/skills-config](https://docs.openclaw.ai/tools/skills-config "https://docs.openclaw.ai/tools/skills-config") and [https://docs.openclaw.ai/help/environment](https://docs.openclaw.ai/help/environment "https://docs.openclaw.ai/help/environment")
    
    ### Fix 3: Refresh the session (skills are snapshotted)
    
4. Skills eligibility is snapshotted when the session starts. After changing SKILL.md/config:
    
    - restart the gateway **or**
    - send `/new` in Telegram (simplest)
    
    ### About the Telegram errors (`message read not supported`, `No session found: groq-whisper`)
    
    - `message.read` isn’t supported on Telegram, so if your skill/workflow tries to “read the last message / fetch the last attachment”, it’ll fail. Telegram bots don’t get history the way Discord does.
    - The `sessions.resolve … No session found: groq-whisper` / `session_status … Unknown sessionId: groq-whisper` typically happens when something tries to treat the **skill name** as a **session id** (often after a failed run / bad command routing). Fixing eligibility + starting a fresh session usually makes this go away.
    
    ### Quick sanity check commands
    
    Run these on the gateway host and paste the output if it still misbehaves:
    
    `openclaw --version openclaw skills info groq-whisper openclaw skills check`
    
5. If you also paste your **custom skill frontmatter** + the `skills.entries.groq-whisper` part of your config (redact the key), I can tell you exactly why Telegram invocation is falling back into those unsupported tool calls.
openclaw --version
openclaw skills info groq-whisper
openclaw skills check

(maybe: # Get plain text output
{baseDir}/scripts/transcribe.sh /path/to/audio.ogg --response_format text

# Change model
{baseDir}/scripts/transcribe.sh /path/to/audio.m4a --model whisper-large-v3

# Change language and prompt
{baseDir}/scripts/transcribe.sh /path/to/audio.m4a --language fr --prompt "Un petit secret."

# Disable timestamps in verbose_json
{baseDir}/scripts/transcribe.sh /path/to/audio.m4a --no-timestamps)

media: { audio: { enabled: true, models: [ { provider: "groq", model: "whisper-large-v3" }, ], echoTranscript: true, }, },

put :
GROQ_API_KEY=gsk_YOUR_KEY_HERE
in nano ~/.openclaw/.env 