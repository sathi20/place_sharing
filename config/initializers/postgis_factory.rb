RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
  # By default, use the GEOS implementation for spatial columns.
  # But use a geographic implementation for point columns.
  config.default = RGeo::Geographic.spherical_factory(srid: 4326)
end
