import { Request, RequestHandler, Response } from 'express';
import { Student } from './students.model';
import * as StudentsDao from './students.dao';
import { OkPacket } from 'mysql';



export const readStudents = async (req: Request, res: Response) => {

    try {

        let students;
        let studentId = parseInt(req.query.studentId as string);

        console.log('studentId: ', studentId);

        students = await StudentsDao.readStudents();

        res.status(200).json(
            students
        );

    } catch (error) {

        console.error('[students.controller][readStudents][Error]: ', error);
        res.status(500).send({
            message: 'There was an error when fetching students'
        });
    }

};


export const createStudent: RequestHandler = async (req: Request, res: Response) => {

    try {

        const okPacket: OkPacket = await StudentsDao.createStudent(req.body);

        console.log('req.body: ', req.body);

        console.log(`student`, okPacket);



        res.status(200).json(
            okPacket
        );

    } catch (error) {

        console.error('[students.controller][createStudent][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating student'
        });
    }
};

export const updateStudent: RequestHandler = async (req: Request, res: Response) => {

    try {
        const okPacket: OkPacket = await StudentsDao.updateStudent(req.body);

        console.log('req.body: ', req.body);

        console.log(`student`, okPacket);



        res.status(200).json(
            okPacket
        );


    } catch (error) {
        console.error('[students.controller][updateStudent][Error]: ', error);
        res.status(500).send({
            message: 'There was an error when updating student'
        });
    }

};

export const deleteStudent: RequestHandler = async (req: Request, res: Response) => {

    try {

        let studentId = parseInt(req.params.studentId as string);

        console.log('studentId', studentId);

        if (!Number.isNaN(studentId)) {

            const response = await StudentsDao.deleteStudent(studentId);

            res.status(200).json(
                response
            );

        } else {
            throw new Error('Integer expected for studentId');
        }

    } catch (error) {

        console.error('[students.controller][deleteStudent][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when deleting student'
        });

    }

};