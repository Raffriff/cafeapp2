json.extract! order, :id, :pickUpTime, :totalPrice, :profile_id, :created_at, :updated_at
json.url order_url(order, format: :json)
