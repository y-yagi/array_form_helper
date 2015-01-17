$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'array_form_helper'
require 'support/person'
require 'minitest/autorun'
require 'pry'
require 'rails/dom/testing/assertions/dom_assertions'

module ArrayFormHelper::TestHelper
  def setup_controller
    router = ActionDispatch::Routing::RouteSet.new
    router.draw { resources :people }
    @controller = ActionView::TestCase::TestController.new
    @controller.instance_variable_set(:@_routes, router)
    @controller.class_eval { include router.url_helpers }
    @controller.view_context_class.class_eval { include router.url_helpers }
  end

  include ::Rails::Dom::Testing::Assertions::DomAssertions
end
