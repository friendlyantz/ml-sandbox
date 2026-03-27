

require "ruby-graphviz"

# graphviz helper, ignore
def trace(root)
  nodes = Set.new
  edges = Set.new

  build = lambda do |v|
    unless nodes.include?(v)
      nodes.add(v)
      v.children.each do |child|
        edges.add([child, v])
        build.call(child)
      end
    end
  end

  build.call(root)
  [nodes, edges]
end

def draw_dot_graphviz(root)
  nodes, edges = trace(root)

  g = GraphViz.new(:G, type: :digraph, rankdir: "LR")
  node_map = {}

  # Create value nodes and (optional) op nodes
  nodes.each do |n|
    value_id = "v_#{n.object_id}"
    value_label = "{ #{n.label} | result #{format("%.4f", n.data)} | grad #{format("%.4f", n.grad)}}"
    value_node = g.add_nodes(value_id, label: value_label, shape: "record")
    node_map[value_id] = value_node

    unless n.op.nil? || n.op.empty?
      op_id = "op_#{n.object_id}_#{n.op}"
      op_node = g.add_nodes(op_id, label: n.op)
      node_map[op_id] = op_node
      g.add_edges(op_node, value_node)
    end
  end

  # Connect child value -> parent op
  edges.each do |n1, n2|
    from_id = "v_#{n1.object_id}"
    to_id = n2.op.nil? || n2.op.empty? ? "v_#{n2.object_id}" : "op_#{n2.object_id}_#{n2.op}"
    g.add_edges(node_map[from_id], node_map[to_id])
  end

  g

end