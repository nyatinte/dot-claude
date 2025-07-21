---
allowed-tools: Bash(git push:*), mcp__github__list_pull_requests, mcp__github__get_pull_request, mcp__github__search_issues, mcp__github__get_pull_request_files, Write(pr.md), Read(*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(gh repo view:*)
denied-tools: mcp__github__create_pull_request, mcp__github__merge_pull_request
description: Push current branch and create a pull request with user's approval
---

## Context

- Current branch: `!git branch --show-current`
- Remote tracking: `!git status -sb`
- Recent commits: `!git log --oneline -5`
- `!gh repo view --json owner,name`
- ultrathink

## Your task

1. **Verify branch and commits**:
   - Ensure current branch is not main/master
   - Check if there are commits to push
   - If no commits or on main branch, inform user and exit

2. **Push current branch**:
   - Push to origin with upstream tracking
   - `git push -u origin $(git branch --show-current)`

3. **Check for existing PR**:
   - Check if PR already exists for current branch: `gh pr list --head $(git branch --show-current)`
   - If PR exists:
     - Get current PR details: title, body, number
     - Save PR number for later update
   - If no PR exists:
     - Proceed with new PR creation flow

4. **Analyze user's PR style**:
   - Search for user's past PRs: `gh pr list --author @me --state merged --limit 10`
   - If user has past PRs:
     - Get details of 2-3 recent PRs
     - Analyze: title format, description structure, language used
     - Note patterns in how they write PR descriptions
   - If no past PRs found and no existing PR:
     - Skip PR creation/update step
     - Inform user that branch was pushed but PR handling was skipped

5. **Gather PR context**:
   - Check for PR template: `.github/pull_request_template.md` or similar
   - Find exemplary merged PRs in the repo:
     - Search for highly reviewed/approved PRs
     - Look for PRs with good descriptions
   - Get commit messages from current branch:
     - `git log main..HEAD --pretty=format:"%s"`
   - Get recent changes and their context

6. **Create/Update PR draft** (only if user has past PRs or existing PR):
   - Create `pr.md` file with proposed PR content
   - If updating existing PR:
     - Compare current PR content with what it should be based on new commits
     - Only propose updates if there are meaningful changes
   - Follow user's past PR style for:
     - Title format
     - Description structure
     - Language (match the language they used)
   - Include:
     - Clear title summarizing all changes
     - Description following their usual format
     - Complete list of changes/commits
     - Any relevant context
   - If PR template exists, incorporate its structure

7. **Get user approval**:
   - If existing PR needs update:
     - Show comparison between current and proposed content
     - Ask: "Would you like to update this PR? (You can edit pr.md first if needed)"
   - If creating new PR:
     - Present the `pr.md` content to user
     - Ask: "Would you like to create this PR? (You can edit pr.md first if needed)"
   - Wait for explicit approval

8. **Create/Update PR** (after approval):
   - If creating new PR:
     ```bash
     gh pr create --title "$(head -n1 pr.md)" --body "$(tail -n+2 pr.md)"
     ```
   - If updating existing PR:
     ```bash
     gh pr edit [PR_NUMBER] --title "$(head -n1 pr.md)" --body "$(tail -n+2 pr.md)"
     ```
   - Show the PR URL

## Important notes

- Never create/update PR without user's explicit approval
- Match the language and style of user's previous PRs
- If user has no past PRs and no existing PR, only push the branch
- Always create pr.md for user review before PR creation/update
- Only propose PR updates if content would meaningfully change
- When updating PR, show clear comparison of changes

## User additional instructions

$ARGUMENTS