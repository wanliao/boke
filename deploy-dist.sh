#!/bin/bash
# 本地编译 VitePress 站点，并把 .vitepress/dist 的内容发布到 dist 分支。
# 服务器端只需：cd /www/wwwroot/boke-dist && git pull origin dist
# 站点根目录指向该目录即可，服务器上不需要 node / npm / 编译。
set -e

cd "$(dirname "$0")"
ROOT="$(pwd)"

# 清掉可能带偏 git 的代理环境变量，改用 git config 里的代理设置
unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy

echo "[1/4] 编译站点..."
npx vitepress build

echo "[2/4] 准备 dist 分支工作树..."
TMPROOT="$(cygpath -m "${TEMP:-/tmp}" 2>/dev/null || echo /tmp)"
WT="$TMPROOT/boke-dist-wt"
rm -rf "$WT"
git worktree prune
git fetch origin dist:dist --force --quiet || true
git worktree add --force "$WT" dist

echo "[3/4] 同步编译产物..."
find "$WT" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
cp -a "$ROOT/.vitepress/dist/." "$WT"/

echo "[4/4] 提交并推送..."
cd "$WT"
git add -A
if git diff --cached --quiet; then
  echo "产物无变化，跳过提交。"
else
  git commit -m "deploy: 本地编译产物 $(date '+%Y-%m-%d %H:%M')"
  git push origin dist
fi

cd "$ROOT"
git worktree remove --force "$WT"
echo ""
echo "完成。服务器端执行： git pull origin dist"
