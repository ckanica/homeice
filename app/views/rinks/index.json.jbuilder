json.array!(@rinks) do |rink|
  json.extract! rink, :id, :name, :address, :rink_type, :ottawa_rinks_ref
  json.url rink_url(rink, format: :json)
end
