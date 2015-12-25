require 'sinatra'
require 'json'
require_relative 'dieroller.rb'

get '/' do
  erb :roller
end

get '/roll' do
  content_type :json
  die_hash = params[:die]
  die_cull_type = die_hash[:cull_type].to_sym
  die_cull_num = cull_check(die_hash)
  die_roller = DieRoller.new(die_hash)
  results = die_roller.roll(die_hash[:num_dice].to_i, die_cull_type, die_cull_num)
  results.to_json
end

def cull_check(die_hash)
  if die_hash[:cull_type] != "none"
    die_hash[:cull_num].to_i
  else
    0
  end
end
