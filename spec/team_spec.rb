require 'spec_helper'

describe Team do
  it { should have_and_belong_to_many :players }
  it { should validate_presence_of :team_name}
end
