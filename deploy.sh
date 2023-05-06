#!/bin/zsh

#输出当前时间
start_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "########### 开始时间：$start_time"
#拉取最新代码
echo "###########开始pull代码"
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

end_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "########### 结束时间：$end_time"
#耗时多少秒
start_seconds=$(date --date="$start_time" +%s)
end_seconds=$(date --date="$end_time" +%s)
echo "########### 本次部署耗时："$((end_seconds-start_seconds))"s"
echo "########### 部署成功！"

