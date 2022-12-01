class ISNI

  def initialize(str)
    @number = str.to_s.gsub(/[^\dxX]/, "")
  end

  def valid?
    ISNI.valid? @number
  end

  # output a hyphenated version of this ISNI
  def to_s
    if valid?
      [
        @number[0,4],
        @number[4,4],
        @number[8,4],
        @number[12,4],
      ].join("-")
    end
  end

  def self.valid?(isni)
    isni = isni.to_s.gsub(/[^\dxX]/, "")
    isni.length == 16 && isni == ISNI.complete(isni[0,15])
  end

  # Purely for generating new ISNI numbers
  #
  def self.complete(num)
    num = num.to_s.gsub(/[^\dxX]/, "")
    return nil unless num.length == 15 && num.match(/\A\d+\Z/)

    sum = num.chars.map(&:to_i).inject(0) do |accum,i|
      if accum == 0
        accum = i * 2
      else
        accum = (accum + i) * 2
      end
    end
    remainder = (12 - (sum % 11)) % 11
    if remainder == 10
      check = "X"
    else
      check = remainder
    end

    "#{num}#{check}"
  end
end
