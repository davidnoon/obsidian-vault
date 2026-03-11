# Dashboard Features - Mission Control Structure

*Extracted from reference: Mission Control interface*  
*Date: 2026-03-08*

---

## Navigation Structure

### Sidebar Menu
1. **Tasks** — Task management & to-do lists
2. **Agents** — Active agent monitoring & status
3. **Content** — Content calendar & pipeline
4. **Approvals** — Pending reviews & sign-offs
5. **Council** — Strategic decision tracking
6. **Calendar** — Events & scheduling
7. **Projects** — Active project overview
8. **Memory** — Knowledge base & logs
9. **Docs** — Document management
10. **People** — Team & contact directory
11. **Office** — Workspace & tools
12. **Team** — Team coordination
13. **Feedback** — Feedback collection & analysis

---

## Agent Card Structure

Each agent displays as a card with:

### Header
- **Avatar** — Visual identifier (emoji/icon)
- **Name** — Agent identifier (e.g., "Charlie")
- **Role** — Function/department (e.g., "Infrastructure")

### Metadata Row
- **Owner** — Assigned operator/responsibility
- **Status** — Current state (Active/Idle/Paused)
- **Last Activity** — Timestamp of last action

---

## Live Activity Feed

**Section: "LIVE ACTIVITY"**
- Subtitle: "Last 24 hours"
- Real-time stream of agent actions
- Timestamps for all activities

---

## Dashboard Sections to Implement

### 1. Agent Status Board
- Card-based layout
- Real-time status indicators
- Quick actions (pause/resume/configure)
- Color-coded by role/function

### 2. Task Management
- Kanban or list view
- Status columns: Backlog → In Progress → Review → Done
- Agent assignment
- Priority levels

### 3. Content Pipeline
- Content calendar view
- Status tracking (idea → draft → review → published)
- Linked agent assignments

### 4. Approval Workflow
- Pending items queue
- Approval/rejection actions
- Deadline tracking
- Escalation rules

### 5. Council/Strategy
- High-level decisions
- Meeting notes
- Strategic projects
- Quarterly objectives

### 6. Calendar Integration
- Event scheduling
- Recurring agent tasks
- Deadline visibility
- Drag-drop rescheduling

### 7. Projects Overview
- Active project cards
- Progress bars
- Team assignments
- Budget/cost tracking

### 8. Memory & Knowledge
- Searchable logs
- Agent conversation history
- Decisions & rationale
- Learnings & insights

### 9. Document Hub
- File storage
- Version control
- Document-agent linking
- Quick access

### 10. People Directory
- Human team members
- Agent guardianship
- Communication channels
- Role assignments

### 11. Office/Workspace
- Tool integrations
- Environment health
- Resource monitoring
- System status

### 12. Team Coordination
- Group chat channels
- Thread-based discussions
- @mentions for agents
- Notification center

### 13. Feedback Loop
- Performance metrics
- Satisfaction scores
- Improvement suggestions
- Iteration tracking

---

## Technical Implementation Notes

### Data Sources
- OpenClaw session logs (`~/.openclaw/agents/*/sessions/`)
- Agent inbox/outbox status
- Cron job schedules
- Token usage (Cipher's cost system)

### Display Priority
**Phase 1:** Agents, Tasks, Live Activity
**Phase 2:** Calendar, Projects, Memory
**Phase 3:** Content, Approvals, Council, Docs, People

### Platform Options
- **Obsidian Dashboard** — Dev's automation + custom views
- **Discord Bot** — Status commands in channels
- **Web UI** — React/Vue connected to OpenClaw API
- **ACP-Generated** — Auto-built dashboard per request

---

## Next Steps
1. Define MVP scope (Phase 1 features)
2. Choose platform (Obsidian vs Web vs Discord)
3. Design agent card component
4. Build live activity feed parser
5. Create task board view

---

*Source: Mission Control interface reference image*  
*Related: OpenClaw AgentOS architecture*