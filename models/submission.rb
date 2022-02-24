def record_submission(homework_id, student_id, answer)
    run_sql("INSERT INTO submissions(homework_id, student_id, answer) VALUES($1, $2, $3)", [homework_id, student_id, answer])
end

def find_submissions(homework_id)
    submissions = run_sql("SELECT * FROM submissions WHERE homework_id = $1", [homework_id]).to_a
end

def has_submitted?(student_id, homework_id)
    if run_sql("SELECT * FROM submissions WHERE student_id = $1 AND homework_id = $2", [student_id, homework_id]).to_a.count > 0
        return true
    else
        return false
    end
end

def find_answer_by_student_id(student_id, homework_id)
    run_sql("SELECT answer FROM submissions WHERE student_id = $1 AND homework_id = $2", [student_id, homework_id]).to_a[0]['answer']
end

def update_submission(student_id, homework_id, is_correct)
    run_sql("UPDATE submissions SET is_correct = $3 WHERE student_id = $1 AND homework_id = $2", [student_id, homework_id, is_correct])
end

def has_been_marked?(student_id, homework_id)
    if run_sql("SELECT is_correct FROM submissions WHERE student_id = $1 AND homework_id = $2", [student_id, homework_id]).to_a[0]['is_correct'] != nil
        return true
    else
        return false
    end
   
end

def display_mark(student_id, homework_id)
    if run_sql("SELECT is_correct FROM submissions WHERE student_id = $1 AND homework_id = $2", [student_id, homework_id]).to_a[0]['is_correct'] == 't'
        return 'correct'
    else
        return 'incorrect'
    end
end