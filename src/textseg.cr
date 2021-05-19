# Shard `TextSegment` implements Unicode Text Segmentation according to [Unicode Standard Annex #29](http://unicode.org/reports/tr29/) (Unicode version 12.0.0)
# to determine the grapheme cluster boundaries of unicode text.
module TextSegment
  VERSION = "0.1.2"

  # returns an array of all Unicode extended grapheme clusters, specified in the Unicode Standard Annex #29. Grapheme clusters correspond to
  # "user-perceived characters". These characters often consist of multiple code points (e.g. the "woman kissing woman" emoji consists of 8 code points:
  # woman + ZWJ + heavy black heart (2 code points) + ZWJ + kiss mark + ZWJ + woman) and the rules described in Annex #29 must be applied to group those
  # code points into clusters perceived by the user as one character.
  # ```
  # TextSegment.graphemes("🧙‍♂️💈") # => [TextSegment::Grapheme::Cluster(@codepoints=[129497, 8205, 9794, 65039], @positions={0, 13}), TextSegment::Grapheme::Cluster(@codepoints=[128136], @positions={13, 17})]
  # ```
  def self.graphemes(str : String) : Array(Grapheme::Cluster)
    Grapheme::Graphemes.new(str).to_a
  end

  # Yields each Unicode extended grapheme cluster in the string to the block.
  #
  # ```
  # TextSegment.each_grapheme("🧙‍♂️💈") do |cluster|
  #   p! cluster.codepoints
  #   p! cluster.to_s
  # end
  # ```
  def self.each_grapheme(str : String, & : Grapheme::Cluster -> Nil) : Nil
    Grapheme::Graphemes.new(str).each do |cluster|
      yield cluster
    end
  end

  # returns graphemes cluster iterator over Unicode extended grapheme clusters.
  # ```
  # TextSegment.each_grapheme("🔮👍🏼!").each do |cluster|
  #   pp cluster.codepoints
  #   pp cluster.positions
  #   pp cluster.str
  #   pp cluster.bytes
  # end
  # ```
  def self.each_grapheme(str : String) : Grapheme::Graphemes
    Grapheme::Graphemes.new(str)
  end
end

require "./grapheme/*"
