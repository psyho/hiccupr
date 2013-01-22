module Hiccupr
  class UnknownRenderer
    def matches?(data)
      true
    end

    def render(*)
      ""
    end
  end
end
