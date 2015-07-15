
#连接mysql
#        -h主机地址                                                             -u用户名 -p密码

#下面的语句，是登陆到数据库后，使用某个数据库，然后根据条件查询表
MYSQL=`which mysql`

 $MYSQL -hmysqlhost --default-character-set=utf8   -P3306 -uname -ppwd  <<EOF  


use db_conform;


select    concat_ws('#',ifNull(id,''),ifNULL(title,''),ifNULL(replace(replace(replace(content ,'\n','' ), '\r' , '' ),'#','' ) ,''),ifNULL(doc_no,'')) from $1 limit $2 , $3   ;




EOF



#echo $query
 
