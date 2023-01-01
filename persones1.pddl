(define (problem persones1) (:domain MarsLogisticsExt1)
(:objects
	r1 r2 r3 r4 r5 - rover
	al1 al2 al3 al4 al5 - almacen
	as1 as2 as3 as4 as5 - asentamiento
	p1 p2 - persona
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - suministro
)

(:init
	(esta_en p1 as1)
	(esta_en p2 as4)
	(esta_en s1 al5)
	(esta_en s2 al3)
	(esta_en s3 al1)
	(esta_en s4 al1)
	(esta_en s5 al1)
	(esta_en s6 al1)
	(esta_en s7 al5)
	(esta_en s8 al3)
	(esta_en s9 al5)
	(esta_en s10 al3)
	(aparcado_en r1 as5)
	(= (plazasLibres r1) 2)
	(aparcado_en r2 al2)
	(= (plazasLibres r2) 2)
	(aparcado_en r3 al3)
	(= (plazasLibres r3) 2)
	(aparcado_en r4 al5)
	(= (plazasLibres r4) 2)
	(aparcado_en r5 al1)
	(= (plazasLibres r5) 2)
	(hay_camino as5 al2)
	(hay_camino as4 as1)
	(hay_camino al5 as2)
	(hay_camino as5 as2)
	(hay_camino al1 as2)
	(hay_camino as1 as3)
	(hay_camino al2 al3)
	(hay_camino as3 as2)
	(hay_camino al3 as2)
	(hay_camino al5 as3)
	(hay_camino al4 al2)
	(hay_camino al4 as5)
)

(:goal (and
	(or 
	(esta_en s6 al5)
	(esta_en s6 al3)
	(esta_en s6 al3)
	)
	(esta_en s4 al5)
	(or 
	(esta_en s10 al4)
	(esta_en s10 al5)
	)
	(or 
	(esta_en p1 as1)
	(esta_en p1 as5)
	(esta_en p1 as2)
	(esta_en p1 as5)
	(esta_en p1 as4)
	(esta_en p1 as5)
	(esta_en p1 as4)
	)
	(or 
	(esta_en s7 al5)
	(esta_en s7 al1)
	)
	(or 
	(esta_en s2 al2)
	(esta_en s2 al4)
	)
	(esta_en s1 al3)
	(esta_en p2 as2)
	(esta_en s3 al2)
))

)
