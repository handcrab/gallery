class Page < ActiveRecord::Base
  validates :title, presence: true
  before_save :downcase_title

  extend FriendlyId   # def to_params
  friendly_id :title # , use: :slugged

  private

  def downcase_title
    self.title = title.downcase
  end
end
