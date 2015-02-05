require 'faker'

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Create List
1.times do
  List.create(
    user: admin,
    title: 'Admin List'
  )
end

# # Create Items
# 15.times do
#   Item.create(
#     list: 'Admin List',
#     name: Faker::Company.bs
#   )
# end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"