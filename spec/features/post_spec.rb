require 'rails_helper'

describe 'navigate' do 
  
  before  do 
    # this will work after adding Warden helpers to rails_helper.rb
    user = @user = User.create(email: "user@example.com",  password: "foobar", password_confirmation: "foobar", first_name: "User", last_name: "Example")
    login_as(user, :scop => :user)
  end
 
  describe 'index' do
  before  do
    visit posts_path
  end 
    it 'it can be reached successfully' do 
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do 
      post1 = Post.create(date: Date.today, rationale: "Post1")
      post2 = Post.create(date: Date.today, rationale: "Post2")
      visit posts_path  
      expect(page).to have_content(/Post1|Post2/)
    end
  end

  describe 'creation' do
    before do 
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)       
    end

    it 'can be created from new form page' do

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "This is the rationale"
      click_on 'Save'

      expect(page).to have_content("This is the rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
