class Page < ActiveRecord::Base  
  validates :title, presence: true
  before_save :downcase_title
  # def to_params
  extend FriendlyId
  friendly_id :title #, use: :slugged

  private
  def downcase_title
    self.title = title.downcase
  end
end
