get '/' do
    if logged_in?
        class_list = find_class_list_by_id(session['user_id'])

        homework_list = find_homework_list_by_class(class_list[0]['class_name'])

        role = find_role_by_id(session['user_id'])
    else
        class_list = nil
    end

    erb :index, locals: {
        class_list: class_list,
        homework_list: homework_list,
        role: role
    }

end

get '/dashboard/:class_name/new' do
    class_name = params['class_name']
    erb :'dashboard/new', locals: {
        class_name: class_name
    }
end

post '/dashboard/:class_name' do
    title = params['title']
    description = params['description']
    assigned_class = params['class_name']

    create_homework(title, description, assigned_class)
    redirect '/'

end

get '/dashboard/:id/edit' do
    id = params['id']
    homework = find_homework_by_homework_id(id)

    erb :'dashboard/edit', locals: {
        homework: homework
    }

end

put '/dashboard/:id' do
    id = params['id']
    title = params['title']
    description = params['description']

    update_homework(id, title, description)
    redirect '/'

end

delete '/dashboard/:id' do
    id = params['id']
    delete_homework(id)
    redirect '/'
end