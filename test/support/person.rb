require 'active_model'
class Person
  include ActiveModel::Model
  attr_accessor :tags
end
