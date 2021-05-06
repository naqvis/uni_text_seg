# Shard `TextSegment` implements Unicode Text Segmentation according to [Unicode Standard Annex #29](http://unicode.org/reports/tr29/) (Unicode version 12.0.0)
# to determine the grapheme cluster boundaries of unicode text.
module TextSegment
  VERSION = "0.1.0"

  # Returns a grapheme cluster iterator
  def self.graphemes(str : String)
    Grapheme::Graphemes.new(str)
  end
end

require "./grapheme/*"
