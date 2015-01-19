require 'minitest_helper'

class ArrayFormBuilderTest < MiniTest::Test
  include ArrayFormHelper::TestHelper

  def setup
    setup_controller
  end

  def test_array_text_field_without_array_size_option
    setup_form

    actual = @f.array_text_field(:tags)
    expected = %(<input name="person[tags][]" type="text" id="person_tags" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_field_with_array_size_option
    setup_form

    actual = @f.array_text_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="text" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="text" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_field_with_value
    setup_form(tags: %w(sports art))

    actual = @f.array_text_field(:tags, array_size: 3)
    expected = %(<input name="person[tags][]" value="sports" type="text" id="person_tags_0" />) +
      %(<input name="person[tags][]" value="art" type="text" id="person_tags_1" />) +
      %(<input name="person[tags][]" type="text" id="person_tags_2" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_area_with_array_size_option
    setup_form

    actual = @f.array_text_area(:tags, { array_size: 2 })
    expected = %(<textarea name="person[tags][]" id="person_tags_0">\n</textarea>) +
      %(<textarea name="person[tags][]" id="person_tags_1">\n</textarea>)
    assert_dom_equal expected, actual
  end

  def test_array_color_field_with_array_size_option
    setup_form

    actual = @f.array_color_field(:tags, { array_size: 2 })
    expected = %(<input value="#000000" name="person[tags][]" type="color" id="person_tags_0" />) +
      %(<input value="#000000" name="person[tags][]" type="color" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_search_field_with_array_size_option
    setup_form

    actual = @f.array_search_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="search" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="search" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_telephone_field_with_array_size_option
    setup_form

    actual = @f.array_telephone_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="tel" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="tel" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_phone_field_with_array_size_option
    setup_form

    actual = @f.array_phone_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="tel" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="tel" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_date_field_with_array_size_option
    setup_form

    actual = @f.array_date_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="date" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="date" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_time_field_with_array_size_option
    setup_form

    actual = @f.array_time_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="time" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="time" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_text_datetime_with_array_size_option
    setup_form

    actual = @f.array_datetime_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="datetime" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="datetime" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_datetime_local_field_with_array_size_option
    setup_form

    actual = @f.array_datetime_local_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="datetime-local" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="datetime-local" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_month_field_with_array_size_option
    setup_form

    actual = @f.array_month_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="month" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="month" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_week_field_with_array_size_option
    setup_form

    actual = @f.array_week_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="week" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="week" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_url_field_with_array_size_option
    setup_form

    actual = @f.array_url_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="url" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="url" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_email_field_with_array_size_option
    setup_form

    actual = @f.array_email_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="email" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="email" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_number_field_with_array_size_option
    setup_form

    actual = @f.array_number_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="number" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="number" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  def test_array_range_field_with_array_size_option
    setup_form

    actual = @f.array_range_field(:tags, { array_size: 2 })
    expected = %(<input name="person[tags][]" type="range" id="person_tags_0" />) +
      %(<input name="person[tags][]" type="range" id="person_tags_1" />)
    assert_dom_equal expected, actual
  end

  private

    def setup_form(object_params = nil)
      p = Person.new(object_params)
      @controller.view_context.form_for(p) { |f| @f = f }
    end
end
