#!/bin/zsh

#拉取最新代码
git pull

#备份旧的dist目录
if [ -d '/usr/share/nginx/dist.bak' ]; then
    rm -rf /usr/share/nginx/dist.bak
fi

if [ -d '/usr/share/nginx/dist' ]; then
    mv /usr/share/nginx/dist /usr/share/nginx/dist.bak
fi

#将新的dist目录复制到nginx目录下
cp -rf dist /usr/share/nginx/dist || { echo "复制dist目录失败"; exit 1; }

echo "部署成功！"