$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'support/person'
require 'pry'
require 'action_dispatch'
require 'array_form_helper'
require 'minitest/autorun'

def setup_controller
  router = ActionDispatch::Routing::RouteSet.new
  router.draw { resources :people }
  @controller = ActionView::TestCase::TestController.new
  @controller.instance_variable_set(:@_routes, router)
  @controller.class_eval { include router.url_helpers }
  @controller.view_context_class.class_eval { include router.url_helpers }
end
