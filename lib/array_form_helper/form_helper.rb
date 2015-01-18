module ArrayFormHelper
  module FormHelper
    ARRAY_FIELD_HELPERS = [
      :text_field, :text_area, :color_field, :search_field, :telephone_field,
      :phone_field, :date_field, :time_field, :datetime_field,
      :datetime_local_field, :month_field, :week_field, :url_field,
      :email_field, :number_field, :range_field
    ]

    ARRAY_FIELD_HELPERS.each do |selector|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        def array_#{selector}(object_name, method, options = {})
          options[:name] = "%s[%s][]" % [object_name, method]
          if options[:array_size]
            array_size = options.delete(:array_size).to_i
            value = options.delete(:value) if options[:value]
            array_size.times.map do |i|
              options[:value] = value[i] if value && value.is_a?(Array)
              options[:id] = "%s_%s_%s" % [object_name, method, i]
              #{selector}(object_name, method, options)
            end.join.html_safe
          else
            #{selector}(object_name, method, options)
          end
        end
      RUBY_EVAL
    end
  end
end
