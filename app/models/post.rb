class Post < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :tags
  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }

  validates :description, presence: true
  validates_attachment_presence :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/



  def tag_name
  end
  
  def tag_name=(tag_name)
    tag_name.split(" ").uniq.each do |tag|
      tag = Tag.find_or_create_by(name: tag) 
      tags << tag
    end
  end  

end