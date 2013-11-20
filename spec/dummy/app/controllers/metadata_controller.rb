class MetadataController < ApplicationController
  include Errawr::Rails::JSON
  
  def index
    register!(:dummy_error, message: 'Dummy Message', metadata: { developer: 'Anthony' })
    error!(:dummy_error)
  end
end
