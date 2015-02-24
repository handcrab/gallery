class Image < ActiveRecord::Base
  has_and_belongs_to_many :albums#, join_table: :albums_images

  has_attached_file :picture, styles: { large: "600x600>", medium: '300x300', thumb: "100x100>" } #, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :picture, presence: true
end
