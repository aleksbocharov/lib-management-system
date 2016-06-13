<?php
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
require("db.php");
session_start();// Starting Session
// Storing Session
$user_check=$_SESSION['name'];
// SQL Query To Fetch Complete Information Of User
$querys=("select name from users where name='$user_check'");
$results = mysqli_query( $conn, $querys);
$row = mysqli_fetch_array($results);
$login_session =$row['username'];
if(!isset($login_session)){

header('Location: index.php'); // Redirecting To Home Page
}
?>