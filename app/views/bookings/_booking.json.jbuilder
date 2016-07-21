json.extract! booking, :id, :name, :product_id, :quantity, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)