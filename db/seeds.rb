10.times do |users|
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '1122334455', password_confirmation: '1122334455')
end

100.times do |post|
    Post.create(date: Faker::Date.backward(60), rationale: "#{post} rationale content")
end

puts "100 posts have been created"