require 'rails_helper'

describe 'Beers API' do
  let!(:beers) { create_list(:beer, 10) }
  let(:beer_id) { beers.first.id }

  describe 'GET /beers' do
    before { get api_v1_beers_path }

    it 'returns beers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /beers/:id' do
    before { get api_v1_beer_path(beer_id) }

    context 'when the beer exists' do
      it 'returns beer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(beer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:beer_id) { 12345 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Beer/)
      end
    end
  end
end
