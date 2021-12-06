var express =require("express");
var mysql=require("mysql");
var app=express();
var bodyParser=require("body-parser");

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static(__dirname+"/public"));


app.listen(3000, function(){
	console.log("Server running on 3000!");
});


var connection=mysql.createConnection(
{
	host:"localhost",
	user:"root",
	database:"join_us_db"
});


app.get("/", function(req,res){
	console.log("someone requested us.");
	var q="SELECT COUNT(*) AS 'Count' FROM users";
	connection.query(q, function(error, result, fields){
		if (error) throw error;
		//console.log(result[0].Count);
		//res.send(result[0]);
		res.render("home", {data:result[0].Count});
});


	
});


app.post("/register", function(req, res){
	var person={
		email:req.body.email
	};
	connection.query('INSERT INTO users SET ?', person, function(error, result){
		if (error) throw error;
		res.redirect("/");
	});
});



