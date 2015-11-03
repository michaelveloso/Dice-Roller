require 'sinatra'
require 'json'
require 'pry'
require_relative 'dieroller.rb'

get '/' do
  erb :roller
end

get '/d4' do
  content_type :json
  die_hash = params[:d4]
  d4_roller = DieRoller.new(die_hash)
  results = d4_roller.roll(params[:num_dice].to_i)
  results.to_json
end
