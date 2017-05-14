class Location < ActiveRecord::Base
  geocoded_by :address do |record, results|
    result = results.first
    record.address     = result.address # Store the address used for geocoding
    record.coordinates = RGeo::Geographic.spherical_factory(srid: 4326).point(result.latitude, result.longitude)
  end

  belongs_to :user
  has_many :shared_locations, dependent: :destroy

  validates_presence_of :address, :user, :name

  scope :is_public, -> { where(is_public: true) }

  before_save :geocode

  def get_friends
    shared_locations.joins(:friend).pluck('users.name').join(', ')
  end
end
