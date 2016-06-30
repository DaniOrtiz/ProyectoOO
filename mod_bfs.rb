=begin
	Definición del módulo bfs
=end

module BFS

	def bfs
		cola = []
		cola << self
		while (!cola.empty?)
			auxnode = cola.shift
			auxnode.each do |child|
				cola << child unless child == nil
			end
		end 
	end

	def recoger(&block)
		cola = []
		cola << self
		while (!cola.empty?)
			auxnode = cola.shift 
			auxnode.each do |child|
				if block.call(child)
					cola << child unless child == nil
				end
			end
		end
	end
end