def recursive_fib(n)
  case n
  when 2 then 1
  when 1 then 0
  else fib = recursive_fib(n - 1) + recursive_fib(n - 2)
  end
end

def iterative_fib(n)
  return 0 if n == 1
  return 1 if n == 2
  i = 1
  fib_n2 = 0
  fib_n1 = 1
  while i <= n - 2
    fib_n = fib_n2 + fib_n1
    fib_n2 = fib_n1
    fib_n1 = fib_n
    i += 1
  end
  fib_n
end

test_value = 100
puts recursive_fib(test_value)
puts iterative_fib(test_value)

require 'benchmark'
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(test_value) }
  x.report("iterative_fib")  { iterative_fib(test_value)  }
end
