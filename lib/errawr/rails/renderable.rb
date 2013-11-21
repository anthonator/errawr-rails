module Errawr
  module Rails
    module Renderable
      def self.render_with(handler)
        mod = Module.new
        mod.define_singleton_method :included do |object|
          object.class_eval do
            object.const_set(:ERRAWR_HANDLER, handler)
            rescue_from Errawr::Error, with: :render_errawr
            
            private
            def render_errawr(error)
              handler =  self.class.const_get(:ERRAWR_HANDLER)
              self.status = error.context[:http_status] || 500
              render handler.new.call(error)
            end
          end
        end
        mod
      end
    end
  end
end