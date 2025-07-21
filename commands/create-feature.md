# Create Feature Command

---
allowed-tools: Write, Read, Edit, MultiEdit, Bash(git:*), TodoWrite, Grep, Glob, Bash(mkdir:*), Bash(touch:*)
denied-tools: Bash(git push:*), Bash(rm -rf:*)
description: Create a new feature with proper structure, tests, and documentation
argument-hint: <feature-name> [description]
---

## Context

- Current branch: `!git branch --show-current`
- Project type: `!ls package.json Cargo.toml go.mod pyproject.toml 2>/dev/null | head -1`
- Test framework: `!grep -E "(jest|mocha|pytest|testing)" package.json pyproject.toml go.mod 2>/dev/null | head -3`

## Your task

Create a new feature following TDD principles and project best practices.

## Response Language

Please respond in Japanese (日本語で返信してください)

## Feature Development Workflow

### 1. **Requirements Analysis**
- Parse feature name and description from input
- Identify feature scope and boundaries
- List acceptance criteria
- Consider edge cases and error scenarios

### 2. **Architecture Planning**
- Determine component/module structure
- Plan data flow and state management
- Identify dependencies and interfaces
- Consider scalability and maintainability

### 3. **Test-First Development**
```
1. Write failing tests first
2. Implement minimal code to pass tests
3. Refactor for quality
4. Repeat until feature is complete
```

### 4. **Implementation Checklist**
- [ ] Create feature branch: `feature/<feature-name>`
- [ ] Set up file structure
- [ ] Write unit tests
- [ ] Implement core functionality
- [ ] Add error handling
- [ ] Write integration tests
- [ ] Add logging/monitoring
- [ ] Update documentation
- [ ] Create usage examples

### 5. **Code Quality Standards**
- Follow repository coding conventions
- Ensure type safety (TypeScript/Flow/etc.)
- Add meaningful comments for complex logic
- Keep functions small and focused
- Use descriptive variable names

### 6. **Documentation Requirements**
- API documentation with examples
- README updates if needed
- Inline code comments
- Migration guide if breaking changes

## Output Structure

1. **Feature Planning Summary**
   - What: Feature description
   - Why: Business value
   - How: Technical approach

2. **Created/Modified Files**
   - List all files with their purpose
   - Show directory structure

3. **Next Steps**
   - How to test the feature
   - Integration points
   - Deployment considerations

## Example Usage

```
/create-feature user-authentication "Add JWT-based authentication system"
/create-feature dark-mode "Implement system-wide dark mode toggle"
/create-feature data-export "Allow users to export data in CSV/JSON formats"
```

## User additional instructions

$ARGUMENTS