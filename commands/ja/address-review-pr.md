---
allowed-tools: mcp__github__get_pull_request, mcp__github__get_pull_request_files, mcp__github__get_pull_request_status, mcp__github__get_pull_request_comments, mcp__github__get_pull_request_reviews, Bash(gh pr view:*), Bash(gh pr list:*), Bash(gh repo view:*), Write(*review-pr-*.md), Read(*), Edit(*), MultiEdit(*)
denied-tools: Bash(git push:*), mcp__github__merge_pull_request
description: PRのレビューコメントに対応する
---

## コンテキスト

- 現在のブランチ: `!git branch --show-current`
- PR引数: $ARGUMENTS
- `!gh repo view --json owner,name`
- ultrathink

## あなたのタスク

1. **PR番号の特定**:
   - $ARGUMENTSにPR番号またはリンクが含まれている場合は、それを使用
   - それ以外の場合は、`gh pr list`を使用して現在のブランチのPR番号を取得

2. **PR情報の取得**:
   - PR詳細を取得 (mcp__github__get_pull_request)
   - 変更されたファイルのリストを取得 (mcp__github__get_pull_request_files)
   - ステータスを確認 (mcp__github__get_pull_request_status)
   - レビューコメントを取得 (mcp__github__get_pull_request_comments)
   - レビュー内容を取得 (mcp__github__get_pull_request_reviews)
   - 「すべてを実行する必要はありません。必要なものだけを使用してください。」

3. **レビュー対応戦略の決定**:
   - 解決済み（resolved）のコメントはスキップ - すでに対応済みです
   - 未解決の各レビューコメントについて評価:
     - コメントの妥当性
     - 対応の必要性
     - 対応による品質向上の期待値
   - 注意: すべてのレビューに対応する必要はありません
   - 無関係なレビューに対応しないことも有効な判断です

4. **レビュー対応の提案**:
   - **3つ以上**のレビューコメントがある場合:
     - `review-pr-{PR_number}.md`ファイルを**日本語で**作成
     - 各レビューコメントについて要約:
       - レビュー内容
       - 現在の実装
       - 対応戦略（対応するかしないかの理由を含む）
     - ユーザーに承認のためファイルを提示
   - **3つ未満**のレビューコメントの場合:
     - 対応戦略を直接ユーザーに提案

5. **承認された変更の実装**:
   - 承認された対応戦略に基づいて変更を実行
   - 各変更が対応するレビューコメントに明確に対応していることを確認
   - レビューに対応するコミットを作成する際:
     - **良い例**: 何を変更し、なぜ変更したかを記述（例：「ユーザー検証で型安全性を修正」、「APIレスポンスのエラー処理を改善」）
     - **悪い例**: 「レビューコメントに対応」、「PRフィードバックを修正」、「レビューに応答」のような一般的なメッセージ
     - 各コミットは、レビューに対応したことではなく、実際に行った変更を記述すべきです

## ユーザー追加指示

$ARGUMENTS