require 'test/unit'
require_relative '../lib/algo'

class LevenshteinTest < Test::Unit::TestCase
  def test_distance_to_self_is_zero
    assert_equal 0, distance('abc', 'abc')
  end

  def test_one_missing_character_distance_of_one
    assert_equal 1, distance('abc', 'ab')
    assert_equal 1, distance('ab', 'abc')
  end

  def test_two_missing_characters_distance_of_two
    assert_equal 2, distance('abc', 'a')
    assert_equal 2, distance('a', 'abc')
  end

  def test_replace_a_character_distance_of_one
    assert_equal 1, distance('abc', 'bbc')
    assert_equal 1, distance('bbc', 'abc')
  end

  def test_replace_two_characters_distance_of_two
    assert_equal 2, distance('abc', 'cba')
    assert_equal 2, distance('cba', 'abc')
  end
end