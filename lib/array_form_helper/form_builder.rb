module ArrayFormHelper
  module FormBuilder
    def array_text_field(method, options = {})
      options[:value] = @object.public_send(method)
      @template.array_text_field(@object_name, method, objectify_options(options))
    end
  end
end
