(define (problem ManualProblem) (:domain MarsLogisticsExt3)
(:objects 
    r1 r2 - rover
    as1 as2 - asentamiento
    al1 al2 - almacen
    p1 p2 p3 p4 p5 - persona
    s1 s2 - suministro
)

(:init
    (= (prioritatsTotal) 0)
    (= (combustibleTotal) 0)
    (= (plazasLibres r1) 2)
    (= (plazasLibres r2) 2)
    (= (combustible r1) 5)
    (= (combustible r2) 8)
    (esta_en p1 as1)
    (= (prioritat p1) 2)
    (esta_en p2 as1)
    (= (prioritat p2) 1)
    (esta_en p3 as1)
    (= (prioritat p3) 1)
    (esta_en p4 as2)
    (= (prioritat p4) 1)
    (esta_en p5 as2)
    (= (prioritat p5) 2)
    (esta_en s1 al1)
    (= (prioritat s1) 3)
    (esta_en s2 al1)
    (= (prioritat s2) 3)
    (aparcado_en r1 as1)
    (aparcado_en r2 as2)
    (hay_camino al1 as1)
    (hay_camino as1 as2)
    (hay_camino as2 al2)
    (hay_camino al1 al2)
)

(:goal (and
    (esta_en p1 as2)
    (esta_en p2 as2)
    (esta_en p3 as2)
    (esta_en p4 as1)
    (esta_en p5 as1)
    (esta_en s1 al2)
    (esta_en s2 al2)
))

(:metric maximize (prioritatsTotal))

)
