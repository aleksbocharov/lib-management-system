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
	
	include('db.php');
	session_start();
	if( isset($_SESSION["name"]) && $_SESSION["name"] )
	{include('header.php');}
	else
	{include('headerLimit.php');}
	?>
<!-- Start of Page Header -->

   <?php
   
//$keyword = isset($_POST["iname"]) ? $_POST["iname"] : null;

//user_check=$_SESSION['name'];
//$sql1 = "SELECT Fname, Lname FROM user WHERE name = '$user_check'";
//$result1 = $conn->query($sql1);
//$row1 = $result1->fetch_assoc();
//while($row1 = $result1->fetch_assoc()){
//echo "<div class='alertbox'>Welcome to FNU library, ".$row1["Fname"]." ".$row1["Lname"]." !</div>";
//}
//$conn->close();
echo "<div class='alertbox'>Welcome to FNU library!</div>";
?>

	<div id="main_content">

	<?php
	include('footer.php');
	?>

	<!-- End of Page Footer -->

</div>

</body>
</html>