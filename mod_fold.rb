=begin
	Archivo: mod_fold.rb
	Definición del módulo fold 
	Elaborado por: 
	- Maria Lourdes Garcia (10-10264)
	- Daniela Ortiz (10-10517)
=end

module DFS

	# Método para realizar el recorrido DFS.
	def dfs(&block)
		node = self
        yield node
        node.each do |child|
            child.dfs(&block) unless child == nil 
        end
	end

	# Método que recibe un valor base y un bloque de manera
	# implícita e itera desde self haciendo recorrido DFS.
	def fold(valorBase,&block)
		valorBase = yield(self,valorBase)
		self.each do |child|
			res = child.fold(valorBase,&block)
			valorBase = res
		end
		valorBase
	end
	
	

end