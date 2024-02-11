import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { Student } from "./students.model";
import { studentQueries } from "./students.queries";


export const readStudents = async () => {
    return execute<Student[]>(studentQueries.readStudents, []);
};

export const createStudent = async (student: Student) => {
    return execute<OkPacket>(studentQueries.createStudent,
        [student.first_name, student.last_name, student.email, student.phone]);
};

export const updateStudent = async (student: Student) => {
    return execute<OkPacket>(studentQueries.updateStudent,
        [student.first_name, student.last_name, student.email, student.phone, student.student_id]);
};

export const deleteStudent = async (studentId: number) => {
    return execute<OkPacket>(studentQueries.deleteStudent, [studentId]);
}
