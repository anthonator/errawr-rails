class MetadataController < ApplicationController
  include Errawr::Rails.with_renderer(Errawr::Rails::Renderers::JSON)
  
  def index
    register!(:dummy_error, message: 'Dummy Message', metadata: { developer: 'Anthony' })
    error!(:dummy_error)
  end
end
