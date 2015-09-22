require 'spec_helper'

describe DieRoller do

  let(:d6_roller) do
    dice_hash = {
      max: 6
    }
    DieRoller.new(dice_hash)
  end

  let(:d8plus1_roller) do
    dice_hash = {
      max: 8,
      mod_indiv: 1
    }
    DieRoller.new(dice_hash)
  end

  let(:d4minus1_roller) do
    dice_hash = {
      max: 4,
      mod_indiv: -1
    }
    DieRoller.new(dice_hash)
  end

  let(:d10plus2ceiling11_roller) do
    dice_hash = {
      max: 10,
      mod_indiv: 2,
      ceiling: 11
    }
    DieRoller.new(dice_hash)
  end

  let(:d12minus4floor2_roller) do
    dice_hash = {
      max: 12,
      mod_indiv: -4,
      floor: 2
    }
    DieRoller.new(dice_hash)
  end

  let(:d20_roller_plus2) do
    dice_hash = {
      max: 20,
      mod_total: 2
    }
    DieRoller.new(dice_hash)
  end

  describe "#initialize" do

    it "should create a die roller object" do
      expect(d6_roller).to be_a(DieRoller)
    end

  end

  describe "#roll" do

    context "given a normal d6" do

      it "should return all possible outcomes" do
        d6_rolls = []
        10000.times do
          d6_rolls << d6_roller.roll(1)[:total]
        end
        expect(d6_rolls.uniq.sort).to eq((1..6).to_a)

        d6_rolls = []
        10000.times do
          d6_rolls << d6_roller.roll(2)[:total]
        end
        expect(d6_rolls.uniq.sort).to eq((2..12).to_a)

        d6_rolls = []
        10000.times do
          d6_rolls << d6_roller.roll(3)[:total]
        end
        expect(d6_rolls.uniq.sort).to eq((3..18).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d6_roller.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)

        roll_hash = d6_roller.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)
      end

    end

    context "given a d8+1" do

      it "should return all possible outcomes" do
        d8plus1_rolls = []
        10000.times do
          d8plus1_rolls << d8plus1_roller.roll(1)[:total]
        end
        expect(d8plus1_rolls.uniq.sort).to eq((2..9).to_a)

        d8plus1_rolls = []
        10000.times do
          d8plus1_rolls << d8plus1_roller.roll(2)[:total]
        end
        expect(d8plus1_rolls.uniq.sort).to eq((4..18).to_a)

        d8plus1_rolls = []
        10000.times do
          d8plus1_rolls << d8plus1_roller.roll(3)[:total]
        end
        expect(d8plus1_rolls.uniq.sort).to eq((6..27).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d8plus1_roller.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)

        roll_hash = d8plus1_roller.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)
      end
    end

    context "given a d4-1" do

      it "should return all possible outcomes" do
        d4minus1_rolls = []
        10000.times do
          d4minus1_rolls << d4minus1_roller.roll(1)[:total]
        end
        expect(d4minus1_rolls.uniq.sort).to eq((0..3).to_a)

        d4minus1_rolls = []
        10000.times do
          d4minus1_rolls << d4minus1_roller.roll(2)[:total]
        end
        expect(d4minus1_rolls.uniq.sort).to eq((0..6).to_a)

        d4minus1_rolls = []
        10000.times do
          d4minus1_rolls << d4minus1_roller.roll(3)[:total]
        end
        expect(d4minus1_rolls.uniq.sort).to eq((0..9).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d4minus1_roller.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)

        roll_hash = d4minus1_roller.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)
      end
    end

    context "given a d10+2 ceiling 11" do

      it "should return all possible outcomes" do
        d10plus2ceiling11_rolls = []
        10000.times do
          d10plus2ceiling11_rolls << d10plus2ceiling11_roller.roll(1)[:total]
        end
        expect(d10plus2ceiling11_rolls.uniq.sort).to eq((3..11).to_a)

        d10plus2ceiling11_rolls = []
        10000.times do
          d10plus2ceiling11_rolls << d10plus2ceiling11_roller.roll(2)[:total]
        end
        expect(d10plus2ceiling11_rolls.uniq.sort).to eq((6..22).to_a)

        d10plus2ceiling11_rolls = []
        10000.times do
          d10plus2ceiling11_rolls << d10plus2ceiling11_roller.roll(3)[:total]
        end
        expect(d10plus2ceiling11_rolls.uniq.sort).to eq((9..33).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d10plus2ceiling11_roller.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)

        roll_hash = d10plus2ceiling11_roller.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)
      end
    end

    context "given a d12-4 floor 2" do

      it "should return all possible outcomes" do
        d12minus4floor2_rolls = []
        10000.times do
          d12minus4floor2_rolls << d12minus4floor2_roller.roll(1)[:total]
        end
        expect(d12minus4floor2_rolls.uniq.sort).to eq((2..8).to_a)

        d12minus4floor2_rolls = []
        10000.times do
          d12minus4floor2_rolls << d12minus4floor2_roller.roll(2)[:total]
        end
        expect(d12minus4floor2_rolls.uniq.sort).to eq((4..16).to_a)

        d12minus4floor2_rolls = []
        10000.times do
          d12minus4floor2_rolls << d12minus4floor2_roller.roll(3)[:total]
        end
        expect(d12minus4floor2_rolls.uniq.sort).to eq((6..24).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d12minus4floor2_roller.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)

        roll_hash = d12minus4floor2_roller.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject {|sum, x| sum + x}).to eq(total)
      end
    end

    context "given a d20 roller plus 2" do

      it "should return all possible outcomes" do
        d20_roller_plus2_rolls = []
        10000.times do
          d20_roller_plus2_rolls << d20_roller_plus2.roll(1)[:total]
        end
        expect(d20_roller_plus2_rolls.uniq.sort).to eq((3..22).to_a)

        d20_roller_plus2_rolls = []
        10000.times do
          d20_roller_plus2_rolls << d20_roller_plus2.roll(2)[:total]
        end
        expect(d20_roller_plus2_rolls.uniq.sort).to eq((4..42).to_a)

        d20_roller_plus2_rolls = []
        100000.times do
          d20_roller_plus2_rolls << d20_roller_plus2.roll(3)[:total]
        end
        expect(d20_roller_plus2_rolls.uniq.sort).to eq((5..62).to_a)
      end

      it "should return array of individual rolls" do
        roll_hash = d20_roller_plus2.roll(3)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.inject(2) {|sum, x| sum + x}).to eq(total)

        roll_hash = d20_roller_plus2.roll(15)
        rolls = roll_hash[:rolls]
        total = roll_hash[:total]
        expect(rolls).to be_a(Array)
        expect(rolls.length).to eq(15)
        expect(rolls.inject(2) {|sum, x| sum + x}).to eq(total)
      end
    end
  end

  describe "#roll_get_highest" do

    context "given a normal d6" do
      it "should return the x highest rolls of y rolls" do
        result = d6_roller.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d8+1" do
      it "should return the x highest rolls of y rolls" do
        result = d8plus1_roller.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d4-1" do
      it "should return the x highest rolls of y rolls" do
        result = d4minus1_roller.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d10+2 ceiling 11" do
      it "should return the x highest rolls of y rolls" do
        result = d10plus2ceiling11_roller.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d12-4 floor 2" do
      it "should return the x highest rolls of y rolls" do
        result = d12minus4floor2_roller.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d20 roller plus 2" do
      it "should return the x highest rolls of y rolls" do
        result = d20_roller_plus2.roll_get_highest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[1..-1]

        expect(total).to eq(rolls.inject(2){|sum, x| sum + x})
      end
    end

  end

  describe "#roll_get_lowest" do
    context "given a normal d6" do
      it "should return the x highest rolls of y rolls" do
        result = d6_roller.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d8+1" do
      it "should return the x highest rolls of y rolls" do
        result = d8plus1_roller.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d4-1" do
      it "should return the x highest rolls of y rolls" do
        result = d4minus1_roller.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d10+2 ceiling 11" do
      it "should return the x highest rolls of y rolls" do
        result = d10plus2ceiling11_roller.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d12-4 floor 2" do
      it "should return the x highest rolls of y rolls" do
        result = d12minus4floor2_roller.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject{|sum, x| sum + x})
      end
    end

    context "given a d20 roller plus 2" do
      it "should return the x highest rolls of y rolls" do
        result = d20_roller_plus2.roll_get_lowest(3, 2)
        rolls = result[:rolls]
        total = result[:total]
        rolls = rolls.sort
        rolls = rolls[0..-2]

        expect(total).to eq(rolls.inject(2){|sum, x| sum + x})
      end
    end

  end
end
