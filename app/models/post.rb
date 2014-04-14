class Post < ActiveRecord::Base

  belongs_to :user

  validates :description, presence: true
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

end
 