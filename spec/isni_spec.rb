require 'isni'

describe "The ISNI class" do
  describe "#valid? instance method" do
    it "should identify a valid ISNI" do
      ISNI.new("0000-0002-9534-656X").valid?.should eq true
      ISNI.new("000000029534656X").valid?.should eq true
    end
  end

  describe "#valid? class method" do
    it "should identify a valid ISNI" do
      ISNI.valid?("0000-0002-9534-656X").should eq true
      ISNI.valid?("000000029534656X").should eq true
    end

    it "should identify an invalid ISNI" do
      ISNI.valid?(nil).should       eq false
      ISNI.valid?("902865").should  eq false
      ISNI.valid?(Array).should     eq false
      ISNI.valid?(Array.new).should eq false
      ISNI.valid?("0000-0002-9534-6569").should  eq false
      ISNI.valid?("0000000295346569").should   eq false
      ISNI.valid?("000000029534656").should   eq false
    end
  end

  describe "#complete class method" do
    it "should calculate a ISNI check digit correctly" do
      ISNI.complete("000000029534656").should eql("000000029534656X")
      ISNI.complete("0000-0002-9534-656").should eql("000000029534656X")
    end
  end

  describe "#to_s" do
    it "should hyphen a ISNI correctly" do
      ISNI.new("000000029534656X").to_s.should eql("0000-0002-9534-656X")
    end
  end
end
