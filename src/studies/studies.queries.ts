export const studyQueries = {

    readStudies: `
        SELECT study_id, study_name, teacher_name, max_enrollment_count, start_date_time, end_date_time, room_number
        FROM studies
        `,
    createStudy: `
        INSERT INTO studies (study_name, teacher_name, max_enrollment_count, start_date_time, end_date_time, room_number) VALUES (?, ?, ?, ?, ?, ?)
        `,
    updateStudy: `
        UPDATE studies 
        SET study_name = ?, teacher_name = ?, max_enrollment_count = ?, start_date_time = ?, end_date_time = ?, room_number = ?
        WHERE study_id = ?
        `,
    deleteStudy: `
        DELETE FROM studies 
        WHERE study_id = ?
       `,
}