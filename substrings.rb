##Gabe Ryan
##substrings
##June 21, 2017
##Ruby

def substrings(text, dict)
  text.downcase!
  text = text.split(" ")
  subs = Hash.new(0)
  dict.each { |word|
    text.each { |item| subs[word]+=1 if item.include? word }
  }
  puts subs
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("Below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)
