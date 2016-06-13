<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>Graphic Design by www.maagraphics.com</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>

<div id="container">

<!-- Start of Page Header -->

<?php
	session_start();
	if( isset($_SESSION["name"]) && $_SESSION["name"] )
	{include('header.php');}
	else
	{include('headerLimit.php');}
	?>
<div class="normalbox">
<fieldset style="width:30%; margin:auto auto auto auto; padding:10px;"><legend>LOG-IN HERE</legend> 


<form action="user_home.php" method="post"> 
		    Username:<br /> 
		    <input type="text" name="name" placeholder="name" /> 
		    <br /><br /> 
		    Password:<br /> 
		    <input type="password" name="pass" placeholder="pass" value="" /> 
		    <br /><br /> 
		    <input type="submit" value="Login" /> 
		</form> 
		</fieldset>
		</div>

	<div id="main_content">

	<?php
	include('footer.php');
	?>

	<!-- End of Page Footer -->

</div>

</body>
</html>