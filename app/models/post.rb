class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :user


  has_attached_file :photos, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photos, :content_type => /\Aimage\/.*\Z/

end
