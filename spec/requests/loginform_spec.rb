require 'rails_helper'

RSpec.describe "Loginforms", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/loginform/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/loginform/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/loginform/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
