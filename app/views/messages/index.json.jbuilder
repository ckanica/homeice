json.array!(@messages) do |message|
  json.extract! message, :id, :phone, :rink_id, :condition, :created_at
  json.url message_url(message, format: :json)
end
