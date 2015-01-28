require "minitest/autorun"

class FibonacciTest < MiniTest::Test

  def test_suite_0_donne_1
    assert_equal 1, fibonacci(0)
  end
  
  def test_suite_1_donne_1
    assert_equal 1, fibonacci(1)
  end
  
  def test_suite_2_donne_2
    assert_equal 2, fibonacci(2)
  end
  
  def test_suite_3_donne_3
    assert_equal 3, fibonacci(3)
  end
  
  def test_suite_4_donne_5
    assert_equal 5, fibonacci(4)
  end
  
end

def fibonacci(suites)
  suites <= 1 ? 1 : fibonacci(suites-2) + fibonacci(suites-1)
end
