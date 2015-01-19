require 'minitest_helper'

class ArrayFormBuilderTest < MiniTest::Test
  include ArrayFormHelper::TestHelper

  def setup
    setup_controller
  end

  def test_array_text_field_without_array_size_option
    setup_form

    actual = @f.array_text_field(:tags)
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags\" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_field_with_array_size_option
    setup_form

    actual = @f.array_text_field(:tags, { array_size: 2 })
    expected = %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags_0\" />) +
      %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags_1\" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_field_with_value
    setup_form(tags: %w(sports art))

    actual = @f.array_text_field(:tags, array_size: 3)
    expected = %(<input name=\"person[tags][]\" value="sports" type=\"text\" id=\"person_tags_0\" />) +
      %(<input name=\"person[tags][]\" value="art" type=\"text\" id=\"person_tags_1\" />) +
      %(<input name=\"person[tags][]\" type=\"text\" id=\"person_tags_2\" />)
    assert_dom_equal expected, actual
  end

  private

    def setup_form(object_params = nil)
      p = Person.new(object_params)
      @controller.view_context.form_for(p) { |f| @f = f }
    end
end
