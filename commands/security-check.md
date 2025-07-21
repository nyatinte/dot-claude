---
allowed-tools: Read, Grep, Glob, Write(security-report.md), WebSearch
denied-tools: Edit(*), MultiEdit(*), Bash(curl:*), Bash(wget:*)
description: Perform security audit and vulnerability check
---

## Context

- Dependencies: `!ls package.json requirements.txt go.mod Cargo.toml 2>/dev/null`
- Config files: `!find . -name "*.env*" -o -name "*config*" -o -name "*.yml" -o -name "*.yaml" | head -10`

## Your task

Conduct thorough security analysis and identify potential vulnerabilities.

## Response Language

Please respond in Japanese (日本語で返信してください)

## Security Checks

1. **Dependency Vulnerabilities**:
   - Check for known CVEs
   - Outdated packages
   - Suspicious dependencies

2. **Code Security Issues**:
   - SQL injection risks
   - XSS vulnerabilities
   - Insecure random generation
   - Hardcoded secrets
   - Path traversal risks

3. **Authentication & Authorization**:
   - Weak authentication methods
   - Missing authorization checks
   - Session management issues

4. **Data Security**:
   - Unencrypted sensitive data
   - Insecure data transmission
   - Logging sensitive information

5. **Configuration Security**:
   - Exposed API keys
   - Insecure defaults
   - Missing security headers

## Generate Security Report

Create `security-report.md`:

```markdown
# セキュリティ監査レポート

## サマリー
- 検査日時: [日時]
- 重要度: Critical: X, High: X, Medium: X, Low: X

## 重要な発見事項

### 🔴 Critical
1. **[脆弱性名]**
   - 場所: [ファイル:行]
   - 説明: [問題の詳細]
   - 影響: [潜在的な影響]
   - 修正方法:
   ```[言語]
   // 修正前
   [問題のあるコード]
   
   // 修正後
   [修正されたコード]
   ```

### 🟠 High
[高優先度の問題]

### 🟡 Medium
[中優先度の問題]

### 🟢 Low
[低優先度の問題]

## 推奨事項

### 即時対応が必要
1. [アクション項目]

### 短期的改善
1. [改善提案]

### 長期的改善
1. [アーキテクチャレベルの提案]

## セキュリティベストプラクティス
[プロジェクトに適用すべきベストプラクティス]
```

## User additional instructions

$ARGUMENTS