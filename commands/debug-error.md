# Debug Error Command

---
allowed-tools: Read, Grep, Bash(git log:*), Bash(git diff:*), WebSearch, mcp__brave-search__brave_web_search, mcp__Context7__resolve-library-id, mcp__Context7__get-library-docs
denied-tools: Edit(*), MultiEdit(*)
description: Intelligent error analysis with root cause detection and solutions
argument-hint: <error message or description>
---

## Context

- Recent commits: `!git log --oneline -5`
- Changed files: `!git diff --name-only HEAD~1`
- Current directory: `!pwd`
- Runtime environment: `!node -v 2>/dev/null || python --version 2>/dev/null || ruby -v 2>/dev/null`

## Your task

Provide comprehensive debugging assistance with actionable solutions.

## Response Language

Please respond in Japanese (日本語で返信してください)

## Debugging Methodology

### 1. **Error Classification**

Identify error category:
- Syntax errors
- Runtime exceptions
- Type errors
- Logic errors
- Configuration issues
- Dependency conflicts
- Performance issues
- Security vulnerabilities

### 2. **Context Gathering**

Collect relevant information:
- Full stack trace
- Recent code changes
- Environment details
- Related configuration
- Dependency versions

### 3. **Root Cause Analysis**

Apply systematic approach:
1. **Reproduce** - Understand conditions
2. **Isolate** - Find minimal case
3. **Trace** - Follow execution path
4. **Identify** - Pinpoint root cause

### 4. **Solution Strategy**

Provide multiple solution paths:
- **Quick Fix** - Immediate workaround
- **Proper Fix** - Correct implementation
- **Prevention** - Avoid future occurrences

## Output Format

```markdown
# エラー診断レポート

## 🔍 エラー概要
**エラータイプ**: [分類]
**重要度**: 🔴 Critical | 🟠 High | 🟡 Medium | 🟢 Low
**発生場所**: [ファイル:行番号]

## 📊 エラー分析

### エラーメッセージ
```
[完全なエラーメッセージ]
```

### 根本原因
[詳細な原因説明]

### 影響範囲
- 影響を受ける機能
- 関連するコンポーネント

## 🛠️ 解決方法

### 方法1: 即座の修正 (推奨)
```[言語]
// 修正前
[問題のあるコード]

// 修正後
[修正されたコード]
```

**説明**: [なぜこの修正が有効か]

### 方法2: 代替アプローチ
[別の解決策]

## 🛡️ 予防策

1. **コーディング規約**
   - [推奨される実践]

2. **テスト戦略**
   ```[言語]
   // このようなテストを追加
   [テストコード例]
   ```

3. **設定の見直し**
   - [設定ファイルの改善点]

## 📚 参考情報

### 関連ドキュメント
- [公式ドキュメントリンク]
- [Stack Overflowの類似問題]

### デバッグのヒント
- [このタイプのエラーのデバッグ方法]

### チェックリスト
- [ ] エラーが再現できることを確認
- [ ] 修正後にテストを実行
- [ ] 関連する箇所も確認
- [ ] ドキュメントを更新
```

## Advanced Features

### Intelligent Error Pattern Recognition
- Common framework-specific errors
- Language-specific pitfalls
- Platform-specific issues

### Context-Aware Solutions
- Project structure analysis
- Coding style adaptation
- Framework best practices

### Learning from History
- Check similar past issues
- Review recent changes
- Identify patterns

## User additional instructions

$ARGUMENTS