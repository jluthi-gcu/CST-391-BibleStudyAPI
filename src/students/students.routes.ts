import { Router } from 'express';
import * as StudentsController from './students.controller';

const router = Router();
router.
    route('/students').
    get(StudentsController.readStudents);

router.
    route('/students').
    post(StudentsController.createStudent);

router.
    route('/students').
    put(StudentsController.updateStudent);

router.
    route('/students/:studentId').
    delete(StudentsController.deleteStudent);
    


export default router;