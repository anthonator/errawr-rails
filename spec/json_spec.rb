require 'spec_helper'

describe Errawr::Rails::JSON do
  context 'RenderableController', type: :controller do
    controller(Dummy::RenderableController) do
      extend RSpec::Rails::ControllerExampleGroup::BypassRescue
    end
    
    before(:each) do
      @request = ActionController::TestRequest.new
    end
  
    it 'should render a bad_request error in JSON' do
      error = Errawr::Mapper[:bad_request]
      get :index
      response.body.should == { error: error.key, description: error.message }.to_json
    end
    
    it 'should render a status of 400 for bad request' do
      error = Errawr::Mapper[:bad_request]
      get :index
      response.status.should == 400
    end
  end
  
  context 'MetadataController', type: :controller do
    controller(Dummy::MetadataController) do
      extend RSpec::Rails::ControllerExampleGroup::BypassRescue
    end
    
    before(:each) do
      @request = ActionController::TestRequest.new
    end
  
    it 'should render metadata in the JSON response' do
      error = Errawr::Mapper[:bad_request]
      get :index
      response.body.should == { error: 'dummy_error', description: 'Dummy Message', developer: 'Anthony' }.to_json
    end
    
    it 'should render a status of 500 for an error that doesnt specify http_status' do
      error = Errawr::Mapper[:bad_request]
      get :index
      response.status.should == 500
    end
  end
end