---
allowed-tools: Read(*), Glob(**/*), Grep, Write(quiz-*.md), Bash(git diff:*), Bash(git diff HEAD:*)
denied-tools: Edit(*), MultiEdit(*), Bash(git push:*), Bash(rm:*)
description: Generate comprehension quiz based on session content
---

## Context

- Analyze current session content
- Current diff (including staging): `!git diff HEAD`
- Working directory: `!pwd`

## Your task

Analyze the conversation session content and generate an interactive quiz to verify user's understanding.

## Response Language

Please respond in Japanese (日本語で返信してください)

### 1. **Analyze session content**:

Identify the following elements:
- Major features or changes implemented
- Technical concepts used
- Design decisions made
- Problems solved
- Important learning points

### 2. **Quiz structure**:

Create a `quiz-[timestamp].md` file with 5-7 technically challenging questions:

```markdown
# Session Comprehension Quiz

## Session Summary
[Brief summary of work performed, focusing on technical changes]

---

## Question 1: Code Reading - Implementation Intent

The following code was changed/added in this session. What problem is this code trying to solve?

```[language]
[Excerpt from actual session code]
// Example: 
// before: allowed-tools: Write(*review-pr-*.md)
// after: allowed-tools: Write(review.md)
```

<details>
<summary>View answer</summary>

**Answer**: [Detailed explanation of the code change intent and problem being solved]

**Detailed explanation**: 
- Why this change was necessary
- Comparison with other solutions
- Benefits and constraints of this implementation
</details>

---

## Question 2: Architecture Understanding

In the [feature name] implemented today, we adopted the following directory structure. Why was this structure chosen?

```
[Actual directory structure]
Example:
commands/
├── address-review-pr.md
├── review.md
└── ja/
    ├── address-review-pr.md
    └── review.md
```

<details>
<summary>View answer</summary>

**Answer**: 
1. [Reason 1 for structure choice]
2. [Reason 2 for structure choice]
3. [Trade-offs considered]

**Implementation notes**: [Technical considerations when adopting this structure]
</details>

---

## Question 3: Diff Analysis

From the following git diff, explain the essential purpose of this change. Also, identify any potential issues if any.

```diff
[Excerpt from actual session git diff]
Example:
-allowed-tools: Bash(git diff:*), Read(*), Write(*review-pr-*.md)
+allowed-tools: Bash(git diff:*), Bash(git diff --staged:*), Bash(git show:*), Read(*), Write(review.md)
+denied-tools: Edit(*), MultiEdit(*)
```

<details>
<summary>View answer</summary>

**Purpose of change**: 
- [Main purpose explanation]
- [Secondary effects]

**Potential issues**: 
- [Possible issue 1 and mitigation]
- [Possible issue 2 and mitigation]
</details>

---

## Question 4: Error Pattern Recognition

The following code pattern was used in multiple places during this session. Identify the problems with this pattern and propose improvements.

```[language]
[Repeated code pattern]
Example:
// Same processing in multiple files
if ($ARGUMENTS) {
  // process arguments
} else {
  // use default
}
```

<details>
<summary>View answer</summary>

**Problems**: 
1. [From DRY principle perspective]
2. [From maintainability perspective]
3. [From extensibility perspective]

**Improvement**: 
```[language]
[Refactored code example]
```
</details>

---

## Question 5: Implementation Decision Validation

We adopted `[specific technical choice]` in this session. What problems might occur in the following scenarios?

1. When user count increases by 100x
2. When internationalization is required
3. When running in CI/CD environment

<details>
<summary>View answer</summary>

**Scenario-specific challenges**: 

1. **Scalability**: [Specific problems and countermeasures]
2. **Internationalization**: [Specific problems and countermeasures]
3. **Automation environment**: [Specific problems and countermeasures]

**Recommended approach**: [Future-proof implementation improvements]
</details>

---

## Question 6: Security Considerations

Regarding the permissions (allowed-tools/denied-tools) configured in this implementation, explain from a security perspective why certain tools were restricted.

```yaml
denied-tools: Bash(git push:*), Edit(*), MultiEdit(*)
```

<details>
<summary>View answer</summary>

**Security reasons**: 
1. [Specific reason for each restriction]
2. [Potential attack scenarios]
3. [Principles of permission design]

**Best practices**: [General guidelines for permission design]
</details>

---

## Deep Dive Challenge

Based on this session, consider the following:

1. **Alternative implementation**: Propose one different approach to solve the same problem and compare pros/cons
2. **Testing strategy**: List 3 important test cases for this implementation
3. **Performance**: Identify potential bottlenecks in the current implementation and suggest improvements

```

### 3. **Quiz generation principles**:

- **High difficulty**: Questions that require deep code reading to answer
- **Practical**: Based on actual code diffs and architecture decisions
- **Critical thinking**: Encourage finding problems and improvements
- **Multiple perspectives**: Security, performance, maintainability
- **Concrete**: Discussion based on actual code, not abstractions

### 4. **Effective learning techniques**:

- Code reading skills: Develop ability to understand actual code
- Problem discovery: Training to find issues and improvements in code
- Design thinking: Deep consideration of why implementations were chosen
- Practical application: Addressing challenges faced in real development

### 5. **Post-quiz follow-up**:

After quiz completion, provide:
- Deep-dive explanations for each question
- Actual code improvement examples
- Approaches to similar challenges
- Points to consider in future sessions

## User additional instructions

$ARGUMENTS