get '/library/created' do
    if logged_in?
        recipes = get_recipes_by_user(session['user_id'])

        user = find_user_by_id(session['user_id'])

        erb :'library/created', locals: {
            recipes: recipes,
            user: user
        }

    else
        redirect '/sessions/new'
    end
end

post '/recipes/home/:id/likes' do
    id = params['id']
    user_id = session['user_id']

    if logged_in?
        recipe_id = id
        if is_liked?(user_id, recipe_id)
            delete_recipe_like(user_id, recipe_id)
            redirect '/'
        else
            add_recipe_like(user_id, recipe_id)
            redirect '/'
        end
        
    else
        redirect '/sessions/new'
    end
end