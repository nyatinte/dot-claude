---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
denied-tools: Bash(git push:*), Bash(git commit -n:*), Bash(git commit --no-verify)
description: gitコミットを作成
---

## コンテキスト

- 現在のgitステータス: `!git status`
- 現在のgit差分（ステージングされた変更とされていない変更）: `!git diff HEAD`
- 現在のブランチ: `!git branch --show-current`
- 最近のコミット: `!git log --oneline -10`

## あなたのタスク

上記の変更に基づいて、単一のgitコミットを作成する。

## 重要な注意事項

- **選択的なステージング**: タスクに直接関連するファイルのみをステージングする。一時的なメモや作業中の無関係なファイルが含まれる可能性があるため、`git add .`は使用しない
- **コミットメッセージ**: リポジトリの既存のコミットと同じ言語を使用（最近のコミット履歴を確認）
- **ユーザーとのコミュニケーション**: 日本語で応答