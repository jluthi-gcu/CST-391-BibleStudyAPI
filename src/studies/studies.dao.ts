import { OkPacket } from "mysql";
import { execute } from "../services/mysql.connector";
import { Study } from "./studies.model";
import { studyQueries } from "./studies.queries";


export const readStudies = async () => {
    return execute<Study[]>(studyQueries.readStudies, []);
};

export const createStudy = async (study: Study) => {
    return execute<OkPacket>(studyQueries.createStudy,
        [study.study_name, study.teacher_name, study.max_enrollment_count, study.start_date_time, study.end_date_time, study.room_number]);
};

export const updateStudy = async (study: Study) => {
    return execute<OkPacket>(studyQueries.updateStudy,
        [study.study_name, study.teacher_name, study.max_enrollment_count, study.start_date_time, study.end_date_time, study.room_number, study.study_id]);
};

export const deleteStudy = async (studyId: number) => {
    return execute<OkPacket>(studyQueries.deleteStudy, [studyId]);
}
