# frozen_string_literal: true

#
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let!(:books) { FactoryBot.create_list(:book, 10) }

  describe 'GET #index' do
    before { get :index }

    it 'assign @latest_books' do
      expect(assigns(:latest_books)).to match_array(books.last(3))
      expect(response).to render_template :index
    end

    it 'assign @bestsellers' do
      expect(assigns(:bestsellers)).not_to be_nil
    end

    it 'render home index' do
      expect(response).to render_template :index
    end

    it 'return a success response' do
      expect(response.status).to eq(200)
    end
  end
end
