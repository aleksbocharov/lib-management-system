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
	include('header.php');
	?>
<div class="normalbox">
<fieldset style="width:30%; margin:auto auto auto auto; padding:10px;"><legend>Search Items</legend> 


<form action="searchRes.php" method="post"> 
		    Item Name:<br /> 
		    <input type="text" name="iname" placeholder="Item name" /> 
		    <br />	
		    <input type="submit" value="Search" /> 
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