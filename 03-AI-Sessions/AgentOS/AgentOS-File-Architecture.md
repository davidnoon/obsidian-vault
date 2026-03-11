# AgentOS File Architecture

*Created: 2026-03-08 by Alfred*  
*Purpose: Map where agents store, share, and retrieve information*

---

## 🗺️ Overview

AgentOS uses a **distributed file system** where each agent has private workspace + shared inboxes/outboxes for handoffs. All agents read from `/memory/` for continuity.

**Key Principle:** Agents never directly access each other's private files. Communication happens through `/shared/` directories.

---

## 📁 Directory Structure

```
~/.openclaw/workspace/                          # Main workspace
├── AGENTS.md                                   # System rules
├── SOUL.md                                     # Alfred's identity
├── USER.md                                     # David's context
├── TODO.md                                     # 🔗 [[TODOs|Master task list]]
├── MEMORY.md                                   # Long-term memory
├── HEARTBEAT.md                                # 20-min check routine
├── .openclaw/                                  # System config
│   ├── openclaw.json                           # 🔗 [[Config|Gateway config]]
│   ├── crons/                                  # Scheduled jobs
│   │   ├── agent-heartbeats.sh                 # 🔗 [[Heartbeats|Heartbeat runner]]
│   │   └── todo-checker.sh                     # 🔗 [[TODO-Checker|Task scanner]]
│   └── startup-routine.sh                      # 🔗 [[Startup|Boot protocol]]
│
├── memory/                                     # 🧠 Daily logs
│   ├── YYYY-MM-DD.md                           # Today's session log
│   └── context-next-session.md                 # 🔗 [[Next-Session|Resume guide]]
│
├── agents/                                     # 🤖 Agent workspaces
│   ├── sage/                                   # Research agent
│   │   ├── SOUL.md                             # Identity
│   │   ├── IDENTITY.md                         # Role definition
│   │   ├── MEMORY.md                           # Sage's memory
│   │   ├── HEARTBEAT.md                        # 20-min checks
│   │   ├── README.md                           # Sage's docs
│   │   ├── models/                             # Research outputs
│   │   ├── data/                               # Structured data
│   │   ├── scripts/                            # Custom tools
│   │   └── shared/                             # 📬 Handoff layer
│   │       ├── inbox/                          # 📥 Tasks waiting
│   │       │   └── research-mercury2.md        # 🔗 [[Mercury2-Task|Current research]]
│   │       ├── outbox/                         # 📤 Results ready
│   │       ├── docs/                           # 📄 Shared documents
│   │       └── projects/                       # 🗂️ Active projects
│   │
│   ├── maya/                                   # Content agent
│   │   ├── SOUL.md
│   │   ├── IDENTITY.md
│   │   ├── MEMORY.md
│   │   ├── HEARTBEAT.md
│   │   └── shared/
│   │       ├── inbox/                          # 📥 Content requests
│   │       ├── outbox/                         # 📤 Drafts ready
│   │       ├── docs/                           # Style guides, templates
│   │       └── projects/                       # Active content
│   │
│   ├── gary/                                   # Marketing agent
│   │   ├── SOUL.md
│   │   ├── IDENTITY.md
│   │   ├── MEMORY.md
│   │   ├── HEARTBEAT.md
│   │   └── shared/
│   │       ├── inbox/                          # 📥 Marketing tasks
│   │       ├── outbox/                         # 📤 Campaigns ready
│   │       ├── docs/                           # Strategy docs
│   │       └── projects/
│   │
│   ├── dev/                                    # Coding agent
│   │   ├── SOUL.md
│   │   ├── IDENTITY.md
│   │   ├── MEMORY.md
│   │   ├── HEARTBEAT.md
│   │   ├── data/
│   │   │   └── model-performance-db.json       # 🔗 [[Model-DB|Cost tracking]]
│   │   ├── scripts/
│   │   │   ├── workflow-tracker.js             # 🔗 [[Tracker|Usage tracker]]
│   │   │   ├── update-model-prices.js          # 🔗 [[Price-Updater|Pricing script]]
│   │   │   └── delayed-score-checker.js        # 🔗 [[Score-Checker|Quality checker]]
│   │   ├── cron/
│   │   │   ├── cost-review-cron.sh              # 🔗 [[Cost-Cron|Review job]]
│   │   │   └── model-update-cron.sh            # 🔗 [[Price-Cron|Price update job]]
│   │   └── shared/
│   │       ├── inbox/                          # 📥 Coding tasks
│   │       │   └── task-dev-handoff.md         # 🔗 [[Dev-Task|Current work]]
│   │       ├── outbox/                         # 📤 Code/PRs ready
│   │       ├── docs/                           # Architecture docs
│   │       └── projects/                       # Active development
│   │
│   ├── sam/                                    # Social media agent
│   │   ├── SOUL.md
│   │   ├── IDENTITY.md
│   │   ├── MEMORY.md
│   │   ├── HEARTBEAT.md
│   │   └── shared/
│   │       ├── inbox/                          # 📥 Social tasks
│   │       ├── outbox/                         # 📤 Posts ready
│   │       ├── docs/                           # Brand guidelines
│   │       └── projects/
│   │
│   └── cipher/                                 # Security/infra agent
│       ├── SOUL.md
│       ├── IDENTITY.md
│       ├── MEMORY.md
│       ├── HEARTBEAT.md
│       ├── README.md                           # 🔗 [[Cipher-README|System docs]]
│       ├── models/
│       │   └── agent-model-registry.json       # 🔗 [[Model-Registry|15 models]]
│       ├── data/
│       │   ├── workflow-results.json           # 🔗 [[Workflow-Schema|Tracking schema]]
│       │   └── model-performance-db.json       # 🔗 [[Performance-DB|Agent profiles]]
│       ├── scripts/
│       │   ├── workflow-tracker.js             # 🔗 [[Workflow-Tracker|Usage logger]]
│       │   ├── update-model-prices.js          # 🔗 [[Price-Updater|API fetcher]]
│       │   └── delayed-score-checker.js        # 🔗 [[Delayed-Checker|Outcome scorer]]
│       ├── reports/                            # 📊 Generated reports
│       ├── logs/                               # 📋 Execution logs
│       ├── cron/
│       │   ├── cost-review-cron.sh             # 🔗 [[Cost-Review|Tue/Thu 9am]]
│       │   └── model-update-cron.sh            # 🔗 [[Model-Update|Sat 3am]]
│       └── shared/
│           ├── inbox/                          # 📥 Security tasks
│           ├── outbox/                         # 📤 Reports/alerts
│           ├── docs/                           # Security policies
│           └── projects/                       # Infrastructure projects
│
└── shared/                                     # 🌐 Global shared
    ├── inbox/                                  # 📥 System-level tasks
    ├── outbox/                                 # 📤 Cross-agent results
    ├── docs/                                   # 📄 Global documentation
    └── projects/                               # 🗂️ Multi-agent projects
```

