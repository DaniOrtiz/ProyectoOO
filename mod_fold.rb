=begin
	Archivo: mod_fold.rb
	Definición del módulo fold 
	Elaborado por: 
	- Maria Lourdes Garcia (10-10264)
	- Daniela Ortiz (10-10517)
=end

module DFS

	def dfs(&block)
		node = self
        yield node
        node.each do |child|
            child.dfs(&block) unless child == nil 
        end
	end

	def fold(baseValue,&block)
		baseValue = yield(self,baseValue)
		self.each do |child|
			res = child.fold(baseValue,&block)
			baseValue = res
		end
		baseValue
	end
	

end