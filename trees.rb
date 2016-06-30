=begin
	Definición de árboles
=end

require_relative 'mod_bfs.rb'

# Clase árbol #### EXTENDER CUANDO TENGAMOS MUTADORES
class Tree

	include BFS

end

# Clase árbol binario
class BinaryTree < Tree
	attr_accessor :node # Objeto que guarda el valor del nodo actual 
	attr_reader :left,  # Referencia al hijo izquierdo
	            :right  # Referencia al hijo derecho

	# Constructor de un árbol binario.
	def initialize(node, left=nil, right=nil)
		@node = node 
		@left = left 
		@right = right 
	end

	# Método para iterar sobre los hijos de un nodo.
	def each
		if (left != nil)
			yield left;  # Primero iteramos sobre el hijo izquierdo
		end
		if (right != nil)
			yield right; # Luego sobre el hijo derecho
		end
	end
end

# Clase árbol rosa
class PinkTree < Tree
	attr_accessor :node # Objeto que guarda el valor del nodo actual 
	attr_reader :sons   # Arreglo de hijos

	# Constructor de un árbol rosa.
	def initialize(node, sons = [])
		@node = node 
		@sons = sons
	end

	# Método para iterar sobre los hijos de un nodo.
	def each
		@sons.each do |elem| # Iteramos en el mismo orden sobre la lista de hijos
			yield elem;
		end
	end
end
		            
