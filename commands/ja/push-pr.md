---
allowed-tools: Bash(git push:*), mcp__github__list_pull_requests, mcp__github__get_pull_request, mcp__github__search_issues, mcp__github__get_pull_request_files, Write(pr.md), Read(*), Bash(gh pr create:*), Bash(gh pr list:*), Bash(gh repo view:*)
denied-tools: mcp__github__create_pull_request, mcp__github__merge_pull_request
description: 現在のブランチをプッシュしてプルリクエストを作成（ユーザー承認付き）
---

## コンテキスト

- 現在のブランチ: `!git branch --show-current`
- リモート追跡: `!git status -sb`
- 最近のコミット: `!git log --oneline -5`
- `!gh repo view --json owner,name`
- ultrathink

## あなたのタスク

1. **ブランチとコミットの確認**:
   - 現在のブランチがmain/masterでないことを確認
   - プッシュするコミットがあるか確認
   - コミットがない、またはmainブランチの場合は、ユーザーに通知して終了

2. **現在のブランチをプッシュ**:
   - アップストリーム追跡付きでoriginにプッシュ
   - `git push -u origin $(git branch --show-current)`

3. **既存のPRを確認**:
   - 現在のブランチのPRが既に存在するか確認: `gh pr list --head $(git branch --show-current)`
   - PRが存在する場合:
     - 現在のPR詳細を取得: タイトル、本文、番号
     - 後の更新のためPR番号を保存
   - PRが存在しない場合:
     - 新規PR作成フローに進む

4. **ユーザーのPRスタイルを分析**:
   - ユーザーの過去のPRを検索: `gh pr list --author @me --state merged --limit 10`
   - ユーザーに過去のPRがある場合:
     - 最近の2-3個のPRの詳細を取得
     - 分析: タイトル形式、説明の構造、使用言語
     - PR説明の書き方のパターンを記録
   - 過去のPRが見つからず、既存のPRもない場合:
     - PR作成/更新ステップをスキップ
     - ブランチはプッシュされたがPR処理はスキップされたことをユーザーに通知

5. **PRコンテキストの収集**:
   - PRテンプレートをチェック: `.github/pull_request_template.md`など
   - リポジトリ内の模範的なマージ済みPRを探す:
     - 高評価/承認されたPRを検索
     - 良い説明のあるPRを探す
   - 現在のブランチのコミットメッセージを取得:
     - `git log main..HEAD --pretty=format:"%s"`
   - 最近の変更とそのコンテキストを取得

6. **PR作成/更新ドラフトの作成**（ユーザーに過去のPRまたは既存のPRがある場合のみ）:
   - 提案するPR内容で`pr.md`ファイルを作成
   - 既存のPRを更新する場合:
     - 現在のPR内容と新しいコミットに基づくべき内容を比較
     - 意味のある変更がある場合のみ更新を提案
   - ユーザーの過去のPRスタイルに従う:
     - タイトル形式
     - 説明の構造
     - 言語（彼らが使用した言語に合わせる）
   - 含める内容:
     - すべての変更を要約した明確なタイトル
     - 通常の形式に従った説明
     - 変更/コミットの完全なリスト
     - 関連するコンテキスト
   - PRテンプレートが存在する場合は、その構造を取り入れる

7. **ユーザー承認の取得**:
   - 既存のPRを更新する必要がある場合:
     - 現在の内容と提案内容の比較を表示
     - 質問: 「このPRを更新しますか？（必要に応じて先にpr.mdを編集できます）」
   - 新規PRを作成する場合:
     - `pr.md`の内容をユーザーに提示
     - 質問: 「このPRを作成しますか？（必要に応じて先にpr.mdを編集できます）」
   - 明示的な承認を待つ

8. **PRの作成/更新**（承認後）:
   - 新規PRを作成する場合:
     ```bash
     gh pr create --title "$(head -n1 pr.md)" --body "$(tail -n+2 pr.md)"
     ```
   - 既存のPRを更新する場合:
     ```bash
     gh pr edit [PR_NUMBER] --title "$(head -n1 pr.md)" --body "$(tail -n+2 pr.md)"
     ```
   - PRのURLを表示

## 重要な注意事項

- ユーザーの明示的な承認なしにPRを作成/更新しない
- ユーザーの過去のPRの言語とスタイルに合わせる
- ユーザーに過去のPRがなく、既存のPRもない場合は、ブランチのプッシュのみ行う
- PR作成/更新前に必ずpr.mdをユーザーレビュー用に作成する
- 内容が意味的に変更される場合のみPR更新を提案する
- PR更新時は変更内容の明確な比較を表示する

## ユーザー追加指示

$ARGUMENTS