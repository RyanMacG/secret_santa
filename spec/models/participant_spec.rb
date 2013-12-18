require 'spec_helper'

describe Participant do
  before { @participant = Participant.new(name: "Example Participant", email: "user@example.com") }

  subject { @participant }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:group) }
  it { should respond_to(:partner) }
end
