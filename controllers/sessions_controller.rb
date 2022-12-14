get '/sessions/new' do
    erb :'/sessions/new'
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)

    if user && BCrypt::Password.new(user['password_digest']) == password
        # log the user in
        # will only work if we enable :sessions in the main.rb
        session['user_id'] = user['id']
        
        redirect '/'
    else
        erb 
    end
end