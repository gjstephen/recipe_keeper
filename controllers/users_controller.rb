get '/users/new' do
    erb :'users/new'
end

post '/users/new' do
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']
    password = params['password']
    confirm_password = params['confirm_password']
  
    if password == confirm_password

        if find_user_by_email(email) == nil
            create_user(first_name, last_name, email, password)

            redirect '/'
        else
            error_message = 'A user with that email already exists.'

            erb :'/users/sign_up_issue', locals: {
                error_message: error_message
            }
        end
    else
        error_message = 'Passwords did not match'

        erb :'/users/sign_up_issue', locals: {
            error_message: error_message
        }
    end
    
end