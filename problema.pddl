(define (problem problema) (:domain MarsLogisticsBase)
(:objects
	r1 r2 r3 r4 r5 - rover
	al1 al2 al3 - almacen
	as1 as2 as3 - asentamiento
	p1 p2 p3 p4 p5 - persona
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - suministro
)

(:init
	(esta_en p1 as3)
	(esta_en p2 as1)
	(esta_en p3 as3)
	(esta_en p4 as3)
	(esta_en p5 as1)
	(esta_en s1 al2)
	(esta_en s2 al1)
	(esta_en s3 al1)
	(esta_en s4 al3)
	(esta_en s5 al2)
	(esta_en s6 al1)
	(esta_en s7 al2)
	(esta_en s8 al1)
	(esta_en s9 al1)
	(esta_en s10 al3)
	(aparcado_en r1 as1)
	(aparcado_en r2 al2)
	(aparcado_en r3 as2)
	(aparcado_en r4 as1)
	(aparcado_en r5 al2)
	(hay_camino as2 as1)
	(hay_camino al2 as2)
	(hay_camino as3 al2)
	(hay_camino al1 as2)
	(hay_camino al3 as3)
)

(:goal (and
	(esta_en s6 al2)
	(esta_en p5 as1)
	(esta_en p4 as2)
	(esta_en p3 as2)
	(esta_en s5 al2)
))
)
