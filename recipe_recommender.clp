; Create templates
(deftemplate Recipe
   (slot name)
   (slot cuisine)
   (slot difficulty)
   (slot ingredients)
   (slot instructions)
)

(deftemplate User
   (slot name)
   (slot cuisine-preference)
   (slot difficulty-preference)
   (slot ingredient-preference)
)

; Create Rules

(defrule GetUserPreferences
    (not (User (name ?name)))
    =>
    ; inputs for user
    (printout t "insert your name !")
    (bind ?name (read))
    (printout t "Welcome, " ?name ". Let's find you a recipe!" crlf)
    (printout t "What cuisine do you prefer? ")
    (bind ?cuisine-pref (read))
    (printout t "How difficult should the recipe be? (Easy, Intermediate, Difficult) ")
    (bind ?difficulty-pref (read))
    (printout t "Do you have any specific ingredient preferences? ")
    (bind ?ingredient-pref (read))
    ; create new user fact
    (assert (User 
        (name ?name)
        (difficulty-preference ?difficulty-pref)
        (cuisine-preference ?cuisine-pref)
        (ingredient-preference ?ingredient-pref)
    ))
)

(defrule RecommendRecipe
    (User 
        (name ?name)
        (cuisine-preference ?cuisine-pref)
        (difficulty-preference ?difficulty-pref)
        (ingredient-preference ?ingredient-pref)
    )
    (Recipe 
        (name ?recipe)
        (cuisine ?cuisine)
        (difficulty ?difficulty)
        (ingredients ?ingredients)
    )
    (test (eq ?cuisine ?cuisine-pref))
    (test (eq ?difficulty ?difficulty-pref))
    (test (str-compare ?ingredients ?ingredient-pref))
    =>
    (printout t "Based on your preferences, we recommend: " ?recipe crlf)
    (printout t "Ingredients: " ?ingredients crlf)
    (printout t "Enjoy your meal!" crlf)
    ;(retract (User (name ?name)))
    ;(retract (Recipe (name ?recipe)))
)

(defrule VegetarianRecipe
    (User (name ?name) (ingredient-preference "Vegetarian"))
    (Recipe (name ?recipe) (ingredients ?ingredients))
    (test (not (str-index ?ingredients "meat")))
    =>
    (printout t ?name ", we recommend a vegetarian recipe: " ?recipe crlf)
)

(defrule FastFoodRecipe
    (User (name ?name) (cuisine-preference "Fast Food"))
    (Recipe (name ?recipe) (cuisine "Fast Food"))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a fast food recipe: " ?recipe crlf)
)

(defrule CuisineSpecificRecipe
    (User (name ?name) (cuisine-preference ?cuisine-pref))
    (Recipe (name ?recipe) (cuisine ?cuisine))
    (test (str-index ?cuisine ?cuisine-pref))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a recipe with your preferred cuisine: " ?recipe crlf)
)

(defrule MexicanRecipe
    (User (name ?name) (cuisine-preference "Mexican"))
    (Recipe (name ?recipe) (cuisine "Mexican"))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a Mexican recipe: " ?recipe crlf)
)

(defrule ThaiRecipe
    (User (name ?name) (cuisine-preference "Thai"))
    (Recipe (name ?recipe) (cuisine "Thai"))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a Thai recipe: " ?recipe crlf)
)

(defrule FrenchRecipe
    (User (name ?name) (cuisine-preference "French"))
    (Recipe (name ?recipe) (cuisine "French"))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a French recipe: " ?recipe crlf)
)

(defrule ExitRecommendation
   (User (name ?name))
   =>
   (printout t "------------------------------------------" crlf)
    (printout t "Thank you for using the personalized recipe recommender, " ?name "!" crlf)
    (printout t "------------------------------------------" crlf)
   ;(retract (User (name ?name)))
   ;(exit)
)

; set initial facts

