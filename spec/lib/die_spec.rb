require 'spec_helper'

describe Die do

  let(:d6) do
    die_hash = {max: 6}
    Die.new(die_hash)
  end

  let (:d12) do
    die_hash = {max: 12}
    Die.new(die_hash)
  end

  let(:d8plus1) do
    die_hash = {
      max: 8,
      min: 1,
      mod: 1
    }
    Die.new(die_hash)
  end

  let(:d4minus1) do
    die_hash = {
      max: 4,
      min: 1,
      mod: -1
    }
    Die.new(die_hash)
  end

  let(:d5to17) do
    die_hash = {
      max: 17,
      min: 5
    }
    Die.new(die_hash)
  end

  let(:d8minus4floor1) do
    die_hash = {
      max: 8,
      mod: -4,
      floor: 1
    }
    Die.new(die_hash)
  end

  let(:d20plus4ceiling22) do
    die_hash = {
      max: 20,
      mod: 4,
      ceiling: 22
    }
    Die.new(die_hash)
  end

  describe "#initialization" do

    it "creates a Die object" do
      expect(d6).to be_a(Die)
      expect(d8plus1).to be_a(Die)
    end

  end

  describe "#roll" do

    it "handles simple dice correctly" do
      d6_rolls = []
      10000.times do
        d6_rolls << d6.roll
      end
      expect(d6_rolls.uniq.sort).to eq((1..6).to_a)

      d12_rolls = []
      10000.times do
        d12_rolls << d12.roll
      end
      expect(d12_rolls.uniq.sort).to eq((1..12).to_a)
    end

    it "handles mods correctly" do
      d8plus1_rolls = []
      10000.times do
        d8plus1_rolls << d8plus1.roll
      end
      expect(d8plus1_rolls.uniq.sort).to eq((2..9).to_a)

      d4minus1_rolls = []
      10000.times do
        d4minus1_rolls << d4minus1.roll
      end
      expect(d4minus1_rolls.uniq.sort).to eq((0..3).to_a)
    end

    it "handles mins correctly" do
      d5to17_rolls = []
      10000.times do
        d5to17_rolls << d5to17.roll
      end
      expect(d5to17_rolls.uniq.sort).to eq((5..17).to_a)
    end

    it "handles floors correctly" do
      d8minus4floor1_rolls = []
      10000.times do
        d8minus4floor1_rolls << d8minus4floor1.roll
      end
      expect(d8minus4floor1_rolls.uniq.sort).to eq((1..4).to_a)
    end

    it "handles ceilings correctly" do
      d20plus4ceiling22_rolls = []
      10000.times do
        d20plus4ceiling22_rolls << d20plus4ceiling22.roll
      end
      expect(d20plus4ceiling22_rolls.uniq.sort).to eq((5..22).to_a)
    end

  end


end
