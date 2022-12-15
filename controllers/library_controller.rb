get '/recipes/created' do
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