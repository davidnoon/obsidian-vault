from Fabrizio @linuz90

If you're using
[@openclaw](https://x.com/openclaw)

on Telegram, you need to set up forum topics. Turns one messy chat into organized topics. Each with its own isolated LLM session. Each topic gets its own LLM session too  
Setup is easy: Open BotFather and enable "Threaded Mode" for your bot. Then tell your agent: → Set up forum topics in our chat. Call getForumTopicIconStickers to get available emoji IDs, then createForumTopic for each one with icon_custom_emoji_id. Important: send a message inside each topic right after creating it, otherwise it won't show up in Telegram. Then after you're happy with the topics, tell it to route all cron jobs and heartbeat messages to the most relevant topic. Now when I forward emails to my bot it acts on them in relevant topics. Sim race prep lands in Racing. Morning briefing goes to Life. Completely changed my experience with it.