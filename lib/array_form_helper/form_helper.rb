module ArrayFormHelper
  module FormHelper
    def array_text_field(object_name, method, options = {})
      options[:name] = "#{object_name}[#{method}][]"
      if options[:array_size]
        array_size = options.delete(:array_size).to_i
        value = options.delete(:value) if options[:value]
        array_size.times.map do |i|
          options[:value] = value[i] if value && value.is_a?(Array)
          text_field(object_name, method, options)
        end.join.html_safe
      else
        text_field(object_name, method, options)
      end
    end
  end
end
