require_relative 'die'

class DieRoller

  attr_reader :die, :mod_total

  def initialize (dice_hash)
    @max = dice_hash[:max].to_i
    @min = dice_hash[:min].to_i
    @mod_indiv = dice_hash[:mod_indiv].to_i || 0
    @mod_total = dice_hash[:mod_total].to_i || 0
    @floor = dice_hash[:floor].to_i || @min + @mod_indiv
    @ceiling = dice_hash[:ceiling].to_i || @max + @mod_indiv
    @die_hash = {max: @max,
                 min: @min,
                 mod: @mod_indiv,
                 floor: @floor,
                ceiling: @ceiling}
    @die = Die.new(@die_hash)
  end

  def roll(num_dice = 1)
    rolls = get_rolls(num_dice)
    total = get_total(rolls)
    {total: total, rolls: rolls}
  end

  def roll_get_highest(num_dice, num_highest)
    rolls = get_rolls(num_dice)
    rolls_culled = rolls.sort.reverse[0...num_highest]
    total = get_total(rolls_culled)
    {total: total, rolls: rolls}
  end

  def roll_get_lowest(num_dice, num_lowest)
    rolls = get_rolls(num_dice)
    rolls_culled = rolls.sort[0...num_lowest]
    total = get_total(rolls_culled)
    {total: total, rolls: rolls}
  end

  private

  def get_rolls(num_dice)
    rolls = []
    num_dice.times do
      rolls << @die.roll
    end
    rolls
  end

  def get_total(rolls)
    rolls.inject(@mod_total) {|sum, roll| sum + roll}
  end

end
