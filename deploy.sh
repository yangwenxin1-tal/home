#!/bin/zsh

#拉取最新代码
echo "\n###########开始pull代码"
git pull
echo "########### 结束pull代码"
sleep 5

#备份旧的dist目录
if [ -d '/usr/share/nginx/dist.bak' ]; then
    echo "########### 删除旧的dist.bak目录"
    sleep 5
    rm -rf /usr/share/nginx/dist.bak
fi

if [ -d '/usr/share/nginx/dist' ]; then
    echo "########### 备份旧的dist目录"
    sleep 5
    mv /usr/share/nginx/dist /usr/share/nginx/dist.bak
fi

#将新的dist目录复制到nginx目录下
echo "########### 复制dist目录到nginx目录下"
sleep 5
cp -rf dist /usr/share/nginx/dist || { echo "########### 复制dist目录失败"; exit 1; }

echo "########### 部署成功！"