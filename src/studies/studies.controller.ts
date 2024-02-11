import { Request, RequestHandler, Response } from 'express';
import { Study } from './studies.model';
import * as StudysDao from './studies.dao';
import { OkPacket } from 'mysql';



export const readStudies = async (req: Request, res: Response) => {

    try {

        let studies;
        let studyId = parseInt(req.query.studyId as string);

        console.log('studyId: ', studyId);

        studies = await StudysDao.readStudies();

        res.status(200).json(
            studies
        );

    } catch (error) {

        console.error('[studies.controller][readStudys][Error]: ', error);
        res.status(500).send({
            message: 'There was an error when fetching studies'
        });
    }

};


export const createStudy: RequestHandler = async (req: Request, res: Response) => {

    try {

        const okPacket: OkPacket = await StudysDao.createStudy(req.body);

        console.log('req.body: ', req.body);

        console.log(`study`, okPacket);



        res.status(200).json(
            okPacket
        );

    } catch (error) {

        console.error('[studies.controller][createStudy][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when creating study'
        });
    }
};

export const updateStudy: RequestHandler = async (req: Request, res: Response) => {

    try {
        const okPacket: OkPacket = await StudysDao.updateStudy(req.body);



        console.log('req.body: ', req.body);

        console.log(`study`, okPacket);



        res.status(200).json(
            okPacket
        );


    } catch (error) {
        console.error('[studies.controller][updateStudy][Error]: ', error);
        res.status(500).send({
            message: 'There was an error when updating study'
        });
    }

};

export const deleteStudy: RequestHandler = async (req: Request, res: Response) => {

    try {

        let studyId = parseInt(req.params.studyId as string);

        console.log('studyId', studyId);

        if (!Number.isNaN(studyId)) {

            const response = await StudysDao.deleteStudy(studyId);

            res.status(200).json(
                response
            );

        } else {
            throw new Error('Integer expected for studyId');
        }

    } catch (error) {

        console.error('[studies.controller][deleteStudy][Error]: ', error);
        res.status(500).json({
            message: 'There was an error when deleting study'
        });

    }

};