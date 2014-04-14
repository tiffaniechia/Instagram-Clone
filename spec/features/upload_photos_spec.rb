require 'spec_helper'

describe 'uploading photos' do

  context 'logged in' do

    before(:each) do 
      login_as_test_user
    end 
  
    it 'displays the image on the posts page' do
      visit '/posts/new'
      fill_in 'Description', with: 'kitteh'
      attach_file 'Picture', Rails.root.join('spec/images/kitteh.jpg')
      save_and_open_page
      click_button 'Create Post'
      expect(page).to have_css('img.uploaded-pic')
    end


    it 'should show an error if no picture is attached' do 
      visit '/posts/new'
      fill_in 'Description', with: 'kitteh'
      click_button 'Create Post'
      expect(page).to have_content('error')
    end
      
  end
  
  context 'logged out' do
    it 'redirects to the log in page' do
      visit '/posts'
      click_link 'Add Post'
      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('sign in')
    end
  end  
end

