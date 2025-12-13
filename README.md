# tomo-infra-study

AWS × IaC × 監視 × CI/CD を一通り触る学習メモ。

## ゴール
- TerraformでAWSに環境を作る
- CloudWatchで監視
- CI/CDで plan → 承認 → apply

## 学習ログ
### 2025-12-12
- WSL2 + Ubuntu インストール
- AWS CLI インストール
- IAMユーザー `tomo-study` 作成
- `aws sts get-caller-identity` 成功