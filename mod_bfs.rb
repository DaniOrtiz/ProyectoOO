=begin
	Archivo: mod_bfs.rb
	Definición del módulo bfs
	Elaborado por: 
	- Maria Lourdes Garcia (10-10264)
	- Daniela Ortiz (10-10517)
=end

module BFS

	# Método que recibe un bloque de manera implícita 
	# e itera desde self haciendo un recorrido BFS.
	def bfs
		cola = []
		cola << self
		while (!cola.empty?)
			auxnode = cola.shift
			yield auxnode
			auxnode.each do |child|
				cola << child unless child == nil
			end
		end 
	end

	# Método que recibe un predicado (bloque) de manera
	# explícita, itera desde self haciendo un recorrido 
	# BFS y en el camino va recogiendo los nodos que 
	# cumplan con el predicado
	
	def recoger(block)	
		cola = []
		self.bfs {|child| cola << child if block.call(child)}	
		return cola
	end

end