require 'commonmarker'

module HighMarker
  module Abstract
    def render_doc(text, cmark_options = :default, **highmark_options)
      cmark = highmark_options[:cmark_class] || ::CommonMarker

      ast = cmark.render_doc(text, cmark_options)
      process_ast(ast, highmark_options)
      ast
    end

    def render_html(text, cmark_options = :default)
      render_doc(text, cmark_options).to_html
    end

    private

      def process_ast(_ast, _highmark_options)
        raise 'Abstract module does not have any processing engines'
      end
  end
end
