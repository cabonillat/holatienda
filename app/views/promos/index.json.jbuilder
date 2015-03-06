json.array!(@promos) do |promo|
  json.extract! promo, :id, :title, :content, :product, :start_date, :finish_date, :discount
  json.url promo_url(promo, format: :json)
end
