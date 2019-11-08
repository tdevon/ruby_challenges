def fibs(target_num)
  nums = [0]
  i = 0
  while nums.length < target_num
    current_num = nums[i]
    before_num = nums[i-1]
    two_before_num = nums[i-2]
    if before_num == nil
      nums.push(current_num + 1)
    elsif two_before_num == nil
      nums.push(current_num + 1)
    else
      nums.push(before_num + two_before_num)
    end
    current_num = nums[-1]
  end
  i += 1
  puts nums
end
fibs(7)

def fibs_rec(n)
  return n if (0..1).include? n
  if n > 1
    fibs_rec(n-1) + fibs_rec(n-2)
  end
end
fibs_rec(4)