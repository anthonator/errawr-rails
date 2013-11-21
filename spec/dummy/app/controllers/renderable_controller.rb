class RenderableController < ApplicationController
  include Errawr::Rails.with_renderer(Errawr::Rails::Renderers::JSON)
  
  def index
    error!(:bad_request)
  end
end
