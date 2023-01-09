;Practica planificación FIB - IA (Problema de rovers i llevar cargas)
; Extensió 1 + Els rovers tenen una capacitat de combustible, cada moviment gasta 1 unitat de combustible.
; V.1: No importa quan combustible facin servir en total mentre es facin les peticions.
; V.2: Es minimitza el consum de combustible total.

(define (domain MarsLogisticsExt2)

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
    (plazasLibres ?r - rover)
    (combustible ?r - rover)
    (combustibleTotal)
)

(:action mover_rover
    :parameters (
        ?r - rover
        ?ori - base ?des - base
    )
    :precondition (and (aparcado_en ?r ?ori) (or (hay_camino ?ori ?des) (hay_camino ?des ?ori)) (> (combustible ?r) 0))
    :effect (and (aparcado_en ?r ?des) (not (aparcado_en ?r ?ori)) (decrease (combustible ?r) 1) (increase (combustibleTotal) 1))
)

(:action subir_suministro
    :parameters (
        ?r - rover
        ?s - suministro
        ?b - base
    )
    :precondition (and (esta_en ?s ?b) (aparcado_en ?r ?b) (> (plazasLibres ?r) 1))
    :effect (and (not (esta_en ?s ?b)) (esta_en_rover ?s ?r) (decrease (plazasLibres ?r) 2))
)

(:action bajar_suministro
    :parameters (
        ?r - rover
        ?s - suministro
        ?b - base
    )
    :precondition (and (esta_en_rover ?s ?r) (aparcado_en ?r ?b))
    :effect (and (not (esta_en_rover ?s ?r)) (esta_en ?s ?b) (increase (plazasLibres ?r) 2))
)

(:action subir_persona
    :parameters (
        ?r - rover
        ?p - persona
        ?b - base
    )
    :precondition (and (esta_en ?p ?b) (aparcado_en ?r ?b) (> (plazasLibres ?r) 0))
    :effect (and (not (esta_en ?p ?b)) (esta_en_rover ?p ?r) (decrease (plazasLibres ?r) 1))
)

(:action bajar_persona
    :parameters (
        ?r - rover
        ?p - persona
        ?b - base
    )
    :precondition (and (esta_en_rover ?p ?r) (aparcado_en ?r ?b))
    :effect (and (not (esta_en_rover ?p ?r)) (esta_en ?p ?b) (increase (plazasLibres ?r) 1))
)

)