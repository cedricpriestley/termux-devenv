#! /bin/bash
#
# Author:   Cedric Priestley <cedricpriestley@gmail.com>
#
server="127.0.0.1"
user="u0_a180"
 
db_name="testdb"
db_user="${db_name}_user"
db_pass="testpw"
 
sql=$( cat << _END_
DROP USER IF EXISTS ${db_user};
DROP DATABASE IF EXISTS ${db_name};
CREATE DATABASE ${db_name};
GRANT ALL ON ${db_name} TO '${db_user}'@'*' IDENTIFIED BY '${db_pass}';
FLUSH PRIVILEGES;
_END_
)
 
echo "${sql}"
ssh ${user}@${server} -p 8022 "mysql -u root -p ${sql}"
 
