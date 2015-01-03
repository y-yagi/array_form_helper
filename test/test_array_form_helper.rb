require 'minitest_helper'

class TestArrayFormHelper < MiniTest::Test
  def setup
    setup_controller
  end

  def test_array_text_field_without_array_size_option
    actual = @controller.view_context.array_text_field(:person, :tags)
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />)
    assert_equal expected, actual
  end

  def test_array_text_field_with_array_size_option
    actual = @controller.view_context.array_text_field(:person, :tags, { array_size: 5 })
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />) * 5
    assert_equal expected, actual
  end

  def test_array_text_field_with_default_value
    actual = @controller.view_context.array_text_field(:person, :tags, { array_size: 3, value: %w(sports art) })
    expected = %(<input name=\"person[tags][]\" value="sports" type=\"text\" id=\"person_tags\" />) +
      %(<input name=\"person[tags][]\" value="art" type=\"text\" id=\"person_tags\" />) +
      %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />)
    assert_equal expected, actual
  end
end
