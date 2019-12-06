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

  describe 'POST /beers' do
    let(:valid_attributes) { { style: 'Ipa', min_temperature: -7, max_temperature: 10 } }

    context 'request is valid' do
      before { post api_v1_beers_path, params: valid_attributes }

      it 'creates a beer' do
        expect(json['style']).to eq('Ipa')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'request must have all attributes' do
      before { post api_v1_beers_path, params: { style: 'Ipa' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include('Validation failed')
      end
    end
  end

  describe 'PUT /beers/:id' do
    let(:valid_attributes) { { style: 'Pilsen' } }

    context 'when the beer exists' do
      before { put api_v1_beer_path(beer_id), params: valid_attributes }

      it 'updates the beer' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
