class RenderableController < ApplicationController
  include Errawr::Rails::JSON
  
  def index
    error!(:bad_request)
  end
end
