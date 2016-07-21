json.extract! user, :id, :first_name, :last_name, :phone, :company_id, :shop_id, :role, :created_at, :updated_at
json.url user_url(user, format: :json)