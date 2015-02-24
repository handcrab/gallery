class Page < ActiveRecord::Base  
  validates :title, presence: true

  # def to_params
  extend FriendlyId
  friendly_id :title #, use: :slugged
end
