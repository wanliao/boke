#!/bin/bash
cd /www/wwwroot/boke
git pull origin main
npm install
npm run docs:build
echo "更新完成！"
