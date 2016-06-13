<?php
include('db.php');

$sql = "SELECT UserID, Fname, Lname FROM user";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>ID</th><th>Name</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>".$row["UserID"]."</td><td>".$row["Fname"]." ".$row["Lname"]."</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}

?>