class Sample < ApplicationRecord
  validates :description,:codebar,:colected_at, presence:true
  validates :codebar, uniqueness: true

  has_many :sample_test
  accepts_nested_attributes_for :sample_test, allow_destroy: true
end
