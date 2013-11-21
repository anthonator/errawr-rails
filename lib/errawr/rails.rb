require 'active_support/rescuable'
require 'errawr'
require 'errawr/http'

require 'errawr/rails/renderable'
require 'errawr/rails/renderers/json'
require 'errawr/rails/version'

module Errawr
  module Rails
    def self.included(base)
      base.send(:include, Errawr::ClassMethods)
    end
    
    def self.with_renderer(renderer)
      mod = Module.new
      mod.define_singleton_method :included do |object|
        object.send(:include, Errawr::Rails)
        object.send(:include, Errawr::Rails::Renderable.render_with(renderer))
      end
      mod
    end
  end
end
