---
allowed-tools: Bash(git diff:*), Bash(git diff --staged:*), Bash(git show:*), Bash(git log:*), Read(*), Write(review.md), Glob(**/*), Grep
denied-tools: Bash(git push:*), Bash(git commit:*), Edit(*), MultiEdit(*)
description: Perform comprehensive code review on current changes
---

## Context

- Current branch: `!git branch --show-current`
- Git status: `!git status --short`
- ultrathink

## Your task

Perform a thorough code review of the current changes and generate a detailed review report.

## Response Language

Please respond in Japanese (日本語で返信してください)

### 1. **Identify changes to review**:

Priority order for identifying diffs:
1. User instructions from $ARGUMENTS
2. Git diff (unstaged changes): `git diff`
3. Staged changes: `git diff --staged`
4. Latest commit: `git show HEAD`

### 2. **Review criteria**:

Apply the following review perspectives in order:

#### Primary criteria:
- **Repository guidelines**: Check compliance with this repository's coding guidelines (CLAUDE.md, .editorconfig, linting rules)

#### General programming principles:
- **SOLID principles**: Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion
- **DRY (Don't Repeat Yourself)**: Avoid code duplication
- **KISS (Keep It Simple, Stupid)**: Favor simplicity over complexity
- **YAGNI (You Aren't Gonna Need It)**: Don't add unnecessary features
- **Clean Code principles**: Meaningful names, small functions, proper abstractions
- **Code readability**: Clear structure, consistent formatting, self-documenting code

### 3. **Review approach**:

- Be objective and constructively critical
- Focus on actionable improvements
- Prioritize issues by impact and severity

### 4. **Generate review report**:

Create `review.md` with the following structure:

```markdown
# Code Review Report

## Summary
[Overall assessment of the changes, highlighting key strengths and areas for improvement]

## Issues to Address

### Issue #1: [Issue Title]
- **Overview**: [Brief description of the issue]
- **Priority**: Critical | High | Medium | Low
- **Why**: [Explanation of why this is an issue]
- **How to fix**: [Specific technical solution with code examples if applicable]
- **Agent prompt**: 
  ```
  Fix [specific issue] in [file:line]. 
  Current implementation: [current code]
  Should be changed to: [suggested implementation]
  Reason: [brief explanation]
  ```

### Issue #2: [Continue for each issue...]

## Positive Observations
[Highlight good practices and well-implemented features]

## Recommendations
[General suggestions for future improvements]
```

### 5. **Priority levels**:

- **Critical**: Breaking changes, security issues, data loss risks
- **High**: Significant bugs, performance issues, violation of core principles
- **Medium**: Code quality issues, maintainability concerns
- **Low**: Style inconsistencies, minor optimizations

## User additional instructions

$ARGUMENTS