# -*- coding: utf-8 -*-
 $KCODE='s'
 require 'jcode'
Year = ["2011","2012","2013"]
Month = ["01","02","03","04","05","06","07","08","09","10","11","12"]
Day = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17"]
for i in 18..28 do
  Day.push(i.to_s)
end
Category = ["漫画","小説", "ライトノベル","食費", "交通費"]
Name = ["飲み会", "ドリフターズ3巻", "ベイビーステップ", "インデックス", "TX", "AAA", "BBB", "CCC"]

file = open("sampleKakeibo.txt","w")
prefix = "INSERT INTO Kakeibo \n (Date, ItemName, ItemCategory, ItemValue) \n VALUES("
i = 0

def getComic
  list = ["ブリーチ", "ワンピース","ナルト", "トリコ","暗殺教室","バクマン","ハンターハンター","スケットダンス"]
  str = "\"" + list[rand(list.length)] + (rand(50)+1).to_s + "巻\", \"漫画\", " + (420 + 10*rand(3)).to_s + ")"
end

def getNovel
  list = ["シャーロックホームズの冒険", "不思議の国のアリス", "鏡の国のアリス", "NINJAスレイヤー", "ビブリア古書道の事件手帳"]
  str = "\"" + list[rand(list.length)] + "\", \"小説\", " + (630 + 100*rand(3)).to_s + ")"
end

def getLightNovel
  list = ["シャナ", "インデックス", "SAO", "アクセルワールド", "さくら荘"]
  str = "\""+ list[rand(list.length)] + (rand(20)+1).to_s + "巻\", \"ラノベ\", " + (600 + 10*rand(3)).to_s + ")"
end

def getMeal
  list = ["食材", "外食", "飲み会"]
  str = "\""+ list[rand(list.length)] + "\", \"食費\"," + (10*rand(300) + 100).to_s + ")"
end

def getFare
  list = ["TX", "バス", "タクシー"]
  str = "\""+ list[rand(list.length)] + "\", \"交通費\"," + (10*rand(200) + 100).to_s + ")"
end

List = [getComic, getNovel, getLightNovel, getMeal, getFare]

for i in 1..300 do
  date = "\"" + Year[rand(Year.length)] + "-" + Month[rand(Month.length)] + "-" + Day[rand(Day.length)] + "\","
  file.puts(prefix + date + List[rand(List.length)] + "\n/")
end

file.close
