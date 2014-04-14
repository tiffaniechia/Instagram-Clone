require 'spec_helper'

describe Post do
  context 'validations' do
    specify 'title is required' do
      post = Post.new
      expect(post).to have(1).errors_on(:description)
    end
  end
end