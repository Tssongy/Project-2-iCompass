def create_assignment(user_id, class_name, role)

    run_sql("INSERT INTO assignments(user_id, class_name, role) VALUES($1, $2, $3)", [user_id, class_name, role])

end

def find_class_list_by_id(id)

    users = run_sql("SELECT users.id, users.first_name, users.last_name, assignments.class_name FROM users JOIN assignments ON users.id = assignments.user_id WHERE assignments.class_name = (SELECT class_name FROM assignments WHERE user_id = $1) AND assignments.role = 's'", [id]).to_a

end

def find_role_by_id(user_id)
    role = run_sql("SELECT role FROM assignments WHERE user_id = $1", [user_id]).to_a[0]['role']
end

