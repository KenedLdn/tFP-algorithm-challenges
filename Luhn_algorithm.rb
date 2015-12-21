require 'minitest/autorun'

module Luhn
  def self.is_valid?(number)
    arr = number.to_s.split(//).map {|str| str.to_i}
    n = 1
    while n < arr.size
      arr.size.even? ? arr[n - 1] *= 2 : arr[n] *= 2
      n += 2
    end
    sum_digits = arr.collect {|digit| digit >= 10 ? (digit - 9) : digit}
    sum_digits.reduce(:+) % 10 == 0
  end
end

class TestLuhn < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end

  def test_luhn_valid2
    assert Luhn.is_valid?(377681478627336), "Check step two: Did you start at the right?"
  end

  def test_luhn_invalid2
    assert ! Luhn.is_valid?(377681478627337), "Check step two: Did you start at the right?"
  end

end
