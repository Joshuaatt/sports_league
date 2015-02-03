class Team < ActiveRecord::Base
  has_and_belongs_to_many :players
  validates :team_name, :presence => true
  before_save :capitalize_name

private

  def capitalize_name
    self.team_name = team_name.capitalize
  end
end
