def get_recipes_by_user(id)
    run_sql('SELECT * FROM recipes WHERE user_id = $1 ORDER BY name' , [id])
end

def like_recipe(user_id, recipe_id)
    run_sql('INSERT INTO likes(user_id, recipe_id) VALUES($1, $2)', [user_id, recipe_id])
end

def get_like_status(user_id, recipe_id)
    run_sql('SELECT * FROM likes WHERE user_id = $1 AND recipe_id = $2', [user_id, recipe_id])
end

def add_recipe_like(user_id, recipe_id)
    run_sql("INSERT INTO likes(user_id, recipe_id) VALUES($1, $2)", [user_id, recipe_id])
end

def delete_recipe_like(user_id, recipe_id)
    run_sql("DELETE FROM likes WHERE user_id = $1 AND recipe_id = $2", [user_id, recipe_id])
end

def get_liked_recipes(user_id)
    run_sql("SELECT * FROM likes INNER JOIN recipes ON recipes.id = likes.recipe_id WHERE likes.user_id = $1 ORDER BY name", [user_id])
end