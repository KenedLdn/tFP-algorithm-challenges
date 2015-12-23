def collatz_sequence(n)
  arr = [n]
  while n != 1
    if n.even?
      n = n / 2
    else
      n = n * 3 + 1
    end
    arr << n
  end
  arr
end

def find_longest_collatz(n)
  arr = [[0, 0]]
  (1..n).each do |x|
    seq = collatz_sequence(x)
    arr << [x, seq.size] if seq.size >= arr.last[1]
  end
  arr
end

test_range = 1000000
puts find_longest_collatz(test_range).last.inspect
