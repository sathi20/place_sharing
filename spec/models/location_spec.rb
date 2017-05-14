require "rails_helper"

describe Location, type: :model do
  before(:each) do
    Location.any_instance.stub(:geocode).and_return([1,1])
  end

  context "scopes" do
    describe ".is_public" do
      let!(:public_location)  { create(:location) }
      let!(:private_location) { create(:location, is_public: false) }

      it "should return locations that are public" do
        expect(Location.is_public).to include(public_location)
      end

      it "should not return locations that are private" do
        expect(Location.is_public).not_to include(private_location)
      end
    end
  end

  describe "#get_friends" do
    let!(:location)        { create(:location) }
    let!(:friend)          { create(:friend, name: 'new friend') }
    let!(:shared_location) { create(:shared_location, location: location, friend: friend) }

    it "should return formatted names" do
      expect(location.get_friends).to include('new friend')
    end
  end
end
