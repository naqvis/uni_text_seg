# Unicode Text Segmentation

Shard `TextSegment` implements Unicode Text Segmentation according to [Unicode Standard Annex #29](http://unicode.org/reports/tr29/) (Unicode version 13.0.0)
to determine the grapheme cluster boundaries of unicode text.

In Crystal, `String` class provides a `codepoints` method to return Unicode code points. However, multiple code points may be combined into one user-perceived character or what the Unicode specification calls **grapheme cluster**. Here are some examples:

|String|Bytes (UTF-8)|Code points |Grapheme clusters|
|-|-|-|-|
|Käse|6 bytes: `4b 61 cc 88 73 65`|5 code points: `4b 61 308 73 65`|4 clusters: `[4b],[61 308],[73],[65]`|
|🧙‍♂️💈|17 bytes: `f0 9f a7 99 e2 80 8d e2 99 82 ef b8 8f f0 9f 92 88`|5 code points: `1f9d9 200d 2642 fe0f 1f488`|2 cluster: `[1f9d9 200d 2642 fe0f],[1f488]`|
|🇵🇰|8 bytes: `f0 9f 87 b5 f0 9f 87 b0`|2 code points: `1f1f5 1f1f0`|1 cluster: `[1f1f5 1f1f0]`|

This shard provides a tool to iterate over these grapheme clusters. This may be used to determine the number of user-perceived characters, to split strings in their intended places, or to extract individual characters which form a unit.


## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     textseg:
       github: naqvis/uni_text_seg
   ```

2. Run `shards install`

## Usage

```crystal
require "textseg"

TextSegment.each_grapheme("🔮👍🏼!") do |cluster|
  pp cluster.codepoints
  pp cluster.positions
  pp cluster.str
  pp cluster.bytes
end
```

## Development

To run all tests:

```
crystal spec
```

## Contributing

1. Fork it (<https://github.com/naqvis/uni_text_seg/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ali Naqvi](https://github.com/naqvis) - creator and maintainer
