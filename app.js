const express = require ('express');
const mysql = require('mysql');

const bodyParser = require('body-parser');
const PORT = process.env.PORT || 3050;

const app = express();
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pruebatest'
});
app.use(bodyParser.json());
//route
app.get('/', (req, res) => {
    res.send('Welcome to my API');
});

//All data
app.get('/customers', (req, res) => {
    const cors = require('cors');
    app.use(cors({
        methods: ['Access-Control-Allow-Methods', '*', 'GET']
    }));

    const sql = 'SELECT * FROM customers';
    connection.query(sql, (error, results) => {
        if(error) throw error;
        if(results.lenght < 0){
            res.send('Not Result');
            }else{
                res.json(results);
            }
        });
});

//Get data id
app.get('/customers/:id', (req, res) => {
    const cors = require('cors');
    app.use(cors({
        methods: ['Access-Control-Allow-Methods', '*', 'GET']
    }));
    const {id} = req.params
    const sql = `SELECT * FROM customers WHERE id = ${id}`;
    connection.query(sql, (error, result) => {
        if(error) throw error;
        if(result.lenght < 0){
            res.send('Not Result');
            }else{
                res.json(result);
            }
        });
});

//post
app.post('/add', (req, res)=> {
    const cors = require('cors');
    app.use(cors({
        methods: ['Access-Control-Allow-Methods', '*', 'POST']
    }));
    const sql = 'INSERT INTO customers SET ?';

    const customerObj = {
        UserName: req.body.UserName,
        Date: req.body.Date,
        PunchIn: req.body.PunchIn,
        PunchOut: req.body.PunchOut
    };

    connection.query(sql, customerObj, error => {
        if (error) throw error;
        res.send('Customer Created');
    } );
});

//Update
app.put('/update/:id', (req, res) => {
    const cors = require('cors');
    app.use(cors({
        methods: ['Access-Control-Allow-Methods', '*', 'GET, PUT']
    }));
    const { id } = req.params;
    const { UserName, Date, PunchIn, PunchOut } = req.body;
    const sql = `UPDATE customers SET UserName = '${UserName}', Date = '${Date}', PunchIn = '${PunchIn}', PunchOut = '${PunchOut}'
    WHERE id = ${id}`;

    connection.query(sql, error => {
        if (error) throw error;
        res.send('Customer Update');
    } );
});

//Delete
app.delete('/delete/:id', (req, res)=> {
    const cors = require('cors');
    app.use(cors({
        methods: ['Access-Control-Allow-Methods', '*', 'DELETE']
    }));
    const { id } = req.params;
    const sql = `DELETE FROM customers WHERE id = ${id}`;
    connection.query(sql, error => {
        if (error) throw error;
        res.send('Delete customer');
    } );
});



connection.connect(error => {
    if (error) throw error;
    console.log('Database server running');
});

app.listen(PORT, ()=> console.log(`Server running on port ${PORT}`));






