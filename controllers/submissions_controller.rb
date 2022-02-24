post '/submissions/:student_id&:homework_id/update' do
    student_id = params['student_id']
    homework_id = params['homework_id']
    test = params['incorrect']
    test2 = params['correct']

    if params['incorrect'] == nil
        is_correct = true
    else
        is_correct = false
    end

    update_submission(student_id, homework_id, is_correct)
    redirect '/'
end
