class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :bookmarks, :dependent => :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo
  accepts_nested_attributes_for :bookmarks, allow_destroy: true
end
