require 'spec_helper'

describe Group do

  let(:user) { FactoryGirl.create(:user) }
  before {
    @group = user.groups.build(
                              name:    "Test Group",
                              limit:   "$5",
                              year:    "2013"
                              )
  }

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:limit) }
  it { should respond_to(:year) }
  it { should respond_to(:matched) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  describe "when user_id is not present" do
    before { @group.user_id = nil }
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @group.name = nil }
    it { should_not be_valid }
  end
end
