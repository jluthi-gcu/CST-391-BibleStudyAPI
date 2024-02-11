import express, { Request, Response} from 'express';
import helmet from 'helmet';
import cors from 'cors';
import logger from './middleware/logger.middleware';
import dotenv from 'dotenv';
import studiesRouter from './studies/studies.routes';
import studentsRouter from './students/students.routes';



// configure environment variables
dotenv.config();

// setup express app
const app = express();
// define the port to run the server on
const port = process.env.PORT;

// enable all CORS request
app.use(cors());

// Parse JSON bodies
app.use(express.json());
// Parse URL-encoded bodies
app.use(express.urlencoded({ extended: true }));

// adding set of security middleware
app.use(helmet());

console.log(process.env.MY_SQL_DB_HOST);


if (process.env.NODE_ENV == 'development') {
    // add logger middleware
    app.use(logger);
    console.log(process.env.GREETING + ' in dev mode');
}


// Application routes
// root route
app.get('/', (req: Request, res: Response) => {
    res.send('<h1>Welcome to the Bible Study API</h1>');
});

// adding router middleware
app.use('/', [studiesRouter, studentsRouter]);


// start the server with the defined port and a callback function
app.listen(port, () => {

    console.log(`BibleStudyAPI app listening at http://localhost:${port}`)
    
    });

