def all_recipes
    run_sql('SELECT * FROM test_table')
end

def get_recipe(id)
    run_sql('SELECT * FROM recipes WHERE id = $1', [id])[0]
end

def update_recipe(id, name, image_url, rating, servings, time, source, category, ingredients, directions)
    run_sql('UPDATE recipes SET name = $2, image_url = $3, rating = $4, servings = $5, time = $6, source = $7, category = $8, ingredients = $9, directions = $10 WHERE id = $1', [id, name, image_url, rating, servings, time, source, category, ingredients, directions])
end

# def create_recipe(name, image_url, rating, servings, time, source, category, ingredients, directions)
#     run_sql('INSERT INTO recipes(name, image_url, rating, servings, time, source, category, ingredients, directions) VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)', [name, image_url, rating, servings, time, source, category, ingredients, directions])
# end

def create_recipe(name, image_url, servings, time, source, category, ingredients, directions)
    run_sql('INSERT INTO recipes(name, image_url, servings, time, source, category, ingredients, directions) VALUES($1, $2, $3, $4, $5, $6, $7, $8)', [name, image_url, servings, time, source, category, ingredients, directions])
end