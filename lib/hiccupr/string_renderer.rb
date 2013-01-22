module Hiccupr
  class StringRenderer
    def matches?(data)
      data.is_a?(String)
    end

    def render(data, _ = nil)
      data
    end
  end
end
