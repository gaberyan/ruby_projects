##Gabe Ryan
##Stock Picker
##June 21, 2017
##Ruby


def stock_picker(arr)
  profits = Hash.new()
  arr.each { |cost|
    i = arr.index(cost)
    remain_vals = arr[i..-1]
    diff = remain_vals.max - cost
    profits[i.to_s+","+arr.index(remain_vals.max).to_s] = diff if diff>0
  }
  if !profits.empty?
    max_profit = profits.max_by{|key,val|}
    buy_sell = max_profit[0].split(",")
    puts "Buy on day #{buy_sell[0]} and sell on day #{buy_sell[1]} for $#{max_profit[1]} in profit."
  else
    puts "Don't buy, no profits can be made!"
  end
end


stock_picker([17,3,6,9,15,8,6,1,10])
stock_picker([5,4,3,2,1])