(deffacts SampleRecipes
    ; ... Existing recipes ...
    
    (Recipe 
        (name "Spaghetti Carbonara") 
        (cuisine "Italian") 
        (difficulty "Easy")
        (ingredients "spaghetti, eggs, bacon, Parmesan cheese") 
        (instructions "1. Cook spaghetti. 2. Fry bacon. 3. Mix eggs and cheese. 4. Toss with pasta.")
    )

    (Recipe 
        (name "Chicken Tikka Masala") 
        (cuisine "Indian") 
        (difficulty "Intermediate")
        (ingredients "chicken, yogurt, tomato sauce, spices") 
        (instructions "1. Marinate chicken. 2. Cook chicken. 3. Simmer in sauce.")
    )

    (Recipe 
        (name "Caesar Salad") 
        (cuisine "American") 
        (difficulty "Easy")
        (ingredients "romaine lettuce, croutons, Caesar dressing") 
        (instructions "1. Toss lettuce with dressing. 2. Add croutons.")
    )

    (Recipe 
        (name "Taco Salad") 
        (cuisine "Mexican") 
        (difficulty "Easy")
        (ingredients "ground beef, lettuce, tomatoes, cheese, taco seasoning") 
        (instructions "1. Cook beef with seasoning. 2. Toss with lettuce, tomatoes, and cheese.")
    )

    (Recipe 
        (name "Pad Thai") 
        (cuisine "Thai") 
        (difficulty "Intermediate")
        (ingredients "rice noodles, shrimp, tofu, peanuts, tamarind sauce") 
        (instructions "1. Stir-fry shrimp and tofu. 2. Toss with cooked noodles, peanuts, and sauce.")
    )

    (Recipe 
        (name "Coq au Vin") 
        (cuisine "French") 
        (difficulty "Difficult")
        (ingredients "chicken, red wine, mushrooms, onions, bacon") 
        (instructions "1. Marinate chicken in wine. 2. Cook with mushrooms, onions, and bacon.")
    )

    (Recipe 
        (name "Margherita Pizza") 
        (cuisine "Italian") 
        (difficulty "Easy")
        (ingredients "dough, tomatoes, mozzarella, basil") 
        (instructions "1. Roll out dough. 2. Add toppings. 3. Bake.")
    )

    (Recipe 
        (name "Chicken Biryani") 
        (cuisine "Indian") 
        (difficulty "Intermediate")
        (ingredients "chicken, rice, spices, saffron") 
        (instructions "1. Marinate chicken. 2. Cook rice. 3. Layer chicken and rice. 4. Cook.")
    )

    (Recipe 
        (name "Greek Salad") 
        (cuisine "Greek") 
        (difficulty "Easy")
        (ingredients "cucumber, tomatoes, olives, feta cheese, olive oil") 
        (instructions "1. Combine ingredients. 2. Drizzle with olive oil.")
    )

    (Recipe 
        (name "Egg Fried Rice") 
        (cuisine "Chinese") 
        (difficulty "Easy")
        (ingredients "rice, eggs, vegetables, soy sauce") 
        (instructions "1. Cook rice. 2. Scramble eggs. 3. Stir-fry with vegetables.")
    )

    (Recipe 
        (name "Veggie Burger") 
        (cuisine "Fast Food") 
        (difficulty "Easy")
        (ingredients "vegetarian patty, bun, lettuce, tomato") 
        (instructions "1. Grill patty. 2. Assemble burger.")
    )

    (Recipe 
        (name "Spinach and Artichoke Dip") 
        (cuisine "American") 
        (difficulty "Easy")
        (ingredients "spinach, artichokes, cream cheese, Parmesan cheese") 
        (instructions "1. Mix ingredients. 2. Bake until bubbly.")
    )

    (Recipe 
        (name "Stir-Fried Tofu") 
        (cuisine "Asian") 
        (difficulty "Intermediate")
        (ingredients "tofu, vegetables, soy sauce, ginger") 
        (instructions "1. Press tofu. 2. Stir-fry with vegetables.")
    )

    (Recipe 
        (name "Beef Wellington") 
        (cuisine "British") 
        (difficulty "Difficult")
        (ingredients "beef, puff pastry, mushrooms, foie gras") 
        (instructions "1. Wrap beef in pastry with mushroom and foie gras. 2. Bake.")
    )

    (Recipe 
        (name "Sushi Rolls") 
        (cuisine "Japanese") 
        (difficulty "Difficult")
        (ingredients "rice, fish, seaweed, vegetables") 
        (instructions "1. Roll ingredients in seaweed and rice. 2. Slice into rolls.")
    )
)
