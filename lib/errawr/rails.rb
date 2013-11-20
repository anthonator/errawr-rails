require 'active_support/rescuable'
require 'errawr'
require 'errawr/http'

require 'errawr/rails/renderable'
require 'errawr/rails/json'
require 'errawr/rails/version'

module Errawr
  module Rails
    def self.included(base)
      base.send(:include, Errawr::ClassMethods)
    end
  end
end
