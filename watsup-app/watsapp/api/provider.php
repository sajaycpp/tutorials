<?php
//error_reporting(E_ALL ^ E_NOTICE); 
require_once('includes/dbConnect.php');
require_once('includes/functions.php');
//$_SESSION['us_id'] = 10001;


$sql = fetch_query($_REQUEST['subject']); 
$result = execute_query($sql, $conn);

echo stringify_result($result);
mysqli_close($conn);