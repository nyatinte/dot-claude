---
allowed-tools: Bash(mkdir:*), Write(*.claude_workflow/*), Read(*.claude_workflow/*), Edit(*.claude_workflow/*), MultiEdit(*.claude_workflow/*), TodoWrite
denied-tools: Bash(rm -rf:*), Bash(sudo:*)
description: Execute structured 4-phase workflow for complex development tasks
---

## Context

- Task input: $ARGUMENTS
- Working directory: `!pwd`
- ultrathink

## Your task

Execute a structured 4-phase workflow combining Kiro's documentation rigor with CLAUDE.md's systematic approach.

### Phase 1: Requirements Definition

1. **Setup directory structure**:
   - Create `.claude_workflow/` directory if it doesn't exist
   - Check if `.claude_workflow/complete.md` exists and reference it

2. **Create requirements document** in `.claude_workflow/requirements.md`:
   - Task overview from: $ARGUMENTS
   - Objectives and success criteria
   - Current state analysis
   - Functional/non-functional requirements
   - Constraints and assumptions
   - Questions for clarification

3. **Get confirmation**: "要件定義フェーズが完了しました。内容を確認していただき、設計フェーズに進んでよろしいですか？"

### Phase 2: Design

1. **Read requirements**: 必ず`.claude_workflow/requirements.md`を読み込んでから開始

2. **Create design document** in `.claude_workflow/design.md`:
   - Architecture and component structure
   - Technology choices with rationale
   - Data flow and interactions
   - Potential challenges and mitigation strategies

3. **Get confirmation**: "設計フェーズが完了しました。内容を確認していただき、タスク化フェーズに進んでよろしいですか？"

### Phase 3: Task Breakdown

1. **Read design**: 必ず`.claude_workflow/design.md`を読み込んでから開始

2. **Create task list** in `.claude_workflow/tasks.md`:
   - Detailed task list with dependencies
   - Priority and complexity estimates
   - Testing approach for each component
   - Rollback strategies

3. **Get confirmation**: "タスク化フェーズが完了しました。実装計画を確認していただき、実行フェーズに進んでよろしいですか？"

### Phase 4: Execution

1. **Read tasks**: 必ず`.claude_workflow/tasks.md`を読み込んでから開始

2. **Execute implementation**:
   - Use TodoWrite to track task progress
   - Execute tasks sequentially
   - Update `.claude_workflow/tasks.md` with progress
   - Report each task completion

3. **Follow execution rules**:
   - Make small, incremental changes
   - Resolve errors before proceeding
   - No parallel task execution
   - No features beyond specifications

## Key Principles

- Each phase requires explicit user approval
- Documentation is the source of truth
- Systematic approach ensures quality
- Clear separation between planning and execution

## User additional instructions

$ARGUMENTS