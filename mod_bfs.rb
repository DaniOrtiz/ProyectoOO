=begin
	Archivo: mod_bfs.rb
	Definición del módulo bfs
	Elaborado por: 
	- Maria Lourdes Garcia (10-10264)
	- Daniela Ortiz (10-10517)
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