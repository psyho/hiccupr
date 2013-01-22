module Hiccupr
  class TagExtractor
    takes :attribute_extractors

    def extract(data)
      data = data.dup
      tag_name = data.shift
      attributes = data.first.is_a?(Hash) ? data.shift : {}

      tag_name, attributes = extract_attrs(tag_name, attributes)
      tag_name = 'span' if tag_name == ''

      [tag_name, attributes, data]
    end

    private

    def chars
      attribute_extractors.map(&:character)
    end

    def extract_attrs(tag_name, attrs)
      attribute_extractors.each do |extractor|
        tag_name, attrs = extractor.extract(tag_name, attrs, chars)
      end
      [tag_name, attrs]
    end
  end
end
