# terminal-notifier 参考資料集

## 📖 概要

terminal-notifierは、macOS 10.10以降で利用可能なmacOSユーザー通知を送信するためのコマンドラインツールです。

### 主な特徴
- macOSのネイティブ通知センターを利用
- コマンドラインから簡単に通知を送信可能
- Claude Codeのhook機能と組み合わせて自動通知を実現

## 🔧 インストール方法

### Homebrew経由（推奨）
```bash
brew install terminal-notifier
```

### RubyGems経由
```bash
sudo gem install terminal-notifier
```

### 直接ダウンロード
[GitHub Releases](https://github.com/julienXX/terminal-notifier/releases)から最新版をダウンロード

## 📝 基本的な使用方法

### 基本コマンド
```bash
terminal-notifier -message "通知メッセージ" -title "タイトル"
```

### パイプを使った通知
```bash
echo 'パイプされたメッセージ!' | terminal-notifier -sound default
```

## 🎯 主要オプション一覧

### メッセージ関連
- `-message VALUE` - 通知のメッセージ本文（必須）
- `-title VALUE` - 通知のタイトル（デフォルト: 'Terminal'）
- `-subtitle VALUE` - 通知のサブタイトル

### 外観カスタマイズ
- `-appIcon PATH` - カスタムアイコンのパス（URLも可）
- `-contentImage PATH` - 通知内に表示する画像のパス

### サウンド
- `-sound NAME` - 通知音の名前
  - 特殊値: `default` - デフォルトの通知音
  - システムサウンドは `/System/Library/Sounds` に格納

### インタラクション
- `-open URL` - クリック時に開くURL
- `-activate ID` - クリック時に起動するアプリのバンドルID
- `-execute COMMAND` - クリック時に実行するシェルコマンド

### グループ管理
- `-group ID` - 通知のグループID（同じIDの通知は置き換えられる）
- `-remove ID` - 指定したグループの通知を削除
- `-list ID` - グループの詳細をリスト表示

### その他
- `-sender ID` - 送信元アプリを偽装
- `-ignoreDnD` - おやすみモードを無視して通知を表示

## 🔊 利用可能な通知音

### 標準的な通知音（/System/Library/Sounds）
- **Basso** - 低音の警告音
- **Blow** - 吹く音
- **Bottle** - ボトルの音
- **Frog** - カエルの鳴き声
- **Funk** - ファンキーな音
- **Glass** - ガラスの音
- **Hero** - ヒーローサウンド
- **Morse** - モールス信号音
- **Ping** - ピン音
- **Pop** - ポップ音
- **Purr** - 猫の鳴き声
- **Sosumi** - 古典的なMacサウンド
- **Submarine** - 潜水艦音
- **Tink** - チン音

### カスタムサウンドの追加
- `~/Library/Sounds` にAIFFまたはWAVファイルを配置

## 💡 Claude Codeでの活用例

### 基本的な通知設定
```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "terminal-notifier -title 'Claude Code' -message '承認をお待ちしています' -sound Glass"
          }
        ]
      }
    ]
  }
}
```

### 高度な通知設定（アイコン付き）
```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "terminal-notifier -title 'Claude Code ✅' -subtitle '$(basename $(pwd))' -message 'タスクが完了しました' -sound Hero -group 'claude-code' -appIcon 'https://www.anthropic.com/claude-icon.png'"
          }
        ]
      }
    ]
  }
}
```

### 詳細情報を含む通知
```bash
#!/bin/bash
# ~/scripts/claude-notify.sh

PROJECT_NAME=$(basename "$PWD")
TIME=$(date +"%H:%M")

terminal-notifier \
    -title "Claude Code 🤖" \
    -subtitle "プロジェクト: $PROJECT_NAME" \
    -message "処理が完了しました ($TIME)" \
    -sound "Blow" \
    -group "claude-code-completion" \
    -timeout 10
```

## 🔗 参考リンク

- [terminal-notifier 公式リポジトリ](https://github.com/julienXX/terminal-notifier)
- [Claude Code Hooks ドキュメント](https://docs.anthropic.com/en/docs/claude-code/hooks)
- [macOS通知センターのカスタマイズ](https://support.apple.com/guide/mac-help/change-notifications-settings-mh40583/mac)

## ⚠️ 注意事項

- macOS 10.10以降が必要
- アプリケーションバンドルとしてパッケージ化されている
- `-appIcon`と`-contentImage`オプションはプライベートメソッドを使用しているため、将来変更される可能性がある
- 通知を画面に残したい場合は、システム環境設定 > 通知 > terminal-notifierで「バナー」から「通知」に変更する

## 🎨 カスタマイズのヒント

1. **プロジェクトごとの通知音**: 異なるプロジェクトで異なる通知音を使用
2. **時間帯による通知音変更**: 朝/昼/夜で異なる通知音を設定
3. **優先度による色分け**: 絵文字やアイコンで重要度を視覚的に表現
4. **グループ化**: 同じタイプの通知をグループ化して管理