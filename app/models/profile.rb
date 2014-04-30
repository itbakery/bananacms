class Profile
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  field :first_name, type: String
  field :last_name, type: String
  field :address, type: String
  field :city, type: String
  field :province, type: String
  field :country, type: String
  field :postal_code, type: String
  field :coordinates, type: Array
  field :latitude, type: String
  field :longitude, type: String

  include Geocoder::Model::Mongoid
  geocoded_by  :address
  after_validation :geocode

  before_save  :set_latlng
  def  set_latlng
    self.longitude = coordinates[0]
    self.latitude = coordinates[1]
  end

end
