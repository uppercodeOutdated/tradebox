# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?

  company1 = Company.create name: 'Coca Cola 1'
  shop1    = Shop.create    name: 'Baker Market', address: 'Naykova str., 42'

  company2 = Company.create name: 'Adidas'
  shop2    = Shop.create    name: 'Adidas Shop', address: 'Naykova str., 42'

  shop1.users.create    email: 'customer11@example.com', password: 'customer11', first_name: 'Customer', last_name: 'Customer 11', role: :customer
  company1.users.create email: 'provider11@example.com', password: 'provider11', first_name: 'Provider', last_name: 'Provider 11', role: :provider
  shop1.users.create    email: 'customer12@example.com', password: 'customer12', first_name: 'Customer', last_name: 'Customer 12', role: :customer
  company1.users.create email: 'provider12@example.com', password: 'provider12', first_name: 'Provider', last_name: 'Provider 12', role: :provider

  shop2.users.create    email: 'customer21@example.com', password: 'customer21', first_name: 'Customer', last_name: 'Customer 21', role: :customer
  company2.users.create email: 'provider21@example.com', password: 'provider21', first_name: 'Provider', last_name: 'Provider 21', role: :provider
  shop2.users.create    email: 'customer22@example.com', password: 'customer22', first_name: 'Customer', last_name: 'Customer 22', role: :customer
  company2.users.create email: 'provider22@example.com', password: 'provider22', first_name: 'Provider', last_name: 'Provider 22', role: :provider

  company1.products.create name: 'Coca Cola Classic', price: 5.12, code: 'A123-B432'
  company1.products.create name: 'Coca Cola Lite',    price: 3.12, code: 'D123-C432'

  company2.products.create name: 'Adidas',          price: 5.12,   code: 'A123-B4322'
  company2.products.create name: 'Adidas Original', price: 300.12, code: 'D123-C4322'

  Company.all.each do |company|
    Product.all.each do |product|
      Shop.all.each do |shop|
        shop.users.each do |customer|
          booking_attributes = {
            name:       "booking #{product.name} #{Time.now}",
            product_id: product.id,
            company_id: company.id,
            quantity:   rand(100),
            user_id:    customer.id,
            shop_id:    shop.id
          }
          Booking.create booking_attributes
        end
      end
    end
  end

end