---

## 🔄 Information Flow Patterns

### Pattern 1: Alfred → Agent Task Handoff

```
1. Alfred detects task (TODO.md, message, heartbeat)
2. Alfred creates task file:
   → /agents/<agent>/shared/inbox/task-<name>.md
3. Alfred notifies agent (Discord, or agent checks heartbeat)
4. Agent picks up task from inbox
5. Agent works, stores results in:
   → /agents/<agent>/shared/outbox/
6. Agent notifies Alfred (Discord or outbox signal)
7. Alfred moves result to appropriate location
```

**Example:** Mercury-2 research task
- [[Mercury2-Task|Created by Alfred in Sage's inbox]]
- Sage researches, writes analysis to outbox
- Alfred reviews, decides on model switch

---

### Pattern 2: Agent-to-Agent Collaboration

```
1. Agent A needs help from Agent B
2. Agent A creates request in:
   → /agents/<agent-b>/shared/inbox/
3. Agent B's heartbeat picks it up
4. Agent B completes work
5. Agent B stores result in their outbox
6. Agent A checks for completion (polling or notification)
```

**Example:** Dev needs content for dashboard
- Dev puts request in Maya's inbox
- Maya writes copy, puts in outbox
- Dev uses it in dashboard

---

### Pattern 3: Multi-Agent Project

```
1. Alfred creates project in /shared/projects/<name>/
2. Project file has task list, deadlines
3. Each agent claims tasks, updates status
4. Shared /docs/ for reference materials
5. Agent-specific work in their /shared/inbox/
```

**Example:** Model Cost System project
- Project: `/agents/cipher/shared/outbox/task-dev-handoff.md`
- Coordination: Discord #coding-projects
- Results: Dev updates registry, dashboard

---

## 📝 File Naming Conventions

### Inbox Tasks
```
task-<agent>-<description>.md       # task-dev-model-system.md
urgent-<description>.md              # urgent-bug-fix.md
research-<topic>.md                  # research-mercury2.md
content-<type>-<client>.md           # content-blog-savie.md
code-<project>-<feature>.md          # code-dashboard-api.md
```

### Outbox Results
```
result-<task-id>.md                  # result-abc123.md
draft-<description>-v1.md            # draft-analysis-v1.md
report-<topic>-YYYY-MM-DD.md        # report-costs-2026-03-08.md
pr-<project>-<description>.md       # pr-model-registry.md
```

### Shared Documents
```
spec-<project>.md                    # spec-website-redesign.md
template-<type>.md                   # template-blog-post.md
policy-<topic>.md                    # policy-model-usage.md
guide-<process>.md                  # guide-agent-handoff.md
```

---

## 🔗 Key Files Quick Reference

### Daily Operations
- [[../../TODO.md|Master TODO]] — All active tasks
- [[../../HEARTBEAT.md|Alfred's Heartbeat]] — 20-min routine
- [[../memory/context-next-session.md|Next Session Context]] — Resume guide
- [[../../../../.openclaw/startup-routine.sh|Startup Routine]] — Boot sequence

### Model Cost System
- [[../agents/cipher/models/agent-model-registry.json|Model Registry]] — 15 models
- [[../agents/cipher/data/model-performance-db.json|Performance DB]] — Agent profiles
- [[../agents/cipher/scripts/workflow-tracker.js|Workflow Tracker]] — Usage logger
- [[../agents/cipher/shared/outbox/task-dev-handoff.md|Dev Task]] — Current work
- [[../agents/sage/shared/inbox/research-mercury2.md|Mercury-2 Research]] — Sage's task

### Agent Configs
- [[../agents/sage/HEARTBEAT.md|Sage Heartbeat]] — Research routine
- [[../agents/dev/HEARTBEAT.md|Dev Heartbeat]] — Coding routine
- [[../agents/maya/HEARTBEAT.md|Maya Heartbeat]] — Content routine

---

## 🎯 Best Practices

### For Alfred (Main)
- ✅ Check all `/shared/inbox/` every heartbeat
- ✅ Move completed results to appropriate locations
- ✅ Update `memory/YYYY-MM-DD.md` with decisions
- ✅ Tag agents in Discord for urgent tasks

### For Specialized Agents
- ✅ Check inbox every 20 minutes via heartbeat
- ✅ Write clear, actionable results to outbox
- ✅ Notify Alfred when task completes (Discord or file)
- ✅ Update own MEMORY.md with learnings

### For All Agents
- ✅ Never modify another agent's private files
- ✅ Use `/shared/inbox/` for handoffs only
- ✅ Keep task files under 500 tokens (cheap to route)
- ✅ Link related files with `[[wikilinks]]`

---

## 🚨 Anti-Patterns to Avoid

| ❌ Bad | ✅ Good |
|--------|----------|
| Agent A edits Agent B's SOUL.md | Agent A puts task in B's inbox |
| Store sensitive data in /shared/ | Store in agent's private /data/ |
| Long tasks in inbox | Break into subtasks, link together |
| Outbox without notification | Outbox + Discord ping or file signal |
| Alfred does research | Alfred tasks Sage, uses result |

---

## 🔍 Find Anything

**Search patterns:**
- Task files: `task-*.md` in any `/inbox/`
- Results: `result-*.md` in any `/outbox/`
- Reports: `report-*.md` in `/reports/`
- Today: `memory/2026-03-*.md` (current date)

**Quick commands:**
```bash
# Find all pending tasks
find ~/.openclaw/workspace/agents -name "task-*.md" -path "*/inbox/*"

# Find recent results
find ~/.openclaw/workspace/agents -name "result-*.md" -path "*/outbox/*" -mtime -1

# Check today's memory
ls -la ~/.openclaw/workspace/memory/$(date +%Y-%m-%d)*
```

---

## 📝 Changelog

| Date | Change |
|------|--------|
| 2026-03-08 | Created architecture doc, mapped all agent directories |
| 2026-03-08 | Established inbox/outbox naming conventions |
| 2026-03-08 | Linked to active projects (Model Cost, Mercury-2) |

---

*This is a living document. Update as the system evolves.*