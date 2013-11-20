module Errawr
  module Rails
    module Renderable
      def self.included(base)
        base.send(:include, Errawr::Rails) unless base.ancestors.include?(Errawr::Rails)
        base.send(:include, ActiveSupport::Rescuable)
        base.class_eval do
          rescue_from Errawr::Error, with: :render_errawr
        end
      end
      
      def render_errawr
        raise 'Method render_errawr not defined...'
      end
    end
  end
end