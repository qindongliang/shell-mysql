
#第一个参数表名
#第二个参数是start
#第三个参数是offset
#分页读取数据后，删除第一行表头，并写入一个文件中，文件名与表名一样
sh port.sh $1 $2 $3  | sed '1d' >> tables/$1

#删除无用的html字符
#sed -i 's/<[^>]*>//g;/^$/d'  tables/$1   
#删除无用的一些特殊符号
#sed -i 's/[a-zA-Z\.():;><-]//g' tables/$1 






