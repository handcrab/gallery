class Album < ActiveRecord::Base
  has_and_belongs_to_many :images
  accepts_nested_attributes_for :images,
                                allow_destroy: true,
                                reject_if: :all_blank
  # reject_if: lambda {|attributes| attributes['picture'].blank?}
end
