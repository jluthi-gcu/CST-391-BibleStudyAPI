export const studentQueries = {

    readStudents: `
        SELECT student_id, first_name, last_name, email, phone
        FROM students
        `,
    createStudent: `
        INSERT INTO students (first_name, last_name, email, phone) VALUES (?, ?, ?, ?)
        `,
    updateStudent: `
        UPDATE students 
        SET first_name = ?, last_name = ?, email = ?, phone = ?
        WHERE student_id = ?
        `,
    deleteStudent: `
        DELETE FROM students 
        WHERE student_id = ?
       `,
}