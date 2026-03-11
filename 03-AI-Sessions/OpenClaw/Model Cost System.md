Folders: 
model cost system
/home/david/.openclaw/workspace/agents/cipher/shared/outbox/model-cost-system/
├── cost-tracker.py          # Main Python script
├── alert-config.json        # Budget thresholds
├── daily-report.sh          # Daily report generator
├── weekly-report.sh         # Weekly report generator
├── discord-alert.sh         # Discord webhook alerts
├── setup-cron.sh            # Cron installer
├── MODEL_COSTS.md           # Pricing reference
├── costs.db                 # SQLite database
├── reports/                 # Generated reports
│   ├── daily-2026-03-08.md
│   └── weekly-2026-03-02-to-2026-03-08.md
└── logs/                    # (created on first run)
    ├── cron.log
    ├── alerts.log
    └── alerts-triggered.log


Cron setup. 


To run it:
To Discord-enable alerts:
Create webhook: Discord → Server Settings → Integrations → Webhooks,
Save URL to: model-cost-system/discord-webhook-url.txt,
OR set env: export DISCORD_COST_ALERT_WEBHOOK=https://discordapp.com/api/webhooks/1480147511879536684/aqhp-Dvvg8231FQw_TlYjs02iqb5kZrSX8zaBev8dbOyKbD2DYZmmiinUQ-ag93ckCJX
,

The alert script (discord-alert.sh) automatically detects the webhook and sends formatted embeds to your server when budgets exceed thresholds.


#### Manually:
cd ~/agents/cipher/shared/outbox/model-cost-system
python3 cost-tracker.py alerts          # Check now
bash daily-report.sh                    # Generate report now
## quick access:
cd ~/agents/cipher/shared/outbox/model-cost-system
### or full path:
cd /home/david/.openclaw/workspace/agents/cipher/shared/outbox/model-cost-system

