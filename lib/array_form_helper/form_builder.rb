require 'array_form_helper/form_helper'
module ArrayFormHelper
  module FormBuilder
    ArrayFormHelper::FormHelper::ARRAY_FIELD_HELPERS.each do |selector|
      class_eval <<-RUBY_EVAL, __FILE__, __LINE__ + 1
        def array_#{selector}(method, options = {})
          options[:value] = @object.public_send(method)
          @template.array_#{selector}(@object_name, method, objectify_options(options))
        end
      RUBY_EVAL
    end
  end
end
