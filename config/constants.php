<?php
session_start();
//Define frequent constant
define('APP_URL','http://localhost/product-ordering-system/');
define('LOCALHOST','localhost');
define('DB_USERNAME','root');
define('DB_PASSWORD','');
define('DB_NAME','nepal_yummies');

//Database Connection
$conn = mysqli_connect(LOCALHOST,DB_USERNAME,DB_PASSWORD,DB_NAME) or die(mysqli_error($conn));
?>