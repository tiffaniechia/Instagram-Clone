$(document).ready ->
  $('.comment-link').on 'click', (event) ->
    event.preventDefault()

    postUrl = $(this).data('post-url')
    commentArea = $(this).closest('.post').find('.comments')

    $.get postUrl, (post) ->
      post.comments.forEach (comment) ->
        commentArea.append("<li>#{comment.comment}</li>")

      commentArea.slideDown()