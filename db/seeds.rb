100.times do |post|
  post = Post.create!(date: Date.today, rationale: "#{post} This is the rationale")
end

puts "100 posts have been created"