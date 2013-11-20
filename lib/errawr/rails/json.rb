module Errawr
  module Rails
    module JSON
      def self.included(base)
        base.send(:include, Renderable)
        base.class_eval do
          def render_errawr(error)
            self.status = error.context[:http_status] || 500
            render json: {
              error: error.context[:name] || error.key,
              description: error.message
            }.merge(error.metadata)
          end
        end
      end
    end
  end
end