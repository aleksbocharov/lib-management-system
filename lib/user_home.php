<?php
session_start();
//load and connect to MySQL database stuff
require("db.php");
 if (!$conn) {
        echo "<div>";
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
        echo "</div>";

        // *** what happens here, you let the script continue regardless of the error?
    }
$loggedIn = false;
$userName = isset($_POST["name"]) ? $_POST["name"] : null;
$userPass = isset($_POST["pass"]) ? $_POST["pass"] : null;

 if ($userName && $userPass )
    {
        // User Entered fields
        // *** This is dangerous, it is subject to sql injection, given you wrote this code in 2 days, i am sure you can find
        // plenty of info on sql injection and mysqli and improve it
        $query = "SELECT name FROM user WHERE name = '$userName' AND password = '$userPass'";// AND password = $userPass";

        $result = mysqli_query( $conn, $query);

        // *** Error checking, what if !$result? eg query is broken

        $row = mysqli_fetch_array($result);

        if(!$row){
            echo "<div>";
            echo "No existing user or wrong password.";
            echo "</div>";
        }
        else {
            // *** My PERSONAL preference is to use {} every where, it just makes it easier if you add  
            // code into the condition later
            $loggedIn = true;
        }
    }
	
	if ( !$loggedIn )
    {
        echo "NO!";
		echo $userName;
		echo $userPass;
    }
    else{
        echo "<div>";
        echo "You have been logged in as $userName!";
        echo "</div>";
        $_SESSION["name"] = $userName;
		header("location: listLoan.php");
    }
?> 