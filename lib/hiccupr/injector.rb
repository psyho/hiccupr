module Hiccupr
  class Injector
    include Dependor::AutoInject
    look_in_modules Hiccupr

    def attribute_extractors
      [AttributeExtractor.new(".", :class), AttributeExtractor.new("#", :id)]
    end

    def renderers
      [tag_renderer, string_renderer, unknown_renderer]
    end
  end
end
