class Album < ActiveRecord::Base
  has_and_belongs_to_many :images
  # has_many :images
end
