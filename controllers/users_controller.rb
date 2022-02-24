get '/users/:role' do
    role = params["role"]

    erb :'users/role', locals: {
        role: role
    }
end

get '/sign_up/:role' do
    role = params["role"]

    erb :'users/new', locals: {
        role: role
    }

end

post '/users/:role' do
    # Create user
    first_name = params['first_name']
    last_name = params['last_name']
    email = params['email']
    password = params['password']
    
    create_user(first_name, last_name, email, password)
    
    ## Assign user to class and role
    role = params['role']
    class_name = params['class_name']
    user_id = find_user_id_by_email(email)
    create_assignment(user_id, class_name, role)
    erb :'users/complete', locals: {
        role: role
    }
  
end
