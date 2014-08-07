require 'isni'

describe "The ISNI class" do
  describe "#valid? instance method" do
    it "should identify a valid ISNI" do
      expect(ISNI.new("0000-0002-9534-656X").valid?).to eq true
      expect(ISNI.new("000000029534656X").valid?).to eq true
    end
  end

  describe "#valid? class method" do
    it "should identify a valid ISNI" do
      expect(ISNI.valid?("0000-0002-9534-656X")).to eq true
      expect(ISNI.valid?("000000029534656X")).to eq true
    end

    it "should identify an invalid ISNI" do
      expect(ISNI.valid?(nil)).to       eq false
      expect(ISNI.valid?("902865")).to  eq false
      expect(ISNI.valid?(Array)).to     eq false
      expect(ISNI.valid?(Array.new)).to eq false
      expect(ISNI.valid?("0000-0002-9534-6569")).to eq false
      expect(ISNI.valid?("0000000295346569")).to    eq false
      expect(ISNI.valid?("000000029534656")).to     eq false
    end
  end

  describe "#complete class method" do
    it "should calculate a ISNI check digit correctly" do
      expect(ISNI.complete("000000029534656")).to eq("000000029534656X")
      expect(ISNI.complete("0000-0002-9534-656")).to eq("000000029534656X")
    end
  end

  describe "#to_s" do
    it "should hyphen a ISNI correctly" do
      expect(ISNI.new("000000029534656X").to_s).to eq("0000-0002-9534-656X")
    end
  end
end
