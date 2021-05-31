class Theme < ApplicationRecord
  has_many :images
  scope :find_theme_id, -> (name) {
    select('id').where(name: name).first.id
  }
end
