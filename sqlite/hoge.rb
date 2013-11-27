# -*- coding: utf-8 -*-
require 'sqlite3'

db = SQLite3::Database.new("hoge.db")

sql = <<SQL
create table サンプル (
 item1 varchar(10),
 item2 integer,
 item3 varchar(200)
);
SQL
db.execute(sql)
  
    
put "success"
