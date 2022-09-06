class SampleTest < ApplicationRecord
  belongs_to :sample
  validates :code, presence: true
  validates :status, presence: true

  enum status: [:admited, :processed, :released]
end
