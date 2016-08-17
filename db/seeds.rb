require 'random_data'
require 'faker'

5.times do
 User.create!(
  email:    Faker::Internet.free_email,
  password: RandomData.random_sentence
 )
end
users = User.all

10.times do
  RegisteredApplication.create!(
  name: Faker::Lorem.sentence(10),
  url: Faker::Internet.url,
  user: users.sample,
  created_at: Faker::Date.between(20.days.ago, 4.days.ago),
  updated_at: Faker::Date.between(3.days.ago, Date.today)
 )
end
registered_applications = RegisteredApplication.all

30.times do
  Event.create!(
  name: Faker::Lorem.word,
  registered_application: registered_applications.sample
 )
end
events = Event.all

 # Create an admin user
admin = User.create!(
 email:    'test.blocmetric@gmail.com',
 password: 'password',
 # role:     'admin'
)
 
# Create a member
member = User.create!(
 email:    'member@gmail.com',
 password: 'helloworld'
)
 
puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
