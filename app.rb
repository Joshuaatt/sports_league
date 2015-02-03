require 'bundler/setup'
require 'pry'

Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload 'lib/**/*.rb'

get '/' do
  erb :index
end

get '/teams' do
  @teams = Team.all
  erb :new_team
end

post '/teams' do
  @team = Team.new(team_name: params['team_name'])
  @team.save
  redirect '/teams'
end

get '/players' do
  @players = Player.all
  erb :new_player
end

post '/players' do
  @player = Player.new(player_name: params['player_name'])
  @player.save
  redirect '/players'
end

get '/team/:id/edit' do
  @players = Player.all
  @team = Team.find(params['id'])
  erb :edit_team
end

patch '/team/:id/edit' do
  team_id = params['id']
  @team = Team.find(team_id)
  player_ids = params['player_ids']
  @team.update(player_ids: player_ids)
  @players = Player.all
  erb :edit_team
end

delete '/team/:id/edit' do
  team = Team.find(params['id'])
  team.delete
  redirect '/teams'
end

get '/player/:id/edit' do
  @player = Player.find(params['id'])
  erb :edit_player
end

delete '/player/:id/edit' do
  player = Player.find(params['id'])
  player.delete
  redirect '/players'
end
