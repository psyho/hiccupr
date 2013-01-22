module Hiccupr
  class TagRenderer
    takes :tag_extractor

    def matches?(data)
      data.is_a?(Array)
    end

    def render(data, renderer)
      tag_name, attrs, rest = tag_extractor.extract(data)

      content = rest.reduce("") { |c, d| c << renderer.render(d) }
      "<#{tag_name}#{attributes(attrs)}>#{content}</#{tag_name}>"
    end

    private

    def attributes(attrs)
      attrs.reduce("") { |s, (k, v)| s << %Q[ #{k}="#{v}"]}
    end
  end
end
