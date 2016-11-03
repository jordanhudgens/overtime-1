
@user = User.create!(first_name: "User", last_name: "Example", email: "user@example.com",  password: "passpass", password_confirmation: "passpass")
AdminUser.create!(first_name: "Admin", last_name: "User", email: "admin@example.com",  password: "passpass", password_confirmation: "passpass")

puts "*******************************"

puts "User and AdminUser were created"

100.times do |post|
  post = Post.create!(date: Date.today, rationale: "#{post} This is the rationale", user_id: @user.id)
end

puts "*******************************"

puts "100 posts have been created"