<?php
include('db.php');

// Get values from form 
$fname=$_POST['name'];
$lastname=$_POST['lastname'];
$phone=$_POST['phone'];
$type=$_POST['utype'];

// Insert data into mysql 
$sql="INSERT INTO user (Fname, Lname, Phone, UTypeID)VALUES('$fname', '$lastname', '$phone', '$type')";


if ($conn->query($sql) === TRUE) {
    echo "Successful";
	echo "<BR>";
	echo "<a href='addUsers.php'>Back to main page</a>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?> 
