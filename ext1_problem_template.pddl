(define (problem ManualProblem) (:domain MarsLogisticsExt1)
(:objects 
    r1 r2 r3 - rover
    as1 as2 as3 - asentamiento
    al1 al2 al3 - almacen
    p1 p2 p3 p4 - persona
    s1 s2 s3 s4 - suministro
)

(:init
    (= (plazasLibres r1) 2)
    (= (plazasLibres r2) 2)
    (= (plazasLibres r3) 2)
    (esta_en p1 as1)
    (esta_en p2 as2)
    (esta_en p3 as3)
    (esta_en p4 as1)
    (esta_en s1 al1)
    (esta_en s2 al2)
    (esta_en s3 al3)
    (esta_en s4 al3)
    (aparcado_en r1 as1)
    (aparcado_en r2 as2)
    (aparcado_en r3 as3)
    (hay_camino al3 as2)
    (hay_camino al3 al1)
    (hay_camino al1 as3)
    (hay_camino as1 as3)
    (hay_camino as3 al2)
    (hay_camino al2 as2)
)

(:goal (and
    (esta_en p1 as1)
    (esta_en p2 as1)
    (esta_en p3 as2)
    (esta_en p4 as3)
    (esta_en s1 al2)
    (esta_en s2 al3)
    (esta_en s3 al2)
    (esta_en s4 al1)
))
)
