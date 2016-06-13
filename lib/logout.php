<?php
session_start();
unset( $_SESSION );
session_destroy();
header("location: home.php");
        // *** The empty quotes do nothing
        // exit("");
        exit;
		
?>