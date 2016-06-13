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
   
$itemid = $_REQUEST['id'];

$user_check=$_SESSION['name'];
//$sql2 = "SELECT * FROM item WHERE ItemID = '$itemid'";
//$result2 = $conn->query($sql2);
//$row1 = $result1->fetch_assoc();
//while($row2 = $result2->fetch_assoc()){

//if ($row2["status"] === 'borrowed'){

$sql = "DELETE FROM borrow WHERE ItemID = '$itemid' ";
///'$sql = "SELECT * FROM item WHERE ItemName LIKE '%$keyword%'";

if ($conn->query($sql) === TRUE) {
    
	$sql5 = "UPDATE item SET status='available' WHERE ItemID='$itemid'";
	$result5 = $conn->query($sql5);
	echo "<div class='alertbox'>You've returned the book successfully!</div>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
//} 
//else { echo "<div class='alertbox'>Cannot borrow. Item is not available. <a href='search.php'>Search again</a></div>";}}

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