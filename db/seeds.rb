users_data = [
  {username: 'mike', email: 'mike@mike.com', password: 'mike'},
  {username: 'emily', email: 'emily@emily.com', password: 'emily'}
]

users_data.each {|user| User.create(user)}

categories_data = [
  {name: 'Brunch', user_id: 1},
  {name: 'Drinks', user_id: 1},
  {name: 'Dinner', user_id: 2}
]

categories_data.each {|category| Category.create(category)}

recipes_data = [
  {name: 'Avocado Toast',
    ingredients: '1 avocado, halved, pitted and peeled
    Whole grain or whole wheat bread
    1 clove garlic, peeled and sliced
    Extra-virgin olive oil
    Salt and pepper',
    instructions: '1. Toast bread.
    2. Rub sliced garlic clove on toast.
    3. Brush olive oil on toast.
    4. Mash and spread avocado on toast.
    5. Top with salt and pepper to taste.',
    category_id: 1},
  {name: 'Vegetable Omelette',
    ingredients: '2 or 3 eggs
    1-2 tablespoons milk
    Sliced cheese of your choice
    Sliced vegetables of your choice
    2 tablespoons extra-virgin olive oil
    Salt and pepper',
    instructions: '1. Combine eggs and milk and beat with fork until blended.
    2. Heat olive oil in small skillet over medium-high heat and add vegetables, sauteing until vegetables are golden brown.
    3. Grease a separate, larger skillet with cooking oil and preheat over medium heat.
    4. Add blended eggs to skillet and spread so that eggs line the entire pan; lower heat slightly and cook egg for 1 minute.
    5. Add sauteed vegetables and top with cheese.
    6. Fold omelette and cook for 2 minutes.
    7. Flip folded omelette over and cook for additional 1-2 minutes.
    8. Add salt and pepper to taste.',
    category_id: 1},
  {name: 'Manhattan',
    ingredients: '2 oz. rye whiskey,
    1 oz. sweet vermouth,
    3 dashes angostura bitters,
    Cocktail cherries',
    instructions: '1. Fill a mixing glass with ice.
    2. Add whiskey, sweet vermouth, and bitters.
    3. Stir for 90 seconds.
    4. Strain into a martini glass.
    5. Garnish with cherries.',
    category_id: 2},
  {name: 'Cosmopolitan',
    ingredients: '1-1/2 oz. vodka,
    1/2 oz. triple sec
    1/2 oz. fresh lime juice
    1 oz. Cranberry juice',
    instructions: '1. Fill a cocktail shaker with ice.
    2. Add ingredients.
    3. Shake well.
    4. Double strain into large cocktail glass.
    5. Garnish with lime wheel.',
    category_id: 2},
  {name: 'Grilled New York Strip',
    ingredients: '1 strip steak, 1 in. thick
    Cooking oil
    Salt and pepper or other seasoning to taste',
    instructions: '1. Preheat grill at high heat.
    2. Season steak.
    3. Coat grill with oil.
    4. Place steak on grill, grill over direct high heat for 4-5 minutes per side for medium-rare.
    5. Remove from grill. Let rest 5-10 minutes.',
    category_id: 3},
  {name: 'Summer Salad',
    ingredients: 'Arugula and baby spinich, rinsed and spun dry
    1/4 cup crumbled gorgonzola cheese
    1/2 cup strawberries, rinsed and sliced
    1/4 cup sliced unsalted almonds
    Extra virgin olive oil
    Balsamic vinegar',
    instructions: '1. Combine arugula, baby spinach, cheese, strawberries, and almonds
    2. Drizzle with olive oil and vinegar',
    category_id: 3},
  {name: 'Grilled Asparagus',
    ingredients: '1 bunch fresh asparagus, rinsed
    Extra virgin olive oil,
    Salt and pepper',
    instructions: '1. Preheat grill at medium heat
    2. Brush asparagus with olive oil and season with salt and pepper
    3. Grill over direct medium heat for about 5 minutes, until tender
    4. Add additional seasoning if desired',
    category_id: 3}
]

recipes_data.each {|recipe| Recipe.create(recipe)}
