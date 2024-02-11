import { Router } from 'express';
import * as StudiesController from './studies.controller';

const router = Router();
router.
    route('/studies').
    get(StudiesController.readStudies);

router.
    route('/studies').
    post(StudiesController.createStudy);

router.
    route('/studies').
    put(StudiesController.updateStudy);

router.
    route('/studies/:studyId').
    delete(StudiesController.deleteStudy);
    


export default router;