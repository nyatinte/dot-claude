#!/bin/bash

# プロジェクト名を取得
PROJECT_NAME=$(basename "$PWD")

# 通知タイプを引数から取得
NOTIFICATION_TYPE="${1:-default}"

case "$NOTIFICATION_TYPE" in
  "approval")
    terminal-notifier \
      -title 'Claude Code 🔔' \
      -subtitle "$PROJECT_NAME" \
      -message '承認をお待ちしています' \
      -sound Glass \
      -group 'claude-code'
    ;;
  "complete")
    terminal-notifier \
      -title 'Claude Code ✅' \
      -subtitle "$PROJECT_NAME" \
      -message 'タスクが完了しました' \
      -sound Hero \
      -group 'claude-code'
    ;;
  *)
    terminal-notifier \
      -title 'Claude Code' \
      -subtitle "$PROJECT_NAME" \
      -message '通知' \
      -sound Glass \
      -group 'claude-code'
    ;;
esac