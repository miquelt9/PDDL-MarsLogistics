(define (problem ext1_problema_prova) (:domain MarsLogisticsExt1)
(:objects
	r1 r2 - rover
	al1 al2 al3 al4 al5 - almacen
	as1 - asentamiento
	p1 - persona
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - suministro
)

(:init
	(= (plazasLibres) 2)
	(esta_en p1 as1)
	(esta_en s1 al4)
	(esta_en s2 al4)
	(esta_en s3 al3)
	(esta_en s4 al4)
	(esta_en s5 al3)
	(esta_en s6 al2)
	(esta_en s7 al4)
	(esta_en s8 al4)
	(esta_en s9 al2)
	(esta_en s10 al4)
	(aparcado_en r1 as1)
	(aparcado_en r2 as1)
	(hay_camino as1 al4)
	(hay_camino al1 as1)
	(hay_camino al5 al4)
	(hay_camino al4 al3)
	(hay_camino al3 al2)
)

(:goal (and
	(esta_en s7 al1)
	(esta_en s4 al2)
	(esta_en p1 as1)
	(esta_en s9 al2)
	(esta_en s1 al1)
	(esta_en s5 al1)
	(esta_en s2 al1)
	(esta_en s10 al2)
))
)
