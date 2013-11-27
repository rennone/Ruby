# -*- coding: utf-8 -*-
NUMBER_OF_URL = 5

class Node
  attr_accessor :Next
  def initialize(url)
    @URL = url
    @Access = 1
    @Next = Array.new(NUMBER_OF_URL,nil)
  end

  def CountUp
    @Access += 1
  end
  
end
 
$Root = Array.new(NUMBER_OF_URL, nil)   #各URLを始点とした場合のrootのポインタ

class Tuple
  attr__accessor :URL ,userID
  def initialize(url, id)
    @URL = url
    @userID = id
  end
end

def tra(a)
  return a
end


def bolt1(tuple)
  userID = tuple.userID
  url    = tuple.URL

  urlNum = tra(url)

  prev = Array.new(NUMBER_OF_URL, nil)

  frag = false
  if prev[urlNum] == nil
    if $Root[urlNum] == nil
      $Root[urlNum] = prev[urlNum] = Node.new(url)
    else
      $Root[urlNum].CountUp
      prev[urlNum] = $Root[urlNum]
    end
    UserDB[userID][urlNum] = prev[urlNum]

    frag = true
  end

  i=0
  while i<NUMBER_OF_URL
    if prev[i] == nil next end

    if i == urlNum and frag next end
    
    if prev[i].Next[urlNum] == nil
      if $Root[urlNum] == nil
        $Root[urlNum] = prev[i].Next[urlNum] = Node.new(url)
      else
        prev[i].Next[urlNum] = Node.new(url)
      end
    else
      prev[i].Next[urlNum].CountUp
    end

    UserDB[userID][i] = prev[i].Next[urlNum]  
  end
  
      
end


