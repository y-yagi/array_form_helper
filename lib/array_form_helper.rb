require 'action_view'
require 'action_controller'
require 'array_form_helper/version'
require 'array_form_helper/form_builder'
require 'array_form_helper/form_helper'

ActionView::Helpers::FormBuilder.send(:include, ArrayFormHelper::FormBuilder)
ActionController::Base.helper ArrayFormHelper::FormHelper
