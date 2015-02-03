require 'spec_helper'

describe Player do
  it { should have_and_belong_to_many :teams}
  it { should validate_presence_of :player_name}
end
