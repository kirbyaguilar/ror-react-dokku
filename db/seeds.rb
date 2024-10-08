# Traditionally, rails recommends that you use the seeds.rb file to create records that are necessary for the
# application. Instead, we use the seeding file to enable rapid testing via populating a test database with sample
# data. When creating a model, make sure to add seeding here for it.
#
# To populate the database, run the command below. Note that this
# truncates the database first before seeding
#
# $ bin/rails db:seed:replant --trace

require "faker"

10.times do
  Employee.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end
