require 'rails_helper'

RSpec.describe SampleTest, type: :model do
  context 'associations' do
    it { should belong_to(:sample) }
  end

  context 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:status) }
    it do
      should define_enum_for(:status).
        with_values([:admited, :processed, :released])
    end
  end
end
