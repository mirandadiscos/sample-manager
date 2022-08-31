require 'rails_helper'

RSpec.describe Sample, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:codebar) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:colected_at) }
  end

  it "shouldnt save without codebar" do
    sample = build(:sample,codebar: "")
    sample.save

    expect(sample.errors.messages.include?(:codebar)).to eq(true)
  end

  it "shouldn save withou description" do
    sample = build(:sample, description: "")
    sample.save
    
    expect(sample.errors.messages.include?(:description)).to eq(true)
  end

  it "should save without colected_at"do
    sample = build(:sample, colected_at: "")
    sample.save

    expect(sample.errors.messages.include?(:colected_at)).to eq(true)
  end

  it "should subscribe attr" do
    sample = create(:sample, codebar: "12312312310")
    expect(sample.codebar).to eq("12312312310")
  end

  it "should not permit duplicated codebar" do
    s1 = create(:sample)
    s2 = build(:sample, codebar: s1.codebar )
    s2.save

    expect(s2.valid?).to eq(false)
    expect(s2.errors.messages[:codebar]).to eq(["has already been taken"])
  end
end
