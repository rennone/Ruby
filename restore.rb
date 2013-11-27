
def getName(str)
  return "\"" + str + "\""
end

name = "2013-05-04"
Filewrite = open(name+"sql.txt", "w")
open(name+".hbf","r"){ |f|
  f.each_line do |line|
    record = line.scan(/([{])([^{^}]*)([}])/)
    sql = "insert into Kakeibo \n (date, itemName, category, subCategory, price) \n"
    value = "values( " + getName(record[0][1]) +
      "," + getName(record[2][1]) +
      "," + getName(record[3][1]) +
      "," + getName(record[4][1]) +
      "," + record[5][1].to_s + ") \n"
    Filewrite.puts sql + value + "/"
  end
}

Filewrite.close








