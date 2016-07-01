# encoding: utf-8

=begin
	Definición de los nodos y mutadores
=end

# Definición de la clase nodo
# PUEDE QUE NO SEA NECESARIA
class Nodo
	attr_accessor :node
end

class Mutador
end

class Singular < Mutador

	def withFixnum(val)
		aux  = val.to_s.chars.map{|i| i.to_i}
		last = aux.pop
		cont = 0
		a.each {|i| cont = cont + i}
		if cont != 0 then
			return count*last
		else
			return last
		end
	end

	def withString(val)
		string = "singular"
		val    = val.split("")
		aux    = []
		for i in val
			if string.include?(i) then
				i.capitalize!
			end
			aux.push(i)
		end
		return aux.joins()
	end	

	def withArray(val)
		return val.flatten.join(" ")
	end

end

class Uniforme < Mutador

	def withFixnum(val)
		aux  = val.to_s.chars.map{|i| i.to_i}
		cont = aux.pop
		a.each {|i| cont = cont + i}
		return (cont.to_f/(aux.size + 1)).round
	end

	def withString(val)
		val = val.split("")
		tam = val.length
		aux = []
		for i in (0..tam-1)
			if  (i % 2 == 0) then
				val[i].capitalize!
			else
				val[i].downcase!
			end	
		end
		return val.join() 
	end

	def withArray(val)
		u   = Uniforme.new()
		aux = []
		val.each {|i| i.push(i.mutar(u))}
		return aux
	end

end

class Oscuro < Mutador

	def withFixnum(val)
		aux  = z.to_s.chars.map{|i| i.to_i}
		cont = []
		aux.each_index {|i| cont.push(aux[i]) if i.even?}
		return cont.join.to_i
	end

	def withString(val)
		left  = []
		rigth = []
		val   = val.split("")
		tam   = val.length
		for i in (0..tam-1)
			if (i % 2 == 0) then
				rigth.push(val[i])
			else
				left.push(val[i])
			end
			val = left + rigth
			return val.join() 
		end 
	end

	def withArray(val)
		o 	   = Oscuro.new() 
		val    = val.flatten
		tam    = (0..val.length-1)
		aux    = tam.to_a
		tam    = val.length.fdiv(2)
		random = aux.sample(tam.round)
		for i in random
			val[i] = (val[i].mutar(o))
		end
		return val
	end

end
 
# Redefinición de las Clases

class Fixnum

	def mutar(mut)
		mut.withFixnum(self)
	end

end

class String

	def mutar(mut)
		mut.withString(self)
	end	

end

class Array

	def mutar(mut)
		mut.withArray(self)
	end
		
end