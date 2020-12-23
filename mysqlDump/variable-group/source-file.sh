#!/bin/bash


# pwdPath=${PWD}
# echo ${pwdPath}
# echo ""

variableMysql="${PWD}/variable-mysql.sh"
# echo ${variableMysql}
# echo ""

variableFile="${PWD}/variable-file.sh"
# echo ${variableFile}
# echo ""

params="${pwdPath}/params.sh"
# echo ${params}

source ${params}
source ${variableFile}
source ${variableMysql}