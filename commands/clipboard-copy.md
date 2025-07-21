---
allowed-tools: Bash(pbcopy:*), Bash(echo:*), Read, Glob, LS, Grep
description: Copy specified content to clipboard
---

## Context

- Current working directory: `!pwd`

## Your task

Copy the requested content to the clipboard based on user instructions.

## Response Language

Please respond in Japanese (日本語で返信してください)

## How to interpret user requests

### 1. **Direct copy requests**
- "下をコピーして" → Copy the content below/previous message
- "上の内容をコピー" → Copy the content above
- "これをコピー" → Copy the referenced content

### 2. **File operations**
- File path given → Copy entire file contents with clear headers
- Directory path given → Copy directory structure or relevant files

### 3. **Code extraction**
- "関数名 from ファイル名" → Extract and copy specific function
- "classの定義をコピー" → Find and copy class definition

### 4. **Context-aware copying**
- No specific target → Intelligently identify most relevant recent content
- "さっきのコミットメッセージ" → Find and copy recent commit message
- "エラーメッセージをコピー" → Find and copy recent error output

## Copy behavior

1. **Identify what to copy**:
   - Parse user instructions carefully
   - When ambiguous, choose the most recent relevant content
   - Prefer complete, useful chunks over fragments

2. **Format for clipboard**:
   - Preserve original formatting and indentation
   - Add file paths as comments for context
   - Ensure content is ready for immediate use

3. **Confirm the operation**:
   - Show what was copied (abbreviated if very long)
   - Confirm successful clipboard operation
   - Provide helpful context about the copied content

## Examples

- User: "下をコピーして" → Copy the immediate previous content
- User: "/path/to/script.sh" → Copy entire script file
- User: "parseConfig from config.js" → Extract parseConfig function
- User: "最後のエラー" → Find and copy most recent error message

## User additional instructions

$ARGUMENTS