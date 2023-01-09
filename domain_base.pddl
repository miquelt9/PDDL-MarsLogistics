;Practica planificación FIB - IA (Problema de rovers i llevar cargas)
; No hi ha limitació de capacitat de càrrega i es poden portar persones i subministres alhora.

(define (domain MarsLogisticsBase)

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

(:action mover_rover
    :parameters (
        ?r - rover
        ?ori - base ?des - base
    )
    :precondition (and (aparcado_en ?r ?ori) (or (hay_camino ?ori ?des) (hay_camino ?des ?ori)))
    :effect (and (aparcado_en ?r ?des) (not (aparcado_en ?r ?ori)))
)

(:action subir_carga
    :parameters (
        ?r - rover
        ?c - carga
        ?b - base
    )
    :precondition (and (esta_en ?c ?b) (aparcado_en ?r ?b))
    :effect (and (not (esta_en ?c ?b)) (esta_en_rover ?c ?r))
)

(:action bajar_carga
    :parameters (
        ?r - rover
        ?c - carga
        ?b - base
    )
    :precondition (and (esta_en_rover ?c ?r) (aparcado_en ?r ?b))
    :effect (and (not (esta_en_rover ?c ?r)) (esta_en ?c ?b))
)

)