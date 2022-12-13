
# get '/' do
#     # result_list = HTTParty.get("https://api.spoonacular.com/recipes/complexSearch?apiKey=1f4dfb8913324d6c80613337e431a161&query=pasta =&number=10")['results']

#     # recipe_info = HTTParty.get("https://api.spoonacular.com/recipes/654928/information?apiKey=1f4dfb8913324d6c80613337e431a161")

#     id = 1
#     recipes = run_sql('SELECT *, ingredients[1] FROM test_table')
#     # ingredients = run_sql("SELECT ingredients[1] FROM test_table WHERE id=#{id}")
#     ingredients = []
#     ingredients.push(run_sql('SELECT ingredients[1] AS INGREDIENTS FROM test_table WHERE id=1')[0]['ingredients'])
#     ingredients.push(run_sql('SELECT ingredients[2] AS INGREDIENTS FROM test_table WHERE id=1')[0]['ingredients'])

#     erb :'recipes/index', locals: {
#         # result_list: result_list,
#         # recipe_info: recipe_info
#         recipes: recipes,
#         ingredients: ingredients
#     }
# end

get '/' do
    recipes = run_sql('SELECT * FROM recipes')

    erb :'recipes/index', locals: {
        recipes: recipes
    }
end

get '/recipes/:id/recipe' do
    id = params['id']

    recipe = get_recipe(id)

    erb :'recipes/recipe_detail', locals: {
        recipe: recipe
    }

end

get '/recipes/:id/edit' do
    id = params['id']

    recipe = get_recipe(id)

    erb :'recipes/edit', locals: {
        recipe: recipe
    }
end

put '/recipes/:id' do
    id = params['id']
    name = params['name']
    image_url = params['image_url']
    rating = params['rating']
    category = params['category']
    servings = params['servings']
    time = params['time']
    source = params['source']
    ingredients = params['ingredients']
    directions = params['directions']
    
    update_recipe(id, name, image_url, rating, servings, time, source, category, ingredients, directions)

    redirect "/recipes/#{id}/recipe"
end