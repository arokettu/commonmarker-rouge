module HighMarker
  module CodeRay
    begin
      require 'coderay'

      AVAILABLE = true
    rescue LoadError, SyntaxError
      AVAILABLE = false
    end

    extend ::HighMarker::Abstract

    def self.process_ast(ast, _highmark_options)
      ast.walk do |node|
        if node.type == :code_block
          next if node.fence_info == ''

          source = node.string_content

          html = ::CodeRay.scan(source, node.fence_info.to_sym).div

          new_node = ::CommonMarker::Node.new(:html)
          new_node.string_content = html

          node.insert_before(new_node)
          node.delete
        end
      end
    end
  end
end
