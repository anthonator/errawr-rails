module Errawr
  module Rails
    module Renderers
      class JSON
        def call(error)
          {
            json: {
              error: error.context[:name] || error.key,
              description: error.message
            }.merge(error.metadata)
          }
        end
      end
    end
  end
end