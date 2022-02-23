def create_homework(title, description, assigned_class)
    run_sql("INSERT INTO homework(title, description, assigned_class) VALUES($1, $2, $3)", [title, description, assigned_class])
end

def find_homework_list_by_class(class_name)
    homework_list = run_sql("SELECT * FROM homework WHERE assigned_class = $1 ORDER BY id", [class_name]).to_a
end

def find_homework_by_homework_id(id)
    homework = run_sql("SELECT * FROM homework WHERE id = $1", [id]).to_a[0]
end    

def update_homework(id, title, description)
    run_sql("UPDATE homework SET title = $2, description = $3 WHERE id = $1", [id, title, description])
end

def delete_homework(id)
    run_sql("DELETE FROM homework WHERE id = $1", [id])
end
