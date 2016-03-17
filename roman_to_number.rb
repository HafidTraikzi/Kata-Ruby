require "minitest/autorun"

class RTNTest < MiniTest::Test

  def test_1_donne_I
    assert_equal 1, convert("I")
  end
  
  def test_5_donne_V
    assert_equal 5, convert("V")
  end
  
  def test_2_donne_II
    assert_equal 2, convert("II")
  end
  
  def test_3_donne_III
    assert_equal 3, convert("III")
  end
  
  def test_6_donne_VI
    assert_equal 6, convert("VI")
  end
  
  def test_4_donne_IV
    assert_equal 4, convert("IV")
  end
  
  def test_1984_donne_MCMLXXXIV
    assert_equal 1984, convert("MCMLXXXIV")
  end
  
end

def convert(roman)  

  dico = {""=>0, "I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000}
  
  result = 0
  previous_letter = ""
  
  roman.split("").reverse_each do |letter|
    if dico[previous_letter] > dico[letter]
      result -= dico[letter]
    else
      result += dico[letter]
      previous_letter = letter
    end
  end
  
  return result
  
end
