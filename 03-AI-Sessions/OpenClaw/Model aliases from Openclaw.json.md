
"models": {
        "openrouter/qwen/qwen3.5-35b-a3b": {
          "alias": "qwen35-35b"
        },
        "openrouter/x-ai/grok-4.1-fast": {
          "alias": "grok"
        },
        "openrouter/openai/gpt-5.3-codex": {
          "alias": "codex"
        },
        "openrouter/google/gemini-3-flash-preview": {
          "alias": "gflash"
        },
        "openrouter/moonshotai/kimi-k2.5": {
          "alias": "kimi"
        },
        "openrouter/minimax/minimax-m2.5": {
          "alias": "minimax"
        },
"openrouter/openai/gpt-4o-mini": {
          "alias": "gpt4omini"
        },
        "openrouter/google/gemini-2.0-flash-001": {
          "alias": "gflash2"
        },
        "openrouter/arcee-ai/trinity-large-preview:free": {
          "alias": "trinity"
        },
        "openrouter/z-ai/glm-5": {
          "alias": "glm5"
        },
        "openrouter/google/gemini-3.1-flash-lite-preview": {
          "alias": "flash31"
        },
        "openrouter/google/gemini-3.1-flash-image-preview": {
          "alias": "nano"
        },
        "openrouter/qwen/qwen3.5-122b-a10b": {
          "alias": "qwen35"
        },
        "openrouter/anthropic/claude-sonnet-4.6": {
          "alias": "sonnet46"
        },
        "openrouter/openai/gpt-audio-mini": {
          "alias": "audio2"
},
        "openrouter/openai/text-embedding-3-small": {
          "alias": "embedsmall"
        },
        "openrouter/inception/mercury-2": {
          "alias": "mercury"
        }
      },
      "compaction": {
        "mode": "safeguard"
      },
      "thinkingDefault": "low"
    },
    "list": [
      {
        "id": "main",
        "default": true,
        "model": "openrouter/qwen/qwen3.5-35b-a3b"
      },
      {
        "id": "coding",
        "model": "openrouter/qwen/qwen3.5-122b-a10b",
