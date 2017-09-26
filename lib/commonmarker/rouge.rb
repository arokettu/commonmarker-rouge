require 'commonmarker/rouge/version'

require 'commonmarker'
require 'rouge'
require 'cgi'

module CommonMarker
  module Rouge
    module_function

    def render_doc(text, cmark_options = :DEFAULT, **cmr_options)
      cmark = cmr_options[:cmark_class] || ::CommonMarker

      ast = cmark.render_doc(text, cmark_options)
      process_ast(ast, cmr_options)
      ast
    end

    def render_html(text, cmark_options = :DEFAULT, **cmr_options)
      render_doc(text, cmark_options, **cmr_options).to_html
    end

    def process_ast(ast, cmr_options)
      ast.walk do |node|
        if node.type == :code_block
          next if node.fence_info == ''

          source = node.string_content

          lexer = ::Rouge::Lexer.find_fancy(node.fence_info) || ::Rouge::Lexers::PlainText.new

          formatter_class = cmr_options[:formatter_class]
          formatter       = cmr_options[:formatter]

          # support format accepting class for a time being
          if formatter.is_a? Class
            formatter_class ||= formatter
            formatter = nil
          end

          formatter_class ||= ::Rouge::Formatters::HTML

          formatter ||= formatter_class.new(cmr_options[:options] || {})

          html = '<div class="highlighter-rouge language-' + CGI.escapeHTML(node.fence_info) + '">' + formatter.format(lexer.lex(source)) + '</div>'

          new_node = ::CommonMarker::Node.new(:html)
          new_node.string_content = html

          node.insert_before(new_node)
          node.delete
        end
      end
    end

    private_class_method :process_ast
  end
end
