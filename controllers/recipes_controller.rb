
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


# get '/' do
#     recipes = run_sql('SELECT * FROM test_table')

#     erb :'recipes/test', locals: {
#         recipes: recipes
#     }
# end

get '/recipes/:id/recipe' do
    id = params['id']

    recipe = get_recipe(id)

    # directions = directions_array_split(recipe['directions'])
    # ingredients = recipe['ingredients'].slice(1..-2).delete('"').split(',')

    erb :'recipes/recipe_detail', locals: {
        recipe: recipe,
        # directions: directions,
        # ingredients: ingredients
    }

end

get '/recipes/:id/edit' do
    id = params['id']
    
    tester = 'test'

    recipe = get_recipe(id)

    # directions = directions_array_split(recipe['directions'])
    # ingredients = recipe['ingredients'].slice(1..-2).delete('"').split(',')
    # ingredients = recipe['ingredients'].delete('"').split(',')

    erb :'recipes/edit', locals: {
        recipe: recipe,
        # directions: directions,
        # ingredients: ingredients,
        tester: tester
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
    # ingredients = params['ingredients'].split "\r\n"
    directions = params['directions']
    ingredients = params['ingredients']
    
    update_recipe(id, name, image_url, rating, servings, time, source, category, ingredients, directions)

    redirect "/recipes/#{id}/recipe"
end

# put '/recipes/:id' do
#     id = params['id']
#     ingredients = params['ingredients'].split "\r\n"
#     # directions = params['directions']

#     erb :'recipes/test', locals: {
#         ingredients: ingredients
#     }
# end

get '/recipes/new' do
    erb :'/recipes/new'
end

put '/recipes' do
    name = params['name']
    image_url = params['image_url']
    # rating = params['rating']
    category = params['category']
    servings = params['servings']
    time = params['time']
    source = params['source']
    directions = params['directions']
    ingredients = params['ingredients']
    
    create_recipe(name, image_url, servings, time, source, category, ingredients, directions)
    # create_recipe(name, image_url, rating, servings, time, source, category, ingredients, directions)

    redirect '/'
end