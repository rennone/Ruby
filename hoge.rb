# -*- coding: utf-8 -*-
require "nkf"

wFile = [open("2013年度家計簿1月.txt","a"),
         open("2013年度家計簿2月.txt","a"),
         open("2013年度家計簿3月.txt","a"),
         open("2013年家計簿4月.txt","w"),
         open("2013年家計簿5月.txt","w")]
open("2013-05-04.hbf","r").each do |line|
  pattern = line.scan(/({)([^{}]*)(})/);
  date = pattern[0][1].split("-");
  fdate = "=Date("+date[0] + "," + date[1] + "," + date[2] + ")"
  
  str = "{"+fdate+"#"+pattern[3][1]+"#"+pattern[2][1]+"#"+pattern[5][1]+"}"
  wFile[ date[1].to_i-1].puts(str)
end
