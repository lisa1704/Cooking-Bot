
(define (domain food_maker)
(:requirements :typing :fluents :action-costs :conditional-effects)
(:types location robot fruit quantity vegetable spice protien baking_ingredients meal_ingredients juice_ingredients cooking_tools tableware food 
- object)

;all predicates

(:predicates 	
	(robot-at ?r - robot ?l - location)
    (is_available_dessert ?i - baking_ingredients  ?l - location)
	(is_available_meal ?i - meal_ingredients  ?l - location)
	(is_available_juice ?i - juice_ingredients  ?l - location)
	(put_in_dessert ?i1 ?i2 ?i3 - baking_ingredients ?tool  - cooking_tools ?f - food )
	(put_in_meal ?i1 ?i2 ?i3 - meal_ingredients ?tool  - cooking_tools ?f - food )
	(put_in_juice ?i1 ?i2 ?i3 - juice_ingredients ?tool - cooking_tools ?f - food )


	(demand-fruit  ?f - fruit ?q - quantity ?l - location ) 
    (demand-vegetable  ?v - vegetable ?q - quantity ?l - location ) 
    (demand-protien  ?p - protien ?q - quantity ?l - location ) 
    (demand-spice  ?s - spice ?q - quantity ?l - location ) 
    (unload ?r - robot ?l - location ?q - quantity)

    ; (demand-quantity ?q - quantity ?l - location )
    (free-storage ?r - robot ?q - quantity)
    (add1 ?q1 ?q2 - quantity)

)

;functions charge-cost and charge-left 

(:functions 
(charge-cost ?l1 ?l2 - location)
(charge-left))



;here robot buys types of fruits
(:action buy_fruits
    :parameters (?r - robot ?l - location
                  ?d ?d_less ?st ?st_less -quantity
                  ?f - fruit
                  )
    :precondition (and (robot-at ?r ?l)
                       (demand-fruit  ?f ?d ?l)
                       (free-storage ?r ?st)
                       (add1 ?d_less ?d)
                       (add1 ?st_less ?st)
                                              )
    ;demand-fruit is lessen by one
    ;storage is lessen by one
    :effect (and (not (demand-fruit ?f ?d ?l ))
                      (demand-fruit ?f ?d_less ?l )
                      (not (free-storage ?r ?st))
                      (free-storage ?r ?st_less)
                      
                      )
)

(:action buy_vegetables
    :parameters (?r - robot ?l  - location
                  ?d ?d_less ?st ?st_less -quantity
                  ?v - vegetable
                  )
    :precondition (and (robot-at ?r ?l)
                      (demand-vegetable  ?v ?d ?l) 

                      ;  (demand-quantity ?f ?d ?l)
                       (free-storage ?r ?st)
                       (add1 ?d_less ?d)
                       (add1 ?st_less ?st))
    ;demand-fruit is lessen by one
    ;storage is lessen by one
    :effect (and (not (demand-vegetable  ?v ?d ?l))
                      (demand-vegetable  ?v ?d_less ?l)
                      (not (free-storage ?r ?st))
                      (free-storage ?r ?st_less))
)

(:action buy_protien
    :parameters (?r - robot ?l - location
                  ?d ?d_less ?st ?st_less -quantity
                  ?p - protien
                  )
    :precondition (and (robot-at ?r ?l)
                      (demand-protien  ?p ?d ?l) 
                      ;  (demand-quantity ?f ?d ?l
                       (free-storage ?r ?st)
                       (add1 ?d_less ?d)
                       (add1 ?st_less ?st))
    ;demand-fruit is lessen by one
    ;storage is lessen by one
    :effect (and (not (demand-protien  ?p ?d ?l))
                      (demand-protien  ?p ?d_less ?l)
                      (not (free-storage ?r ?st))
                      (free-storage ?r ?st_less))
)

(:action buy_spice
    :parameters (?r - robot ?l - location
                  ?d ?d_less ?st ?st_less -quantity
                  ?s - spice
                  )
    :precondition (and (robot-at ?r ?l)
                      (demand-spice  ?s ?d ?l) 
                      ;  (demand-quantity ?f ?d ?l)
                       (free-storage ?r ?st)
                       (add1 ?d_less ?d)
                       (add1 ?st_less ?st))
    ;demand-fruit is lessen by one
    ;storage is lessen by one
    :effect (and (not (demand-spice  ?s ?d ?l))
                      (demand-spice  ?s ?d_less ?l)
                      (not (free-storage ?r ?st))
                      (free-storage ?r ?st_less))
)

(:action empty-storage
    :parameters (?r - robot ?l - location  ?st ?q - quantity  )
    :precondition (and                                                                      
                        (robot-at ?r ?l)
                        (unload ?r ?l ?st)
                        
    )
    ;empty storage,here robot emptys its storage
    :effect (and 
    (not (free-storage ?r ?st))
        (free-storage ?r ?q)
       (unload ?r ?l ?q)
    (not (robot-at ?r ?l))
    ))

                                                                                                                                                                                                                                               

(:action baking_dessert
   :parameters (?l - location ?r - robot ?i1 ?i2 ?i3 - baking_ingredients  ?tool - cooking_tools  ?f - food)
   
   :precondition (and (robot-at ?r ?l) 
                 (is_available_dessert ?i1 ?l)
                 (is_available_dessert ?i2 ?l)
                 (is_available_dessert ?i3 ?l)

                 )
   :effect (and (put_in_dessert ?i1 ?i2 ?i3 ?tool ?f))
)


(:action prepare_meal
   :parameters (?l - location ?r - robot ?i1 ?i2 ?i3 - meal_ingredients  ?tool - cooking_tools ?f - food)
   
   :precondition (and (robot-at ?r ?l) 
                 (is_available_meal ?i1 ?l)
                 (is_available_meal ?i2 ?l)
                 (is_available_meal ?i3 ?l))
   
   :effect (and (put_in_meal ?i1 ?i2 ?i3 ?tool ?f)
   
   )
		
)


	

(:action making-juice
    :parameters (?l - location ?r - robot ?i1 ?i2 ?i3 - juice_ingredients ?t - cooking_tools ?f - food)
  
    :precondition (and 
                    (robot-at ?r ?l)
                    (is_available_juice ?i1  ?l)
                    (is_available_juice ?i2  ?l)
                    (is_available_juice ?i3 ?l)
    )
    :effect (and 
    (put_in_juice ?i1 ?i2 ?i3 ?t ?f )
    )
)


(:action go_shopping
   :parameters (?r - robot ?from ?to - location)
   :precondition (robot-at ?r ?from)
   :effect (and (not (robot-at ?r ?from))
		(robot-at ?r ?to)
    (decrease (charge-left)(charge-cost ?from ?to) )
))


)
