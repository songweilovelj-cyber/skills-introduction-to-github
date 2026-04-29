# Git 脚本 - 将 work 文件改为目录

$repoPath = "C:\Users\18803\bit-Agent\workspace\skills-introduction-to-github"

Set-Location $repoPath

Write-Host "=== 修改 work 为目录 ===" -ForegroundColor Green
Write-Host ""

# 删除 work 文件
Write-Host "[1] 删除 work 文件..." -ForegroundColor Cyan
if (Test-Path "work") {
    Remove-Item "work" -Force
    Write-Host "已删除 work 文件" -ForegroundColor Green
} else {
    Write-Host "work 文件不存在" -ForegroundColor Yellow
}

# 创建 work 目录
Write-Host "[2] 创建 work 目录..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path "work" -Force | Out-Null
Write-Host "已创建 work 目录" -ForegroundColor Green

# 在 work 目录中创建一个 .gitkeep 文件（保持目录被 git 跟踪）
Write-Host "[3] 创建 .gitkeep 文件..." -ForegroundColor Cyan
"# This file keeps the work directory in git" | Out-File -FilePath "work\.gitkeep" -Encoding UTF8

# 添加并提交
Write-Host "[4] 提交更改..." -ForegroundColor Cyan
git add -A
git commit -m "将 work 改为目录，用于存放工作产出文件"

# 推送
Write-Host "[5] 推送到 GitHub..." -ForegroundColor Cyan
git push origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== 修改成功！===" -ForegroundColor Green
    Write-Host "现在可以将工作文件存放到 work 目录中" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== 操作完成 ===" -ForegroundColor Yellow
    Write-Host "可能需要手动推送" -ForegroundColor Yellow
}

Write-Host ""
Read-Host "按回车键退出"
