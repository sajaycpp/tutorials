<?php
error_reporting(E_ALL ^ E_NOTICE); 
set_include_path('D:\xampp\htdocs\sajay\tut\php\tutorials\watsup-app\watsapp\api');
require_once('includes/dbConnect.php');
require_once('includes/functions.php');
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Watsapp</title>
  <base href="http://localhost/sajay/tut/php/tutorials/watsup-app/watsapp/dist/">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="favicon.ico">+

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  
</head>
<body>
  
  <app-root [userJsonData]="<?=userJsonData($conn)?>"></app-root>
</body>
</html>
- 