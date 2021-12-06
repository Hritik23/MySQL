//This file is importing necessary packages, creating 500 fake data points,creating a connection with MySQL and then inserting these fake 500 data points into the users table. 

var mysql =require("mysql");
var faker = require("faker");


var data=[];
for (var i=0;i<500;i++)
	{
		///console.log("hello hritik");
		data.push([faker.internet.email(), faker.date.past()]);
	}


var connection=mysql.createConnection(
{
	host:'localhost',
	user: 'root',
	database:'join_us_db'
});

var q= "INSERT INTO users VALUES ?";

var end_result=connection.query(q,[data],  function(error, results, fields){
	if (error) throw error;
	console.log(results);
	
});
//console.log(end_result.sql); To see the insert statement feeding into MySQL
connection.end();