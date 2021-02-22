

(define (problem food_maker_problem)
  (:domain food_maker)

  (:objects

    ;location names robot fruits spices protiens 
    fruitShop ProtienShop VegShop Home SpiceShop Kitchen - location
    robot1 - robot
    banana apple - fruit
    carrot brocoli - vegetable
    pepper salt - spice
    chicken beef - protien
    
    sugar flour chocolate - baking_ingredients
    proteins vegetables spices - meal_ingredients
    fruits sugars water - juice_ingredients
    plate glass - tableware
    oven cooker juicer - cooking_tools 
    dessert meal juice - food

    ;quantity upto n70
    
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9
    n10 n11 n12 n13 n14 n15 n16 n17 n18 n19
    n20 n21 n22 n23 n24 n25 n26 n27 n28 n29
    n30 n31 n32 n33 n34 n35 n36 n37 n38 n39
    n40 n41 n42 n43 n44 n45 n46 n47 n48 n49 
    n50 n51 n52 n53 n54 n55 n56 n57 n58 n59 n60 n61 
    n62 n63 n64 n65 n66 n67 n68 n69 n70 - quantity
    )

  (:init

    ;initial position 
    (robot-at robot1 Home)

   (free-storage robot1 n40)
   (demand-fruit  banana n6 fruitShop )
    (demand-fruit  apple n4 fruitShop )
    (demand-vegetable carrot n6 VegShop)
   (demand-protien beef n8 ProtienShop)
  (demand-spice pepper n10 SpiceShop)

    ;availailty of foods in kitchen


    (is_available_meal vegetables Kitchen)
    (is_available_meal spices Kitchen)
    (is_available_meal proteins Kitchen)
    (is_available_dessert flour Kitchen)
    (is_available_dessert sugar Kitchen)
    (is_available_dessert chocolate Kitchen)
    (is_available_juice fruits Kitchen)
    (is_available_juice sugars Kitchen)
    (is_available_juice water Kitchen)

    ;unload robots goods here

    (unload robot1 Home n0)
    (add1 n0 n1)
    (add1 n1 n2)
    (add1 n2 n3)
    (add1 n3 n4)
    (add1 n4 n5)
    (add1 n5 n6)
    (add1 n6 n7)
    (add1 n7 n8)
    (add1 n8 n9)
    (add1 n9 n10)
    (add1 n10 n11)
    (add1 n11 n12)
    (add1 n12 n13)
    (add1 n13 n14)
    (add1 n14 n15)
    (add1 n15 n16)
    (add1 n16 n17)
    (add1 n17 n18)
    (add1 n18 n19)
    (add1 n19 n20)
    (add1 n20 n21)
    (add1 n21 n22)
    (add1 n22 n23)
    (add1 n23 n24)
    (add1 n24 n25)
    (add1 n25 n26)
    (add1 n26 n27)
    (add1 n27 n28)
    (add1 n28 n29)
    (add1 n29 n30)
    (add1 n30 n31)
    (add1 n31 n32)
    (add1 n32 n33)
    (add1 n33 n34)
    (add1 n34 n35)
    (add1 n35 n36)
    (add1 n36 n37)
    (add1 n37 n38)
    (add1 n38 n39)
    (add1 n39 n40)
    (add1 n40 n41)
    (add1 n41 n42)
    (add1 n42 n43)
    (add1 n43 n44)
    (add1 n44 n45)
    (add1 n45 n46)
    (add1 n46 n47)
    (add1 n47 n48)
    (add1 n48 n49)
    (add1 n49 n50)
    (add1 n50 n51)
    (add1 n51 n52)
    (add1 n52 n53)
    (add1 n53 n54)
    (add1 n54 n55)
    (add1 n55 n56)
    (add1 n56 n57)
    (add1 n57 n58)
    (add1 n58 n59)
    (add1 n59 n60)
    (add1 n60 n61)
    (add1 n61 n62)
    (add1 n62 n63)
    (add1 n63 n64)
     (add1 n64 n65)
     (add1 n65 n66)
     (add1 n66 n67)
     (add1 n67 n68)
     (add1 n68 n69)
     (add1 n69 n70)

    ;charge cost of every location the robot can move

    (= (charge-cost Home Home) 0)
    (= (charge-cost Home fruitShop) 1173)
    (= (charge-cost Home SpiceShop) 3000)
    (= (charge-cost Home ProtienShop) 87)
    (= (charge-cost Home VegShop) 980)
    (=(charge-cost VegShop Home)980)

    (=(charge-cost fruitShop VegShop)970)
    (=(charge-cost VegShop fruitShop)970)
    (=(charge-cost ProtienShop VegShop)127)
    (=(charge-cost VegShop ProtienShop)127)

    (=(charge-cost fruitShop Kitchen)1200)
    (=(charge-cost Kitchen fruitShop)1200)
    (=(charge-cost Kitchen VegShop)1307)
    (=(charge-cost VegShop Kitchen)1307)
    (=(charge-cost Home Kitchen) 18)
    (=(charge-cost Kitchen Home) 18)
    (=(charge-cost Kitchen SpiceShop)1407)
    (=(charge-cost SpiceShop Kitchen)1407)
    (=(charge-cost Kitchen ProtienShop)207)
    (=(charge-cost  ProtienShop Kitchen)1307)
    (=(charge-cost  Kitchen Kitchen)0)


    

    (= (charge-cost fruitShop Home) 973)
    (= (charge-cost fruitShop fruitShop) 0)
    (= (charge-cost fruitShop SpiceShop) 372)
    (= (charge-cost fruitShop ProtienShop) 29)
    (= (charge-cost SpiceShop Home) 896)
    (= (charge-cost SpiceShop fruitShop) 372)
    (= (charge-cost SpiceShop SpiceShop) 0)
    (= (charge-cost SpiceShop ProtienShop) 79)
    (= (charge-cost ProtienShop Home) 87)
    (= (charge-cost ProtienShop fruitShop) 29)
    (= (charge-cost ProtienShop SpiceShop) 79)
    (= (charge-cost ProtienShop ProtienShop) 0)
    
    (=(charge-left) 5000)
    )

  (:goal (and 
         
              (demand-fruit  banana n0 fruitShop )
               (demand-fruit  apple n0 fruitShop )
              (demand-vegetable carrot n0 VegShop)
              (demand-protien beef n0 ProtienShop)
              (demand-spice pepper n0 SpiceShop)

               (unload robot1 Home n40)
               (robot-at robot1 Kitchen)

     (put_in_meal proteins vegetables spices cooker meal) 
    (put_in_dessert sugar flour chocolate oven dessert)
     (put_in_juice fruits sugars water juicer juice)
    )
	 )

  ;maximize the charge of robot
  (:metric maximize(charge-left))

  )
