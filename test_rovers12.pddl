(define (problem test_rovers12) (:domain MarsLogisticsExt1)
(:objects
	r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 - rover
	al1 al2 al3 al4 al5 - almacen
	as1 as2 as3 as4 as5 - asentamiento
	p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - persona
	s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - suministro
)

(:init
	(esta_en p1 as5)
	(esta_en p2 as2)
	(esta_en p3 as1)
	(esta_en p4 as5)
	(esta_en p5 as3)
	(esta_en p6 as1)
	(esta_en p7 as5)
	(esta_en p8 as4)
	(esta_en p9 as1)
	(esta_en p10 as3)
	(esta_en s1 al2)
	(esta_en s2 al5)
	(esta_en s3 al3)
	(esta_en s4 al2)
	(esta_en s5 al2)
	(esta_en s6 al3)
	(esta_en s7 al1)
	(esta_en s8 al3)
	(esta_en s9 al5)
	(esta_en s10 al4)
	(aparcado_en r1 as1)
	(= (plazasLibres r1) 2)
	(aparcado_en r2 as3)
	(= (plazasLibres r2) 2)
	(aparcado_en r3 al4)
	(= (plazasLibres r3) 2)
	(aparcado_en r4 al5)
	(= (plazasLibres r4) 2)
	(aparcado_en r5 al2)
	(= (plazasLibres r5) 2)
	(aparcado_en r6 as1)
	(= (plazasLibres r6) 2)
	(aparcado_en r7 al1)
	(= (plazasLibres r7) 2)
	(aparcado_en r8 al2)
	(= (plazasLibres r8) 2)
	(aparcado_en r9 as4)
	(= (plazasLibres r9) 2)
	(aparcado_en r10 al1)
	(= (plazasLibres r10) 2)
	(aparcado_en r11 as1)
	(= (plazasLibres r11) 2)
	(aparcado_en r12 al4)
	(= (plazasLibres r12) 2)
	(hay_camino al4 al1)
	(hay_camino as3 al4)
	(hay_camino al5 al3)
	(hay_camino al4 as3)
	(hay_camino al2 as2)
	(hay_camino as2 al4)
	(hay_camino al3 al1)
	(hay_camino as4 as2)
	(hay_camino as1 al4)
	(hay_camino as5 al2)
	(hay_camino as5 as4)
)

(:goal (and
	(or 
	(esta_en p2 as3)
	(esta_en p2 as2)
	(esta_en p2 as5)
	)
	(esta_en s1 al3)
	(or 
	(esta_en p8 as2)
	(esta_en p8 as2)
	)
	(esta_en s3 al5)
	(or 
	(esta_en p5 as3)
	(esta_en p5 as5)
	)
	(or 
	(esta_en p4 as2)
	(esta_en p4 as2)
	)
	(or 
	(esta_en s9 al1)
	(esta_en s9 al5)
	)
	(esta_en p3 as2)
	(esta_en p7 as1)
	(or 
	(esta_en p10 as4)
	(esta_en p10 as4)
	)
	(esta_en s4 al5)
	(esta_en p9 as4)
	(esta_en s7 al3)
))

)