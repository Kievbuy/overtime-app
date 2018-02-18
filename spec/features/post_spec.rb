require 'rails_helper'

describe 'navigate' do
  
  before do
    user = User.create(email: "test@test.com", password: "11223344", password_confirmation: "11223344", first_name: "John", last_name: "Snow")
    login_as(user, :scope => :user)
  end
  
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached sucessfully' do
      expect(page.status_code).to eq(200)
    end
    
    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end
    
    it 'has a list of posts' do
      post1 = Post.create(date: Date.today, rationale: 'Post1')
      post2 = Post.create(date: Date.today, rationale: 'Post2')
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
  end
  
  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new for that can be reached' do
      expect(page.status_code).to eq(200)
    end
    
    it 'can be created from newe form page  ' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      
      click_on 'Save'
      
      expect(page).to have_content('Some rationale')
    end
    
    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User_associathion'
      
      click_on 'Save'
      
      expect(User.last.posts.last.rationale).to eq("User_associathion")
    end
    
  end
end