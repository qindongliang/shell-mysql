
#登陆mysql，负责查询某个表数据总量
MYSQL=`which mysql`
count=`$MYSQL -hmysqlhost --default-character-set=utf8   -P3306 -uname -ppwd  <<EOF  
use db_conform;
select    count(1)  from $1  ;
EOF` 

#得到某一个表的总数量
count=`echo "$count" | sed '1d' `
#定义一个每页读取的最大数量
pageSize=10000
#计算总共的分页数
totalPage=0;
#判断总数量，求模是否等于0，等于0，就是相除多少页
temp=` echo "$count%$pageSize" | bc `
if [ 0 -eq $temp ] ;then
totalPage=`echo  "$count/$pageSize" | bc`
else
#否则，就是相除后+1，作为总的分页数
totalPage=`echo  "$count/$pageSize+1" | bc`
fi

echo "总数量：$count 每页读取数量：$pageSize  分页数量：$totalPage"

#把总页数减一，方便分页处理，因为后面咱的下标从0开始
totalPage=`echo "$totalPage-1" | bc `
#echo "处理后：$totalPage"

#for循环遍历总页数
for page in `seq 0 $totalPage`
do
#计算每页的偏移量
offset=`echo "$page*$pageSize" | bc `
echo "当前处理到第$page页,分页信息： limit $offset $pageSize  "
###第一个参数表名
###第二个参数偏移量
###第三个参数每页读取数据
#调用f.sh获取数据
sh f.sh $1 $offset $pageSize 
done



#sed -i 's/<[^>]*>//g;/^$/d'  tables/$1

#sed -i 's/[a-zA-Z\.():;><-]//g' tables/$1


