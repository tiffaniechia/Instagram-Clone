require 'spec_helper'

describe 'uploading photos' do
  it 'displays the image on the posts page' do
    visit '/posts/new'
    fill_in 'Description', with: 'kitteh'
    attach_file 'Picture', Rails.root.join('spec/images/kitteh.jpg')
    click_button 'Create Post'
    expect(page).to have_css('img.uploaded-pic')
  end
end