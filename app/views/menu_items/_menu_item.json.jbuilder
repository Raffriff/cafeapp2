json.extract! menu_item, :id, :product, :description, :price, :created_at, :updated_at
json.url menu_item_url(menu_item, format: :json)
