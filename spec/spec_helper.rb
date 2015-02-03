ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default, :test

Dir[File.dirname(__FILE__) + './../lib/*.rb'].each { |file| require file }

RSPec.configure do |config|
  config.after :each do
    Team.all.each do |team|
      team.destroy
    end
    Player.all.each do |player|
      player.destroy
    end
  end
end
