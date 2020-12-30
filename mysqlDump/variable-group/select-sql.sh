#!/bin/bash


# 使用
# sh select-sql.sh 50
# 使用 end 



pwdPath=${PWD}
# echo ${pwdPath}
# echo ""

# =============== 加载其他文件的内容 ==================

# variableMysql="${PWD}/variable-mysql.sh"
# echo ${variableMysql}
# echo ""

# variableFile="${PWD}/variable-file.sh"
# echo ${variableFile}
# echo ""

# params="${pwdPath}/params.sh"
# echo ${params}

# source ${params}
# source ${variableFile}
# source ${variableMysql}


sourceFile="${pwdPath}/source-file.sh"
echo ${sourceFile}
source ${sourceFile}

# =============== 加载其他文件的内容 ==end=============

echo ${HOSTNAME}
# echo ""

echo ${PORT}
# echo ""

echo ${USERNAME}
# echo ""

echo ${PASSWORD}
# echo ""

echo ${DBNAME}
# echo ""

echo ${PathFile}
# echo ""



echo ${muidUs}
echo ${mids}
echo "${dates}-${fileName}"

echo ${dates}

select_sql=""
select_sql="select * from wp_posts where ID = ${muidUs} \G;"

echo ${select_sql}
echo ""

if [ -z "$select_sql" ]; then
	echo "select_sql is empty"
	exit 10
fi

if [ -z "$muidUs" ]; then
	echo "muid is empty"
	exit 10
fi

if [ -z "$select_sql" ]; then
	echo "select_sql is empty"
	exit 10
fi

data=`${MYSQLBINSH}  -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}"`

echo  "${data}"

if [ -z "$data" ]; then
	echo "data is empty"
	exit 10
fi


# ------------------- 根据主键更新数据 ------------------

if [ -z "$muidUs" ]; then
	echo "id is empty / 主键不能为空！ "
	exit 10
fi

UPDATESQL="update wp_posts set post_author=1 where ID = ${muidUs} \G;"

${MYSQLBINSH}  -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${UPDATESQL}"

# ------------------- 根据主键更新数据 -end--------------

echo "----查看更新后的数据--";

data=`${MYSQLBINSH}  -h${HOSTNAME}  -P${PORT} -u${USERNAME} -p${PASSWORD} -D ${DBNAME} -e "${select_sql}"`

echo  "${data}"

if [ -z "$data" ]; then
	echo "data is empty"
	exit 10
fi


