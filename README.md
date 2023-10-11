# Recipe Recommendation Using Clips
### Tugas Rekayasa Sistem Berbasis Pengetahuan (RSBP)

| Nama                  | NRP         |
| --------------------- | ----------- |
| Muhammad Daffa Harits | 5025211005  |
| Thalent Athalla Razzaq| 5025211101  |
| Keysa Anadea          | 5025211028  |

Kode yang kami buat merupakan modifikasi dari kode pada repository:
https://github.com/gsihaj5/CLIPS/blob/master/PersonalRecipeRecommendation/HowToRun.md

## Penjelasan Rule
- Rule VegetarianRecipe digunakan untuk merekomendasikan resep vegetarian
- Rule ini akan dijalankan jika user memilih vegetarian sebagai preferensi makanannya
- Rule ini akan mencari resep yang tidak mengandung daging
```
(defrule VegetarianRecipe
    (User (name ?name) (ingredient-preference "vegetarian"))
    (Recipe (name ?recipe) (ingredients ?ingredients))
    (test (not (str-index ?ingredients "meat")))
    =>
    (printout t ?name ", we recommend a vegetarian recipe: " ?recipe crlf)
)
```
- Rule FastFoodRecipe digunakan untuk merekomendasikan resep fast food
- Rule ini akan dijalankan jika user memilih fast food sebagai preferensi makanannya
- Rule ini akan mencari resep yang memiliki cuisine "Fast Food"
```
(defrule FastFoodRecipe
    (User (name ?name) (cuisine-preference "Fast Food"))
    (Recipe (name ?recipe) (cuisine "Fast Food"))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a fast food recipe: " ?recipe crlf)
)
```
- Rule CuisineSpecificRecipe digunakan untuk merekomendasikan resep dengan cuisine yang diinginkan user
- Rule ini akan dijalankan jika user memilih cuisine tertentu sebagai preferensi makanannya
- Rule ini akan mencari resep yang memiliki cuisine yang sama dengan cuisine yang diinginkan user
```
(defrule CuisineSpecificRecipe
    (User (name ?name) (cuisine-preference ?cuisine-pref))
    (Recipe (name ?recipe) (cuisine ?cuisine))
    (test (str-index ?cuisine ?cuisine-pref))
    =>
    (printout t "------------------------------------------" crlf)
    (printout t ?name ", we recommend a recipe with your preferred cuisine: " ?recipe crlf)
)
```
Ada beberapa rule lain yang kami tambahkan, seperti MexicanRecipe, ThaiRecipe, dll. Fungsi rule tersebut sama seperti FastFoodRecipe, hanya saja merekomendasikan makanan berbeda

## Tambahan Facts
Kami juga menambahkan beberapa facts recipe, sehingga seluruh facts recipe kami adalah:
```
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
```
