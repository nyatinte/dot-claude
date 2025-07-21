---
allowed-tools: mcp__github__get_pull_request, mcp__github__get_pull_request_files, mcp__github__get_pull_request_status, mcp__github__get_pull_request_comments, mcp__github__get_pull_request_reviews, Bash(gh pr view:*), Bash(gh pr list:*), Bash(gh repo view:*), Write(*review-pr-*.md), Read(*), Edit(*), MultiEdit(*)
denied-tools: Bash(git push:*), mcp__github__merge_pull_request
description: Review and respond to PR comments
---

## Context

- Current branch: `!git branch --show-current`
- PR argument: $ARGUMENTS
- `!gh repo view --json owner,name`
- ultrathink

## Your task

1. **Identify PR number**:
   - If $ARGUMENTS contains a PR number or link, use it
   - Otherwise, get the PR number for current branch using `gh pr list`

2. **Retrieve PR information**:
   - Get PR details (mcp__github__get_pull_request)
   - Get list of changed files (mcp__github__get_pull_request_files)
   - Check status (mcp__github__get_pull_request_status)
   - Get review comments (mcp__github__get_pull_request_comments)
   - Get review content (mcp__github__get_pull_request_reviews)
   - "You don't have to do everything; just use what you need."

3. **Determine review response strategy**:
   - For each review comment, evaluate:
     - Validity of the comment
     - Necessity of addressing it
     - Expected quality improvement from addressing it
   - Remember: not all reviews need to be addressed
   - Choosing not to address irrelevant reviews is a valid decision

4. **Propose review responses**:
   - If there are **3 or more** review comments:
     - Create a `review-pr-{PR_number}.md` file
     - For each review comment, summarize:
       - Review content
       - Current implementation
       - Response strategy (including reasons to address or not)
     - Present the file to user for approval
   - If there are **fewer than 3** review comments:
     - Directly propose response strategies for user approval

5. **Implement approved changes**:
   - Execute changes based on approved response strategies
   - Ensure each change clearly addresses the corresponding review comment
   - When creating commits to address reviews:
     - **Good**: Describe what was changed and why (e.g., "Fix type safety in user validation", "Improve error handling for API responses")
     - **Bad**: Generic messages like "address review comments", "fix PR feedback", "respond to review"
     - Each commit should describe the actual change made, not just that it addresses a review

## User additional instructions

$ARGUMENTS
