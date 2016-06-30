=begin
	Definición del módulo fold 
=end

# REVISAR!!!

module DFS

	def dfs
		node = self
        yield node
        node.each do |child|
            child.dfs unless child == nil 
        end
	end

	# def fold
	# end
	

end