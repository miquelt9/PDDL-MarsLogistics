;Practica planificación FIB - IA (Problema de rovers i llevar cargas)
; En esta primera version (ext1) no hay limitaciones de carga. 

(define (domain MarsLogisticsExt1)

;remove requirements that are not needed
(:requirements :adl :fluents :equality)

(:types ;Types and their Hierarchy
    rover - object
    base - object
    asentamiento almacen - base
    carga - object
    persona suministro - carga 
)

(:predicates
    (esta_en ?c - carga ?b - base)
    (aparcado_en ?r - rover ?b - base)
    (esta_en_rover ?c - carga ?r - rover)
    (hay_camino ?b1 - base ?b2 - base)
)

(:functions
    (plazasLibres)
)

(:action mover_rover
    :parameters (
        ?r - rover
        ?ori - base ?des - base
    )
    :precondition (and (aparcado_en ?r ?ori) (or (hay_camino ?ori ?des) (hay_camino ?des ?ori)))
    :effect (and (aparcado_en ?r ?des) (not (aparcado_en ?r ?ori)))
)

(:action subir_suministro
    :parameters (
        ?r - rover
        ?s - suministro
        ?b - base
    )
    :precondition (and (esta_en ?s ?b) (aparcado_en ?r ?b) (> (plazasLibres) 1))
    :effect (and (not (esta_en ?s ?b)) (esta_en_rover ?s ?r) (decrease (plazasLibres) 2))
)

(:action bajar_suministro
    :parameters (
        ?r - rover
        ?s - suministro
        ?b - base
    )
    :precondition (and (esta_en_rover ?s ?r) (aparcado_en ?r ?b))
    :effect (and (not (esta_en_rover ?s ?r)) (esta_en ?s ?b) (increase (plazasLibres) 2))
)

(:action subir_persona
    :parameters (
        ?r - rover
        ?p - persona
        ?b - base
    )
    :precondition (and (esta_en ?p ?b) (aparcado_en ?r ?b) (> (plazasLibres) 0))
    :effect (and (not (esta_en ?p ?b)) (esta_en_rover ?p ?r) (decrease (plazasLibres) 1))
)

(:action bajar_persona
    :parameters (
        ?r - rover
        ?p - persona
        ?b - base
    )
    :precondition (and (esta_en_rover ?p ?r) (aparcado_en ?r ?b))
    :effect (and (not (esta_en_rover ?p ?r)) (esta_en ?p ?b) (increase (plazasLibres) 1))
)

)