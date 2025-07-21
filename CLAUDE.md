# CLAUDE.md

## Top Priority Rule - New Rule Addition Process

### Rule Addition Steps

1. **Criteria**: When receiving instructions from the user that seem to require constant application rather than one-time use. For example: "Please do this from next time", "Please handle this way from now on", etc.
2. **Confirmation**: Ask "Should this be made a standard rule?"
3. **Addition**: If YES response is received, add as a rule in the project's CLAUDE.md
4. **Application**: Apply as standard rule thereafter

## Top Priority Rule - Thinking and Action Guidelines

Think in English, communicate with users in Japanese.

## 📜 Basic Rules

### Communication

- **Language**: Respond primarily in Japanese
- **Handling unknowns**:
  - Answer "I don't know" for things you don't understand
- **Citations**: Always specify sources when available

### Task Management

- **Task division**: Divide given instructions into tasks for execution
- **Decision making**: Present two options when uncertain about implementation approach
- **Complex tasks**: Use `/kiro` command for structured workflow execution

### Development Tools

- **Search**: Use `ripgrep` instead of grep
  - NG: `Bash(grep -r "pattern" .)`
  - OK: `Bash(rg "pattern")`
- **File exploration**: Use `fd` as alternative to find
  - NG: `Bash(find . -name "*.js")`
  - OK: `Bash(fd "*.js")`
- **uithub**: uithub links are not GitHub typos, but a site that provides repository content for LLMs
- **context7**: context7 provides up-to-date information about libraries

## 🔧 Development Environment Settings

### Common

- Delete unnecessary comments. Use comments to clarify "why" when needed. Do not comment on what is obvious from the code
- Follow DRY, YAGNI principles
- Do not skip test implementation by default, implement tests that mimic user behavior

### TypeScript/Next.js Development

- **Type safety**: `any` type is prohibited. Avoid using `as` as much as possible
- **Function definitions**:
  - Components: `function` declaration
  - Regular functions: arrow functions
- **Exports**: Avoid `default export` except for page components
