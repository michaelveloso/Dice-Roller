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

##

DICE_VALUES = [4, 6, 8, 10, 12, 20]

def die_html_base
<<-DIEBLOCK
<div class="row">
  <form action="/roll" method="GET" class="die-form">
    <input type="hidden" name="min" value="1">
    <input type="hidden" name="max" value="(DIE_VALUE)">
    <input type="number" name="num_dice" class="input-field num-dice-field"> d(DIE_VALUE) +/-
    <input type="number" name="mod_indiv" class="input-field mod-indiv-field">
    <select name="cull_type" class="input-field cull-type-field">
      <option value="none">No Cull</option>
      <option value="highest">Highest</option>
      <option value="lowest">Lowest</option>
    </select>
    <input type="number" name="cull_num" class="input-field num-culled-field">
    <input type="Submit" class="button round tiny" value="Roll d(DIE_VALUE)">
    <br>
    Total + <input type="number" name="mod-total" class="input-field mod-total-field">
    = <input type="number" class="output-field total-output">,
    Rolls = <input type="text" class="output-field rolls-output">
  </form>
</div>
DIEBLOCK
end

def generate_dice_html
  dice_html = ""
  DICE_VALUES.each do |num|
    dice_html << generate_die_html(num)
  end
  dice_html
end

def generate_die_html(number)
  die_html = die_html_base
  die_html.gsub!('(DIE_VALUE)', number.to_s)
end


def cull_check(die_hash)
  if die_hash[:cull_type] != "none"
    die_hash[:cull_num].to_i
  else
    0
  end
end
