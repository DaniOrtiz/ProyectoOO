require_relative "trees.rb"
require_relative "nodos.rb"
require_relative "mod_bfs.rb"
require_relative "mod_fold.rb"

arbol_b_1 = ArbolBinario.new(1,
                ArbolBinario.new(2,
                    ArbolBinario.new(4,
                        ArbolBinario.new(8)),
                    ArbolBinario.new(5,
                        nil,
                        ArbolBinario.new(9))),
                ArbolBinario.new(3,
                    ArbolBinario.new(6),
                    ArbolBinario.new(7,
                        nil,
                        ArbolBinario.new(10)))
            )

arbol_b_2 = ArbolBinario.new("bRyu",
                ArbolBinario.new("se",
                    ArbolBinario.new("nu")
                ),
                ArbolBinario.new("ulaejneg",
                    nil,
                    ArbolBinario.new("imcáog")
                )
            )

arbol_b_3 = ArbolBinario.new([1],
                ArbolBinario.new([1,1],
                    ArbolBinario.new([1,2,1,1],
                        ArbolBinario.new([1,1,1,2,2,1],
                            ArbolBinario.new([3,1,2,2,1,1],
                                ArbolBinario.new([1,3,1,1,2,2,2,1]))))))

arbol_b_1.bfs { |x| puts x.valor }
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10

arbol_b_1.fold(0) { |x,acc| x.valor + acc }
# 55

arbol_b_1.recoger(lambda { |x| x.valor.even? })
# [2,4,6,8,10]

arbol_b_2.bfs { |x| x.mutar(Oscuro); puts x.valor }

arbol_b_3.dfs { |x| x.mutar(Singular); puts x.valor }
# Quien descifre el patrón de primero, tiene puntos extra. Piense bien, solo
# tendrá 3 intentos para enviarme la siguiente secuencia de números del patrón.

arbol_r_1 = ArbolRosa.new("animal",
                ArbolRosa.new("lana"),
                ArbolRosa.new("losa"),
                ArbolRosa.new("lima"),
                ArbolRosa.new("trebol"),
                ArbolRosa.new("lamina"),
                ArbolRosa.new("ala"),
                ArbolRosa.new("avellana"),
                ArbolRosa.new("mani")
            )

p = arbol_r_1.valor.each_char.to_a.permutation.map &:join

arbol_r_1.recoger do |x|
    (p.map { |w| w.include? x.valor }).inject(false) { |x,acc| a || acc}
end
# [arbol_r_1, arbol_r_lana, arbol_r_lima, arbol_r_lamina, arbol_r_ala, arbol_r_mani]