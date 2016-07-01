=begin
	Archivo: trees.rb
	Definición de árboles
	Elaborado por:
	- Maria Lourdes Garcia (10-10264)
	- Daniela Ortiz (10-10517)
=end

require_relative 'nodos.rb'
require_relative 'mod_bfs.rb'
require_relative 'mod_fold.rb'

# Clase árbol 
class Tree

	include BFS
	include DFS

	attr_accessor :valor # Objeto que guarda el valor del nodo actual

	def mutar(mutador)
		@node =self.node.mutar(mutador.new())
	end

end

# Clase árbol binario
class ArbolBinario < Tree
	 
	attr_reader :left,  # Referencia al hijo izquierdo
	            :right  # Referencia al hijo derecho

	# Constructor de un árbol binario.
	def initialize(valor, left=nil, right=nil)
		@valor = valor 
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
class ArbolRosa < Tree
	 
	attr_reader :sons   # Arreglo de hijos

	# Constructor de un árbol rosa.
	def initialize(valor, *hijos)
		@valor = valor
		@sons = []
		hijos.each do |elem| # Iteramos sobre los elementos de la lista hijos
			@sons << elem    # Se agregan a la lista de hijos sons
		end
	end

	# Método para iterar sobre los hijos de un nodo.
	def each
		@sons.each do |elem| # Iteramos en el mismo orden sobre la lista de hijos
			yield elem;
		end
	end
end
		            
