#!/bin/bash

#
# https://blog.csdn.net/weixin_42005602/article/details/108217508
# 


HOSTNAME="这里是数据库访问地址"
PORT="3306"
USERNAME="username"
PASSWORD="password"
DBNAME="dbname"
DATE=`date "+%Y-%m-%d"`
PathZd=/backup
# PathFile=`${PWD}/dx.xls`
PathFile="${PWD}/dx.txt"
# PathFile="${PathZd}/dx.txt"
select_sql='this is your sql'
select_sql=''

# https://blog.csdn.net/nyist327/article/details/44778977/
# 
# 
# -z ：判断 string 是否是空串
# -n ：判断 string 是否是非空串

if [ -z "$select_sql" ]; then
	echo "select_sql is empty"
	exit 10
fi

if [ -n "$select_sql" ]; then
	echo "select_sql is not empty"
fi

if [ -n "$select_sql" ]; then
	echo "select_sql is empty"
	# exit命令同于退出shell，并返回给定值。在shell脚本中可以终止当前脚本执行。执行exit可使shell以指定的状态值退出。若不设置状态值参数，则shell以预设值退出。状态值0代表执行成功，其他值代表执行失败。
	# https://www.fujieace.com/linux/man/exit.html
	exit 10
else
	echo "您输入正确执行本程序。"
fi

# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}" > dx.xls
# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}" > ${PathFile}
# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}"

# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD}  -e "use ${DBNAME} ; ${select_sql}" > dx.xls
# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD}  -e "use ${DBNAME} ; ${select_sql}" > ${PathFile}
# mysql -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD}  -e "use ${DBNAME} ; ${select_sql}"

data=`/opt/lampp/bin/mysql  -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}"`

echo  "${data}"


if [ -z "$data" ]; then
	echo "data is empty"
	exit 10
fi


echo  "${data}"  > dx.txt

echo  "${data}"  > ${PathFile}

#echo "已发送"|mailx -s "加班时长" -a $DATE.xlsx "longjiping@lizhenauto.com" 
#字符集处理
iconv -f utf-8 -t gb2312 dx.xls -o $DATE.xls
if [ -s $DATE.xls ]; then
	echo "已发送"|mailx -s "this is your subject" -a $DATE.xls "mail address 1" "mail address 2" "mail address 3"
else
    echo "empty"
fi
rm -f $DATE.xls
rm -f /mail/dx.xls

