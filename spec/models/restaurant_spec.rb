require 'rails_helper'
require 'spec_helper'

RSpec.describe Restaurant, type: :model do

  describe Restaurant, :type => :model do

    it { is_expected.to belong_to :user }

    it 'is not valid with a name of less than 3 characters' do
      restaurant = Restaurant.new(name: "kf")
      expect(restaurant).to have(1).error_on(:name)
      expect(restaurant).not_to be_valid
    end
  end

end
