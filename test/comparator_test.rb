require 'test_helper'
require 'fsort/comparator'

class ComparatorTest < Minitest::Test

  def test_specific_order
    compare [1], [2], 1, [:desc]
  end
  
  def test_complex_specific_order
    compare [2,3,5], [2,1,4], 1, [:desc, :asc, :desc]
  end

  def test_all_equal
    compare [1,1], [1,1], 0, [:asc, :desc]
  end

  private

  HasStats = Struct.new :stats

  def compare arr_1, arr_2, exp, orders
    cmp = Fsort::Comparator.new orders
    f1, f2 = HasStats.new(arr_1), HasStats.new(arr_2)
    result = cmp[f1, f2]
    assert_equal(exp, result)
    result = cmp[f2, f1]
    assert_equal(-exp, result)
  end
end
