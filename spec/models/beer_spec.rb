require 'rails_helper'

describe Beer do
  it 'exists' do
    attributes = {}
    beer = Beer.new(attributes)

    expect(beer).to be_a Beer
  end

  it 'had attributes' do
    attributes = {
      style: 'Ipa',
      min_temperature: -7,
      max_temperature: 10,
    }

    beer = Beer.new(attributes)

    expect(beer.style).to eq('Ipa')
    expect(beer.min_temperature).to eq(-7)
    expect(beer.max_temperature).to eq(10)
  end

  it 'returns style given temperature' do
    beer = Beer.new
    style = beer.style_by_temperature(-2)

    expect(style).to match(/Dunkel/)
  end
end
