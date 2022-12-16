def create_user(first_name, last_name, email, password, username)
    password_digest = BCrypt::Password.create(password)

    run_sql("INSERT INTO users(first_name, last_name, email, password_digest, username) VALUES($1, $2, $3, $4, $5)", [first_name, last_name, email, password_digest, username])
end

def find_user_by_email(email)
    users = run_sql('SELECT * FROM users WHERE email = $1', [email])

    # if more than one user is found with that email address, pick the first one with that eamail. Otherwise if noone is found, return nil.
    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def find_user_by_id(id)
    run_sql('SELECT * FROM users WHERE id = $1', [id])[0]
end