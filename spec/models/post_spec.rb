require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    before do 
      @user = User.create(first_name: "User", last_name: "Example", email: "user@example.com",  password: "foobar", password_confirmation: "foobar")
      login_as(@user, :scope => :user)
      @post = Post.create(date: Date.today, rationale: "This is it", user_id: @user.id)
    end
    it "can be created" do 
      expect(@post).to be_valid
    end

    it "cannot be created without a date and rationale" do 
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
