require 'rails_helper'
require 'spec_helper'

RSpec.describe Restaurant, type: :model do
  describe described_class, type: :model do
    it { is_expected.to belong_to :user }

    it 'is not valid with a name of less than 3 characters' do
      restaurant = described_class.new(name: 'kf')
      expect(restaurant).to have(1).error_on(:name)
      expect(restaurant).not_to be_valid
    end
  end

  describe '#average_rating' do
    context 'no reviews' do
      it "returns 'N/A' when there are no reviews" do
        restaurant = described_class.create(name: 'The Ivy')
        expect(restaurant.average_rating).to eq 'N/A'
      end
    end
  end

  context '1 review' do
    it 'returns that rating' do
      restaurant = described_class.create(name: 'The Ivy')
      restaurant.reviews.create(rating: 4)
      expect(restaurant.average_rating).to eq 4
    end
  end
end
