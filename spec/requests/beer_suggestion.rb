require 'rails_helper'

describe 'Beer Suggestion' do
  describe 'GET /beer-suggestion?temperature=-2' do
    before { get api_v1_beer_suggestion_path, params: -2 }

    context 'request is valid' do
      it 'return beer' do
        expect(json).not_to be_empty
        expect(json).to include('style')
      end
    end
  end
end
