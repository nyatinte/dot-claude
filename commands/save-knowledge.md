---
allowed-tools: Bash(mkdir:*), Write, LS, Bash(pwd), Bash(date:*), Bash(ls:*), Read
description: Save conversation knowledge to structured docs
---

# Save Knowledge Command

## Context

- Current working directory: `!pwd`
- Current date: `!date +%Y-%m-%d`
- Ensure docs directory: `!mkdir -p .claude/docs && ls .claude/docs`

## Your task

Save conversation history and project knowledge to a structured documentation file.

## User additional instructions

$ARGUMENTS

## Important Guidelines

- **Language**: 日本語で文書を作成する
- **Style**: ブログ記事風の読みやすい形式で書く  
- **Format**: Use professional markdown structure
- **Directory**: Context section commands ensure directory exists

## Document Structure

### 1. Executive Summary

- **Objective**: Clear statement of what was accomplished
- **Key Changes**: High-level overview of modifications made
- **Impact**: Business or technical impact of the changes

### 2. As/Is → To/Be Analysis

- **Before (As/Is)**: Description of the previous state
- **After (To/Be)**: Description of the new state
- **Transformation**: Key differences and improvements

### 3. Technical Details

- **Changes Overview**: Detailed summary of code/configuration changes
- **Files Modified**: List of affected files with brief descriptions
- **Implementation Notes**: Important technical decisions or considerations

### 4. Conversation History

- **Context**: Background and initial requirements
- **Discussion Points**: Key decisions and problem-solving approaches
- **Resolution**: How issues were resolved

### 5. References

- **Commit Hash**: Git commit SHA if changes were committed
- **Pull Request**: PR URL if applicable
- **Related Issues**: Issue numbers or URLs
- **Documentation**: Links to relevant documentation or resources

## Behavior

- If `$ARGUMENTS` provided: Use as topic suffix in filename
- If no arguments: Generate appropriate topic from conversation context
- Create `.claude/docs/` directory if it doesn't exist
- Use clear, professional formatting with proper markdown structure
- Include timestamps and version information where relevant
