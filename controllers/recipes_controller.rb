
get '/' do
    recipes = all_recipes()
    
    if logged_in?
        user = find_user_by_id(session['user_id'])
    end

    erb :'recipes/index', locals: {
        recipes: recipes,
        user: user
    }
end


get '/recipes/:id/recipe' do
    id = params['id']
    recipe = get_recipe(id)
    creator = find_user_by_id(recipe['user_id'])
    
    if logged_in?
        user = find_user_by_id(session['user_id'])
    end

    erb :'recipes/recipe_detail', locals: {
        recipe: recipe,
        user: user,
        creator: creator
    }
end

get '/recipes/:id/edit' do
    id = params['id']
    recipe = get_recipe(id)

    if logged_in?
        user = find_user_by_id(session['user_id'])
    end

    erb :'recipes/edit', locals: {
        recipe: recipe,
        user: user
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
    directions = params['directions']
    ingredients = params['ingredients']
    
    update_recipe(id, name, image_url, rating, servings, time, source, category, ingredients, directions)

    redirect "/recipes/#{id}/recipe"
end

get '/recipes/new' do
    
    if logged_in?
        user = find_user_by_id(session['user_id'])
    end

    erb :'/recipes/new', locals: {
        user: user
    }
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
    creator = session['user_id']
    
    create_recipe(name, image_url, servings, time, source, category, ingredients, directions, creator)

    redirect '/'
end

delete '/recipes/:id' do

    if !logged_in?
        redirect '/'
    end

    id = params['id']

    delete_recipe(id)

    redirect '/'
end