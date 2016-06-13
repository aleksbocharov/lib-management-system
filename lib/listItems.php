<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>Graphic Design by www.maagraphics.com</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="pure-min.css" type="text/css" media="screen" />
</head>

<body>

<div id="container">
<?php
	include('header.php');
	include('db.php');
session_start();
	?>
<!-- Start of Page Header -->

   <?php
   
$keyword = isset($_POST["iname"]) ? $_POST["iname"] : null;

$user_check=$_SESSION['name'];
$sql1 = "SELECT Fname FROM user WHERE name = '$user_check'";
$result1 = $conn->query($sql1);
//$row1 = $result1->fetch_assoc();
while($row1 = $result1->fetch_assoc()){
echo "<h1>Feel free to browse our whole collection, ".$row1["Fname"].".</h1>";
}
$sql = "SELECT i.ItemID, i.ItemName, i.status, a.AuthorName, p.PublisherName, t.TopicName
FROM item i, author a, publisher p, topic t
WHERE ItemName LIKE '%$keyword%' AND i.AuthID=a.AuthID AND i.PubID=p.PubID AND i.TopicID=t.TopicID";
///'$sql = "SELECT * FROM item WHERE ItemName LIKE '%$keyword%'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table class='pure-table' style='width:80%; margin:auto auto 50px auto;'><tr><th>Item Name</th>
	<th>Author Name</th><th>Publisher</th><th>Topic</th><th>Status</th><th>Borrow</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
       echo "<tr><td>".$row["ItemName"]."</td><td>".$row["AuthorName"]."</td>
	   <td>".$row["PublisherName"]."</td><td>".$row["TopicName"]."</td><td>".$row["status"]."</td>
	   <td><a href='borrow.php?id=".$row["ItemID"]."'>Click to borrow</a></td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
	echo($conn->error);
}
$conn->close();
?>

	<div id="main_content">

	<?php
	include('footer.php');
	?>

	<!-- End of Page Footer -->

</div>

</body>
</html>