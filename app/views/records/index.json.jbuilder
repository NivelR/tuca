json.array!(@records) do |record|
  json.extract! record, :id, :email, :image, :user_id
  json.url record_url(record, format: :json)
end
