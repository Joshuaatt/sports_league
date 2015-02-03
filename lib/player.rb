class Player < ActiveRecord::Base
  has_and_belongs_to_many :teams
  validates :player_name, :presence => true
  before_save :capitalize_name

private

  def capitalize_name
    self.player_name = player_name.capitalize
  end
end
