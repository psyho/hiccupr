module Hiccupr
  class AttributeExtractor
    takes :character, :attribute_name

    def extract(tag_name, attributes, all_chars)
      tag_name = tag_name.to_s

      pattern = pattern(all_chars)
      parts = tag_name.scan(pattern)

      if parts.any?
        attributes = attributes.merge(attribute_name => parts.join(' ').gsub(/#{character}/, ''))
      end

      tag_name = tag_name.gsub(pattern, '')

      [tag_name, attributes]
    end

    def character
      Regexp.escape(@character)
    end

    private

    def pattern(all_chars)
      /#{character}[^#{all_chars.join("")}]+/
    end
  end
end
