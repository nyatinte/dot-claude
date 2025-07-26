---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
denied-tools: Bash(git push:*), Bash(git commit -n:*), Bash(git commit --no-verify)
description: Create a git commit
---

## Context

- Current git status: `!git status`
- Current git diff (staged and unstaged changes): `!git diff HEAD`
- Current branch: `!git branch --show-current`
- Recent commits: `!git log --oneline -10`

## Your task

Based on the above changes, create a single git commit.

## Important Notes

- **Selective staging**: Only stage files that are directly related to the task. Do not use `git add .` as it may include temporary notes or unrelated work-in-progress files
- **Commit messages**: Use the same language as the repository's existing commits (check recent commit history)
- **User communication**: Respond in Japanese (日本語で返信してください)
