
@user = User.create!(first_name: "User", last_name: "Example", email: "user@example.com",  password: "foobar", password_confirmation: "foobar")
puts "*******************************"

puts "One user was created"

100.times do |post|
  post = Post.create!(date: Date.today, rationale: "#{post} This is the rationale", user_id: @user.id)
end

puts "*******************************"

puts "100 posts have been created"