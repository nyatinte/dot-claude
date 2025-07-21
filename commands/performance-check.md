---
allowed-tools: Read, Grep, Glob, Write(performance-report.md)
denied-tools: Edit(*), MultiEdit(*)
description: Analyze code for performance issues and optimization opportunities
---

## Context

- Project type detection: `!ls package.json Cargo.toml go.mod pyproject.toml 2>/dev/null | head -1`
- Code files: `!find . -type f -name "*.js" -o -name "*.ts" -o -name "*.py" -o -name "*.go" -o -name "*.rs" | head -20`

## Your task

Perform comprehensive performance analysis and provide optimization recommendations.

## Response Language

Please respond in Japanese (日本語で返信してください)

## Analysis Areas

1. **Algorithm Complexity**:
   - Identify O(n²) or worse algorithms
   - Find unnecessary loops
   - Detect redundant computations

2. **Memory Usage**:
   - Large data structures
   - Memory leaks potential
   - Unnecessary object creation

3. **I/O Operations**:
   - Synchronous operations that could be async
   - Inefficient file handling
   - Database query optimization

4. **Code Patterns**:
   - Repeated expensive operations
   - Missing caching opportunities
   - Inefficient data structures

5. **Framework-Specific**:
   - React: Unnecessary re-renders
   - Node.js: Blocking operations
   - Python: List comprehensions vs loops

## Generate Report

Create `performance-report.md` with:

```markdown
# パフォーマンス分析レポート

## 概要
[全体的なパフォーマンス状況]

## 重要な発見事項

### 高優先度
1. **[問題名]**
   - 場所: [ファイル:行番号]
   - 影響: [パフォーマンスへの影響]
   - 改善案: [具体的な解決策]

### 中優先度
[中程度の問題]

### 低優先度
[軽微な改善点]

## 推奨される最適化

### クイックウィン
[すぐに実装できる改善]

### 長期的改善
[アーキテクチャレベルの改善提案]

## ベンチマーク提案
[パフォーマンス測定方法]
```

## User additional instructions

$ARGUMENTS