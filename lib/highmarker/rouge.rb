module HighMarker
  module Rouge
    begin
      require 'rouge'

      AVAILABLE = true
    rescue LoadError, SyntaxError
      AVAILABLE = false
    end

    extend ::HighMarker::Abstract

    def self.process_ast(ast, highmark_options)
      ast.walk do |node|
        if node.type == :code_block
          next if node.fence_info == ''

          source = node.string_content

          lexer = ::Rouge::Lexer.find_fancy(node.fence_info)

          formatter = (highmark_options[:formatter] || ::Rouge::Formatters::HTML).new(highmark_options[:rouge_options] || {})

          html = '<div class="highlighter-rouge">' + formatter.format(lexer.lex(source)) + '</div>'

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
