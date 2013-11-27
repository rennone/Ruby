# coding: utf-8
def getName(str)
  return "\"" + str + "\""
end

id = Hash.new(0)
year = "2012"
file = open(year + "sql.txt","w")
date = ""
open(year+".txt") {|f|
  f.each_line do |line|
    elem = line.chomp!.split(/\s+/)
    if elem.length == 1
      date = ""
      elem[0].scan(/\d+/).each do |a|
        date = date + "-" + sprintf("%02d",a.to_i)
      end
      date = year + date
    elsif elem.length >= 2
      next if line.include?("合計")
      cate = line.split(/[-\d]+/).last.strip
      val  = line.split(/[^-\d]+/).last.strip
      name = (line+" \n").sub(/[-\d]+\D+\n/,"").strip
      
      if(cate == "")
        print name + " cate = "
        cate = gets
      end
      
      cate = "食費" if cate == "食"
      cate = "交通費" if name.include?("電車賃")
      subcate = ""
      if( cate == "漫画" or cate == "小説" or cate == "ラノベ" or cate == "書籍" )
        subcate = cate
        cate = "書籍"
      end
      id[date] += 1
      itemId = id[date]
      file.puts "INSERT INTO Kakeibo \n(date, itemName, category, subCategory, price)" 
      file.puts "VALUES(" + getName(date) + "," + getName(name.strip) + "," + getName(cate.strip) + ","+ getName(subcate) + ","+val.strip + ")"
      file.puts "/"
    end
    
  end
  
}
