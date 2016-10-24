require 'test_helper'
require 'fsort/option'

class OptionTest < Minitest::Test
  def test_time_default_to_asc
    cr = Fsort::Option.parse %w{--mtime --ctime --atime}
    assert_equal({mtime: :asc, ctime: :asc, atime: :asc}, cr)
  end

  def test_size_default_to_desc
    cr = Fsort::Option.parse %w{--size}
    assert_equal({size: :desc}, cr)
  end

  def test_time_order_specified
    cr = Fsort::Option.parse %w{--mtime desc}
    assert_equal({mtime: :desc}, cr)
  end
end
