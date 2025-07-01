Save conversation history and project knowledge to a structured documentation file.

**Arguments**: `$ARGUMENTS` - Optional topic or filename suffix to customize the saved document

## File Location
Save to: `{project_directory}/.claude/docs/{YYYY-MM-DD}_{topic_summary}.md`

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
