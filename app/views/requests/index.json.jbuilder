json.array!(@requests) do |request|
  json.extract! request, :id, :data
  json.url request_url(request, format: :json)
end
