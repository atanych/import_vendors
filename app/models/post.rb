class Post < ApplicationRecord
  has_many :postmetas
  has_one :translation, -> { where(element_type: 'post_post') }, foreign_key: :element_id

  scope :vendors, -> { where(post_type: 'vendor') }

  before_save :fill_name
  after_create :fill_guid

  def fill_name
    self.post_name = post_title.parameterize
  end

  def fill_guid
    self.guid = "http://intranet.inekogroup.com/?post_type=vendor&#038;p=#{id}"
  end
end