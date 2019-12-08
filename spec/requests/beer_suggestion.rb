require 'rails_helper'

describe 'Beer Suggestion' do
  let!(:beers) { create_list(:beer, 10) }

  describe 'GET /beer-suggestion?temperature=-2' do
    before { get api_v1_beer_suggestion_path, params: { temperature:  -2  } }

    context 'request is valid' do
      it 'return style' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
