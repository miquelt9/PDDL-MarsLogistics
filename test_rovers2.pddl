(define (problem test_rovers2) (:domain MarsLogisticsExt1)
(:objects
	r1 r2 - rover
	al1 al2 al3 al4 al5 - almacen
	as1 as2 as3 as4 as5 - asentamiento
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - persona
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - suministro
)

(:init
	(esta_en p1 as3)
	(esta_en p2 as5)
	(esta_en p3 as4)
	(esta_en p4 as3)
	(esta_en p5 as2)
	(esta_en p6 as3)
	(esta_en p7 as4)
	(esta_en p8 as1)
	(esta_en p9 as2)
	(esta_en p10 as4)
	(esta_en s1 al2)
	(esta_en s2 al4)
	(esta_en s3 al3)
	(esta_en s4 al4)
	(esta_en s5 al5)
	(esta_en s6 al1)
	(esta_en s7 al2)
	(esta_en s8 al2)
	(esta_en s9 al3)
	(esta_en s10 al3)
	(aparcado_en r1 as1)
	(= (plazasLibres r1) 2)
	(aparcado_en r2 al1)
	(= (plazasLibres r2) 2)
	(hay_camino al5 al2)
	(hay_camino al4 as3)
	(hay_camino as1 as3)
	(hay_camino al2 as3)
	(hay_camino al3 as3)
	(hay_camino al1 al4)
	(hay_camino as3 as4)
	(hay_camino as5 as4)
	(hay_camino as4 al3)
	(hay_camino as2 as3)
	(hay_camino al4 al2)
)

(:goal (and
	(or 
	(esta_en s7 al2)
	(esta_en s7 al2)
	(esta_en s7 al3)
	(esta_en s7 al1)
	)
	(or 
	(esta_en s8 al3)
	(esta_en s8 al2)
	)
	(or 
	(esta_en s1 al2)
	(esta_en s1 al2)
	(esta_en s1 al1)
	)
	(esta_en p1 as1)
	(or 
	(esta_en s10 al5)
	(esta_en s10 al2)
	)
	(or 
	(esta_en p10 as2)
	(esta_en p10 as3)
	)
	(esta_en p7 as2)
	(esta_en p3 as3)
	(esta_en p8 as4)
	(esta_en p9 as4)
	(esta_en s2 al5)
	(esta_en s9 al2)
))

)
