json.description @post.description
json.created_at @post.created_at
json.updated_at @post.updated_at
json.address @post.address
json.url post_url(@post)
json.comments @post.comments do |comment|
  json.comment comment.comment
end