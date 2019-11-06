def stock_picker(arr)
  profits = {}
  days = []

  # get each day and add succeededing days after into days array
  arr.each_with_index do |i,index|
     new_arr = arr[index,arr.length]
     days.push(new_arr)
  end

  # loop over each array in days & determine the best scenario
  # initial is purchase because it assumes the array is the succeeding days after the purchase
  days.each_with_index do |i,index|
    purchase = i[0]
    sell_at = i.max
    p_date = arr.index(i[0])
    s_date = arr.index(i.max)

    profit = sell_at - purchase
    profits[profit] = [p_date, s_date]
  end
  k = profits.keys.max

  print profits[k]
end

stock_picker([17,3,6,9,15,8,6,1,10])