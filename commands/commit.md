Create a git commit by analyzing the repository state and crafting an appropriate commit message.

**Arguments**: `$ARGUMENTS` - Optional commit message or keywords to guide the commit

## Process

1. **Analyze Repository State**:
   - Execute `git status` to identify staged/unstaged changes and untracked files
   - Run `git diff --staged` to review all staged changes in detail
   - Check `git diff` for any unstaged modifications
   - Identify the scope and nature of changes (new features, bug fixes, refactoring, etc.)

2. **Study Commit History**:
   - Execute `git log --oneline -15` to understand the project's commit message patterns
   - Analyze existing commit message style (conventional commits, prefixes, formatting)
   - Maintain consistency with the established project conventions

3. **Generate Commit Message**:
   - **If $ARGUMENTS provided**: Use as the commit message or incorporate as guidance
   - **If no arguments**: Automatically generate based on change analysis:
     - Determine commit type: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `ci`, `build`
     - Identify scope if applicable (component, module, or area affected)
     - Create concise, descriptive message following: `type(scope): description`
   - Ensure message follows project conventions and best practices

4. **Execute Commit**:
   - Stage any relevant untracked files if necessary
   - Create commit using the crafted message
   - Verify commit success with `git log -1 --oneline`

## Commit Message Standards

- **Subject line**: Max 50 characters, imperative mood, no period
- **Format**: `type(scope): brief description` or match existing project style
- **Types**: feat, fix, docs, style, refactor, test, chore, ci, build, perf
- **Description**: Clear, specific, explains *what* changed and *why*
- **Examples**:
  - `feat(auth): add OAuth2 login integration`
  - `fix(api): resolve null pointer in user validation`
  - `docs: update README with installation steps`
