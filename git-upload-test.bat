@echo off
cd /d C:\Users\18803\bit-Agent\workspace\skills-introduction-to-github

echo === Git 上传测试 ===
echo.

REM 查看当前状态
echo [1] 检查仓库状态...
git status

echo.
echo [2] 添加测试文件...
git add test-upload.md

echo.
echo [3] 提交更改...
git commit -m "测试：验证 git 上传功能"

echo.
echo [4] 推送到 GitHub（使用 SSH）...
echo 如果遇到密码提示，请输入：890422
git push origin main

echo.
echo === 完成 ===
pause
