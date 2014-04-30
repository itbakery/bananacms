json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :address, :city, :province, :country, :postal_code, :coordinates, :latitude, :longitude
  json.url profile_url(profile, format: :json)
end
