get '/login/:role' do
    role = params["role"]

    erb :'sessions/new', locals: {
        role: role
    }
    
end

post '/sessions/:role' do
    email = params["email"]
    password = params["password"]
    role = params["role"]

    user = find_user_by_email(email)

    # using BCrypt to check that the user provided the correct password
    if user && BCrypt::Password.new(user['password_digest']) == password
        # log the user in
        session['user_id'] = user['id']
        redirect '/'
    else
        erb :'sessions/new', locals: {
            role: role
        }
    end
    
end

delete '/logout' do
    session['user_id'] = nil
    redirect '/'
end    