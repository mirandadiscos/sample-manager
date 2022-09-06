class Sample < ApplicationRecord
  validates :description,:codebar,:colected_at, presence:true
  validates :codebar, uniqueness: true

  has_many :sample_test
end
