class Post < ApplicationRecord
  has_many :postmetas
  has_one :translation, -> { where(element_type: 'post_post') }, foreign_key: :element_id

  scope :vendors, -> { where(post_type: 'vendor') }
end