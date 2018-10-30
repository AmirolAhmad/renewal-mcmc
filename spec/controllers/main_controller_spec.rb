require 'rails_helper'

RSpec.describe MainController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_session) { sign_in(user) }
end
