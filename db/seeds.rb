require 'faker'

# Create test admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld'
)
admin.skip_confirmation!
admin.save!

# Create test member user
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save


# Create users
3.times do
  user = User.new(
  name:     Faker::Name.name,
  email:    Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end

users = User.all

# Create List
users.each do |user|
  1.times do 
    List.create!(
    user: user,
    title: Faker::Lorem.sentence(3)
  )
  end
end

lists = List.all

# Create Items
lists.each do |list|
  10.times do
    Item.create!(
    list: list,
    name: Faker::Company.bs
  )
  end
end

items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"