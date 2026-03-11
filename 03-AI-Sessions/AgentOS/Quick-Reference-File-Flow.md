# Quick Reference: AgentOS File Flow

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

## 📝 Naming Conventions

### Inbox Tasks
- `task-<agent>-<description>.md`
- `urgent-<description>.md`
- `research-<topic>.md`
- `content-<type>-<client>.md`
- `code-<project>-<feature>.md`

### Outbox Results
- `result-<task-id>.md`
- `draft-<description>-v1.md`
- `report-<topic>-YYYY-MM-DD.md`

### Shared Documents
- `spec-<project>.md`
- `template-<type>.md`
- `policy-<topic>.md`
- `guide-<process>.md`

---

## 🔗 Active Projects Quick Links

| Project | Status | Location | Agent |
|---------|--------|----------|-------|
| Model Cost System | In Progress | [[../agents/cipher/shared/outbox/task-dev-handoff.md\|Dev Task]] | Dev |
| Mercury-2 Research | Queued | [[../agents/sage/shared/inbox/research-mercury2.md\|Sage Task]] | Sage |

---

*Reference for: Information architecture and file flows in AgentOS*