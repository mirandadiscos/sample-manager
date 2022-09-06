require 'rails_helper'

RSpec.describe Sample, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:codebar) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:colected_at) }
    it { should have_many(:sample_test) }
  end

  context 'business logic' do
    let(:sample) { build(:sample_default) }
    let(:sample_nocodebar) { build(:sample_without_codebar) }
    let(:sample_noname) { build(:sample_without_name) }
    let(:sample_nocolected) { build(:sample_without_colected) }

    it "shouldnt save without codebar" do
      sample_nocodebar.save
      expect(sample.errors.messages.include?(:codebar)).to eq(false)
    end

    it "shouldn save withou description" do
      sample_noname.save
      expect(sample_noname.errors.messages.include?(:description)).to eq(true)
    end

    it "should save without colected_at"do
      sample_nocolected.save
      expect(sample_nocolected.errors.messages.include?(:colected_at)).to eq(true)
    end

    it "should not permit duplicated codebar" do
      sample.save
      sample_nocodebar.codebar = sample.codebar
      sample_nocodebar.save

      expect(sample_nocodebar.valid?).to eq(false)
      expect(sample_nocodebar.errors.messages[:codebar]).to eq(["has already been taken"])
    end
  end
end
