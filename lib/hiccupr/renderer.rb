module Hiccupr
  class Renderer
    takes :renderers

    def render(data)
      renderer = renderers.find{|r| r.matches?(data) }
      renderer.render(data, self)
    end
  end
end
