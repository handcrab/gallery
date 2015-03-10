class Image < ActiveRecord::Base
  has_and_belongs_to_many :albums

  has_attached_file :picture, styles: {
    large: '900x900>',
    medium: '300x300',
    thumb: '100x100#' }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :picture, presence: true
end
