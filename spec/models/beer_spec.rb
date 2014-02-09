require 'spec_helper'

describe Beer do
  it "is saved with a name and a style" do
    beer = Beer.create name:"Coors Light", style:"lager"

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  describe "is not saved" do
    it "when beer has no name" do
      beer = Beer.create style:"lager"

      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end

    it "when beer has no style" do
      beer = Beer.create name:"Bud Light"

      expect(beer).not_to be_valid
      expect(Beer.count).to eq(0)
    end
  end
end
