var mysql = require('mysql');
const { faker } = require('@faker-js/faker');
 

// Connect to database
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'username',     
  password : 'password',
  database : 'exercises_db'   
});


// View database
// var q = 'SELECT * FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// Count table entries
// var q = 'SELECT COUNT(*) AS total FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });

// Insert data into table users
// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };
// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//   if (err) throw err;
//   console.log(result);
// });

// ************** Insert multiple users **************
var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}

var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});


// Disconnect from database
connection.end();
