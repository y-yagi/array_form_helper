require 'minitest_helper'

class TestArrayFormBuilder < MiniTest::Test
  include ArrayFormHelper::TestHelper

  def setup
    setup_controller
  end

  def test_array_text_field_without_array_size_option
    @p = Person.new
    @controller.view_context.form_for(@p) { |f| @f = f }

    actual = @f.array_text_field(:tags)
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />)
    assert_equal expected, actual
  end

  def test_array_text_field_with_array_size_option
    @p = Person.new
    @controller.view_context.form_for(@p) { |f| @f = f }

    actual = @f.array_text_field(:tags, { array_size: 5 })
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />) * 5
    assert_equal expected, actual
  end

  def test_array_text_field_with_default_value
    @p = Person.new(tags: %w(sports art))
    @controller.view_context.form_for(@p) { |f| @f = f }

    actual = @f.array_text_field(:tags, array_size: 3)
    expected = %(<input name=\"person[tags][]\" value="sports" type=\"text\" id=\"person_tags\" />) +
      %(<input name=\"person[tags][]\" value="art" type=\"text\" id=\"person_tags\" />) +
      %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />)
    assert_equal expected, actual
  end
end
