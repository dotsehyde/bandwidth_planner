const express = require('express');
const path = require("path");
const mysql = require('mysql2');
var bodyParser = require('body-parser')
const session = require('express-session');

//Database connection
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'bandwidth'
});

const app = express();
app.use(bodyParser.urlencoded({ extended: false }))
const port = 8888;

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static("."));
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
    secret: '**tyui22m0y62jd82j@#43#98.//>',
    resave: false,
    saveUninitialized: false,
}));

//Global state variables

app.get('/', (req, res) =>{
    let predData= req.session.predData||[];
    let planData= req.session.planData||[];
    return res.render('index',{predData,planData});
});

//get predict
app.get('/get-predict',(req,res)=>{
    var currentState = req.session.predData==undefined?1:req.session.predData.length+1;
conn.query(`SELECT *,(course_download+registration+submit_assign+video+online_exam+tutoring) as total FROM service WHERE id =${currentState}`
,(err,result)=>{
    if(err){
        console.error(err);
        return res.status(500).send({msg:err.message});
    }
    // tempPredData.push(result[0]); 
    req.session.predData= [...req.session.predData||[],result[0]];
    return res.redirect('/'); 
})
});
//get plan
app.get('/get-plan', (req, res) => {
    const {bandwidth} = req.query;
    var currentState = req.session.predData==undefined?0:req.session.predData.length-1;
    let predData = req.session.predData;
    //Temp variable to store planned values
    let planObj={}
    //Loop through predict values and calculate planned values
    for (const key of Object.keys(predData[currentState])) {
        planObj[key] = calculatePlanned(bandwidth,predData[currentState].total, predData[currentState][key]);
    }  
    planObj['bandwidth']= bandwidth
req.session.planData= [...req.session.planData||[],planObj];
    return res.redirect('/');
});

//Fn calculate bandwidth
function calculatePlanned(bandwidth,total,predValue){
   return Math.round((predValue/total)*bandwidth * 100) / 100;

}

app.get('/destroy', function(req, res) {
    req.session.planData=[];
    req.session.predData=[];
    console.log("called")
    res.status(200).send('ok');
});

//Connect to database
conn.connect((err)=>{
    if(err){
        console.error(`Error DB: ${err.message}`)
        return;
    }
    //Run server
    app.listen(port, () => console.log(`Application running on http://localhost:${port}`));
})