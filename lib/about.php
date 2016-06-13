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
 <h3>Fountain University offers library services to its staff and students.</h3>
</div>
	<div id="main_content">

	<?php
	include('footer.php');
	?>
	<!-- End of Page Footer -->

</div>

</body>
</html>