Good and 'Cheap'
	Brain: Kimi K2.5
	Heartbeat: Haiku
	Coding: Minimax 2.1 (...?)
	Websearch: Deepseek v3
	Content: Kimi K2.5
	Voice: ChatGPT 4o Realtime
	Image Understanding: Gemini 2.5 Flash

update on [[March 8]]. 
openrouter/google/gemini-3.1-flash-lite-preview as "flash31"; openrouter/google/gemini-3.1-flash-image-preview as "nano"; openrouter/qwen/qwen3.5-122b-a10b as "qwen35"; openrouter/anthropic/claude-sonnet-4.6 as "sonnet46"; openrouter/openai/gpt-audio-mini as "audio2"; openrouter/google/gemini-3-pro-image-preview as "nanopro"; openrouter/openai/text-embedding-3-small as "embedsmall"; and openrouter/inception/mercury-2 as "mercury";
models added. 

let's create a static lookup file,  table or csv in the workspace directory of yourself or cipher to track various aspects of the models. in the file we list each of the models in our json file, costs and 'capabilities' of each. map these models to the typical (and changing task requirements, skills etc of all the agents). add a cron job to update this information each Saturday early morning. add another cron to create a review process 2 times a week with a goal to keep the cost of each workflow, agent etc down but get the best results given our tight budget. 
For example planning and first drafts of images, documents (content and writing) may use a 'better model' for now kimi K2.5 is fine. instructions, tool calls and prompting of other tools should be done carefully to create templates that each agent manages and refines over time - including templates for the tool calls and instructions. 
ask me clarifying questions. 


is ACP enabled? can you call other agents like antigravity, claude or opencode? 


Models (openrouter · 🔑 api-key (openrouter:default)) — showing 1-17 of 17 (page 1/1)
- openrouter/anthropic/claude-sonnet-4.6
- openrouter/arcee-ai/trinity-large-preview:free
- openrouter/google/gemini-2.0-flash-001
- openrouter/google/gemini-3-flash-preview
- openrouter/google/gemini-3-pro-image-preview
- openrouter/google/gemini-3.1-flash-image-preview
- openrouter/google/gemini-3.1-flash-lite-preview
- openrouter/inception/mercury-2
- openrouter/minimax/minimax-m2.5
- openrouter/moonshotai/kimi-k2.5
- openrouter/openai/gpt-4o-mini
- openrouter/openai/gpt-5.3-codex
- openrouter/openai/gpt-audio-mini
- openrouter/openai/text-embedding-3-small
- openrouter/qwen/qwen3.5-122b-a10b
- openrouter/x-ai/grok-4.1-fast
- openrouter/z-ai/glm-5

Switch: /model <provider/model>
All: /models openrouter all

