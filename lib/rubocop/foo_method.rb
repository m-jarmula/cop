module RuboCop
  module Cop
    module Deprecation
      class FooMethod < Cop
        # MSG = 'Use `#bar` instead of `#foo`.'.freeze

        # def on_class(send_node)
        #   name, _superclass, body = *send_node
        #   # p send_node.child_nodes
        #   # p body.child_nodes
        #   send_node.each_child_node { |n| a,b,c = n; p b }
        #   dupa?(send_node) do
        #     add_offense(send_node, :selector)
        #   end
        # end

        def on_class(node)
          name, superclass, body = *node
          p body.child_nodes.first.inspect
          dupa?(body.child_nodes.first) do
            add_offense(node)
          end
          # node.each_child_node { |n| p n.inspect }
        end

        # def on_send(node)
        #   #  type, receiver, child = *node
        #   p 'tesr'
        #    p node.inspect
        # end

        def_node_matcher :dupa?, <<-PATTERN
        (send (send ...) :include)
        PATTERN
      end
    end
  end
end
