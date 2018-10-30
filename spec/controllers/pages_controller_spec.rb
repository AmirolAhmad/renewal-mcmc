require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "when user visit root url" do
    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "pages",
        action: "index")
    end
  end
end
