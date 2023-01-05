(define (problem test_subministres5) (:domain MarsLogisticsExt2)
(:objects
	r1 r2 r3 r4 r5 - rover
	al1 al2 al3 al4 al5 - almacen
	as1 as2 as3 as4 as5 - asentamiento
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - persona
	s1 s2 s3 s4 s5 - suministro
)

(:init
	(= (combustibleTotal) 0)
	(esta_en p1 as2)
	(esta_en p2 as1)
	(esta_en p3 as4)
	(esta_en p4 as1)
	(esta_en p5 as4)
	(esta_en p6 as2)
	(esta_en p7 as4)
	(esta_en p8 as3)
	(esta_en p9 as5)
	(esta_en p10 as4)
	(esta_en s1 al5)
	(esta_en s2 al1)
	(esta_en s3 al5)
	(esta_en s4 al1)
	(esta_en s5 al3)
	(aparcado_en r1 al1)
	(= (plazasLibres r1) 2)
	(= (combustible r1) 100)
	(aparcado_en r2 as2)
	(= (plazasLibres r2) 2)
	(= (combustible r2) 100)
	(aparcado_en r3 as5)
	(= (plazasLibres r3) 2)
	(= (combustible r3) 100)
	(aparcado_en r4 al2)
	(= (plazasLibres r4) 2)
	(= (combustible r4) 100)
	(aparcado_en r5 al2)
	(= (plazasLibres r5) 2)
	(= (combustible r5) 100)
	(hay_camino as2 as3)
	(hay_camino al3 as1)
	(hay_camino al2 as5)
	(hay_camino al4 as4)
	(hay_camino as3 al3)
	(hay_camino as2 as4)
	(hay_camino al5 as5)
	(hay_camino as1 al1)
	(hay_camino as4 as3)
	(hay_camino as2 al1)
	(hay_camino al1 al5)
	(hay_camino as5 as1)
)

(:goal (and
	(or 
	(esta_en p4 as3)
	(esta_en p4 as5)
	)
	(esta_en p6 as5)
	(or 
	(esta_en p1 as3)
	(esta_en p1 as5)
	)
	(or 
	(esta_en s2 al5)
	(esta_en s2 al1)
	)
	(or 
	(esta_en p8 as3)
	(esta_en p8 as1)
	(esta_en p8 as5)
	)
	(or 
	(esta_en s3 al2)
	(esta_en s3 al4)
	(esta_en s3 al1)
	(esta_en s3 al1)
	)
	(esta_en p9 as3)
	(or 
	(esta_en s1 al3)
	(esta_en s1 al3)
	)
	(esta_en s4 al3)
	(or 
	(esta_en s5 al1)
	(esta_en s5 al2)
	)
))

)
