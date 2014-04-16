require 'spec_helper' 


describe 'post index page' do 

  before(:each) do 
    login_as_test_user
  end 

  context 'no post' do 
    it 'shows a message' do 
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end  

  describe 'adding posts' do
    context 'valid post' do
      it 'is added to the post page' do
        visit '/posts/new'
        fill_in 'Description', with: 'My holiday pic'
        attach_file 'Picture', Rails.root.join('spec/images/kitteh.jpg')
        click_button 'Create Post'
        expect(current_path).to eq('/posts')
        expect(page).to have_content('My holiday pic')
      end
    end

    context 'invalid post' do
      it 'shows an error' do
        visit '/posts/new'
        click_button 'Create Post'
        expect(page).to have_content('error')
      end
    end
  end

  context 'with posts' do

    it 'displays the post' do
      visit '/posts/new'
      fill_in 'Description', with: 'some awesome snap'
      attach_file 'Picture', Rails.root.join('spec/images/kitteh.jpg')
      click_button 'Create Post'
      visit '/posts'
      expect(page).to have_content('some awesome snap')
    end
  end

  context 'tags' do 

    before {Post.create(description: 'kitteh', picture: Rails.root.join('spec/images/kitteh.jpg').open, tag_name: '#meow')}
  
    it 'should display tags with post' do 
      visit '/posts'
      expect(page).to have_content('#meow')
    end  

    it "should display all posts with the same tag" do 
      visit '/posts'
      click_link '#meow'
      expect(current_path).to eq('/tags/meow')
      expect(page).to have_content('kitteh')
    end

  end  


    context 'comment' do 

    before {Post.create(description: 'kitteh', picture: Rails.root.join('spec/images/kitteh.jpg').open, tag_name: '#meow')}
  
    it 'should start with 0 comments' do 
      visit '/posts'
      expect(page).to have_content('0 comments')
    end  

    it 'should show 1 comment after adding comment' do 
      visit '/posts'
      click_link 'Add Comment'
      # expect(current_path).to eq("/posts/#{Post.last.id}/comments/new")
      expect(current_path).to eq new_post_comment_path(Post.last)
      fill_in 'Comment', with: 'catcoffee'
      click_button 'Create Comment'
      expect(current_path).to eq('/posts')
      expect(page).to have_content('1 comment')
    end  

    it 'should display all comments from a post' do 
      visit '/posts'
      click_link 'Add Comment'
      fill_in 'Comment', with: 'catcoffee'
      click_button 'Create Comment'
      click_link '1 comment'
      expect(current_path).to eq post_comments_path(Post.last)
      expect(page).to have_content('catcoffee')
    end  


  end  





  describe 'deleting posts' do

    it 'remove post from index page after deletion' do
      visit '/posts/new'
      fill_in 'Description', with: 'My holiday pic'
      attach_file 'Picture', Rails.root.join('spec/images/kitteh.jpg')
      click_button 'Create Post'      
      click_link 'Delete Post'
      expect(page).not_to have_content('kitteh')
    end
  end
end



