#!/bin/bash

arr=`mysql -uroot -pzazaza -e "show databases" 2>&1 | grep -v "Warning" | grep -i soli` 

for i in ${arr[*]} ; do 
	mysql -uroot -pzazaza -e "drop database \`$i\` ;" 2>&1 | grep -v "Warning" 
done

echo "Vkarai imeto na papkata!"

read new_one

rails new $new_one -d mysql
cd $new_one

sed -i "21i gem \'solidus\'" Gemfile 
sed -i "22i gem \'solidus_auth_devise\'" Gemfile

bundle install 

cd config
sed -i 's/password:/password: zazaza/1' database.yml
cd ../

bundle exec rails g spree:install
bundle exec rails g solidus:auth:install
bundle exec rake railties:install:migrations
bundle exec rake db:migrate

rails s -b `ifconfig | grep -i enp -A1 | tail -1 | awk {'print $2'} | sed -e 's/addr://g'`


