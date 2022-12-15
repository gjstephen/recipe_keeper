def get_recipes_by_user(id)
    run_sql('SELECT * FROM recipes WHERE user_id = $1 ORDER BY name' , [id])
end