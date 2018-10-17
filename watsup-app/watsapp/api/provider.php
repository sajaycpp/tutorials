<?php
require_once('includes/dbConnect.php');
$_SESSION['us_id'] = 10001;

switch($_REQUEST['subject']){
	case "contacts":
					$sql = ["select" => ["SELECT * FROM user"]];
					break;
					
	case "messages":
					$sql = ["select" => [
					"SELECT user.u_id, name, 1 as count  FROM message, board_message, user where board_message.us_id = ". $_SESSION['us_id'] ." and board_message.mg_id=message.mg_id and user.u_id=message.sender_id"] 
					];
					break;
					
	case "messageFrom":
					$sql = ["select" => [
					"SELECT  thread  FROM message where message.sender_id = " . $_REQUEST['sender_id']] ];
					break;
					
	case "postMessage": 
					$sql = ["insert" => [
					"INSERT INTO message(sender_id, thread ) values('". $_SESSION['us_id'] ."','". $_REQUEST['thread']."') ",
					
					"INSERT INTO board_message(mg_id, us_id) values(LAST_INSERT_ID(), ". $_REQUEST['receiver_id'].")"] 
					];
					break;
					
	case "postMessagex": 
					$sql = ["select" => ["SELECT thread FROM message, board_message where sender_id=" . $_SESSION['us_id'] . "and us_id=" . $_REQUEST['sender_id']] 
					];
					
	default:

}

$result = '';
foreach( $sql as $key => $queryAry ){
	foreach( $queryAry as $query ){
		$result = $conn->query( $query );
	}
}
$jsonData = '';
if ($result->num_rows && $result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
	  $jsonData .= json_encode( $row ). ',';
    }
} else {
    echo "0 results";
}
echo '[' . substr( $jsonData, 0, -1). ']';
mysqli_close($conn);