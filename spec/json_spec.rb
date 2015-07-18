require 'spec_helper'

describe Errawr::Rails::Renderers::JSON do
  context 'RenderableController', type: :controller do
    controller(RenderableController) do
      extend RSpec::Rails::ControllerExampleGroup::BypassRescue
    end

    before(:each) do
      @request = ActionController::TestRequest.new
    end

    it 'should render a bad_request error in JSON' do
      get :index
      expect(response.body).to eq({ error: 'bad_request', description: 'Bad Request' }.to_json)
    end

    it 'should render a status of 400 for bad request' do
      get :index
      expect(response.status).to eq(400)
    end
  end

  context 'MetadataController', type: :controller do
    controller(MetadataController) do
      extend RSpec::Rails::ControllerExampleGroup::BypassRescue
    end

    before(:each) do
      @request = ActionController::TestRequest.new
    end

    it 'should render metadata in the JSON response' do
      get :index
      expect(response.body).to eq({ error: 'dummy_error', description: 'Dummy Message', developer: 'Anthony' }.to_json)
    end

    it 'should render a status of 500 for an error that doesnt specify http_status' do
      get :index
      expect(response.status).to eq(500)
    end
  end
end
