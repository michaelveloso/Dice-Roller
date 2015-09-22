require 'pry'

class Die

  attr_accessor :max, :min, :mod, :floor, :ceiling

  def initialize(die_hash)
    @max = die_hash[:max]
    @min = die_hash[:min] || 1
    @mod = die_hash[:mod] || 0
    @floor = die_hash[:floor] || (@min + @mod)
    @ceiling = die_hash[:ceiling] || (@max + @mod)
  end

  def roll
    outcome = rand(@min..@max) + @mod
    if outcome > @ceiling
      @ceiling
    elsif outcome < @floor
      @floor
    else
      outcome
    end
  end

end
