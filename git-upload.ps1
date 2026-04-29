# Git 上传自动化脚本
# 用于将工作文件推送到 GitHub 仓库

$repoPath = "C:\Users\18803\bit-Agent\workspace\skills-introduction-to-github"
$sshKeyPath = "C:\Users\18803\.ssh\id_ed25519"
$sshPassword = "890422"

# 切换到仓库目录
Set-Location $repoPath

Write-Host "=== Git 上传测试 ===" -ForegroundColor Green
Write-Host ""

# 配置 SSH 命令
$env:GIT_SSH_COMMAND = "ssh -i $sshKeyPath -o StrictHostKeyChecking=no"

# 添加文件
Write-Host "[1] 添加测试文件..." -ForegroundColor Cyan
git add test-upload.md
if ($LASTEXITCODE -ne 0) {
    Write-Host "添加文件失败" -ForegroundColor Red
    exit 1
}

# 提交
Write-Host "[2] 提交更改..." -ForegroundColor Cyan
git commit -m "测试：验证 git 上传功能"
if ($LASTEXITCODE -ne 0) {
    Write-Host "提交失败（可能没有更改）" -ForegroundColor Yellow
}

# 推送
Write-Host "[3] 推送到 GitHub..." -ForegroundColor Cyan
Write-Host "如果使用 SSH 密码提示，请输入：$sshPassword" -ForegroundColor Yellow
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== 推送成功！===" -ForegroundColor Green
    Write-Host "请查看：https://github.com/songweilovelj-cyber/skills-introduction-to-github" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== 推送失败 ===" -ForegroundColor Red
    Write-Host "请检查错误信息 above" -ForegroundColor Yellow
}

Write-Host ""
Read-Host "按回车键退出"
