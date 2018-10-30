<?php

function fetchUserSession(){
	
	if( isset($_SESSION[user])  ){
		fetch_query('');
	}else{

	}
}

function fetch_query($identifier){
	
	switch($identifier){
		case "userSession":
						$sql = ["select" => ["SELECT * FROM user WHERE MOB='".getRequestData('mob')."'" ]];
						break;
						
		case "contacts":
						$sql = ["select" => ["SELECT * FROM user WHERE u_id != '" .getUserSessionData('id'). "'"]];
						break;
						
		case "messages":
						$sql = ["select" => [
						"SELECT user.u_id, name, 1 as count  FROM message, board_message, user where board_message.us_id = ". getUserSessionData('id') ." and board_message.mg_id=message.mg_id and user.u_id=message.sender_id"] 
						];
						break;
						
		case "messageFrom":
						$sql = ["select" => [
						"SELECT sender_id, us_id, thread FROM message, board_message where message.mg_id = board_message.mg_id and ( message.sender_id = '" .getUserSessionData('id'). "' and board_message.us_id = '" .getRequestData('sender_id'). "') or ( message.sender_id = '" .getRequestData('sender_id'). "' and board_message.us_id = '" .getUserSessionData('id'). "' )" ] 
						];
						break;
						
		case "postMessage": 
						$sql = ["insert" => [
						"INSERT INTO message(sender_id, thread ) values('". getUserSessionData('id') ."','".  getRequestData('thread')."') ",
						
						"INSERT INTO board_message(mg_id, us_id) values(LAST_INSERT_ID(), ". getRequestData('receiver_id') .")"] 
						];
						break;
						
		case "postMessagex": 
						$sql = ["select" => ["SELECT thread FROM message, board_message where sender_id=" . getUserSessionData('id') . "and us_id=" . getRequestData('sender_id') ] 
						];
						
		default:

	}
	return $sql;
}

function execute_query($sql, $conn){
	
	$result = '';
	foreach( $sql as $key => $queryAry ){
		foreach( $queryAry as $query ){ 
			$result = $conn->query( $query );
		}
	}
	//var_dump($result);
	return $result;
}

function stringify_result($result){
	$jsonData =  '';
	if ($result->num_rows && $result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
		  $jsonData .= json_encode( $row ). ',';
		}
	} else {
		return "";
	}
	return '[' . substr( $jsonData, 0, -1). ']';
}

function getRequestData($key){
	
	return isset($_REQUEST[$key]) ? $_REQUEST[$key] : '';
}

function initialise_session($conn){
	if ( session_status() == PHP_SESSION_NONE ) { 
		if ( getRequestData('mob') != '') { 
			$sql = fetch_query('userSession');
			$result = execute_query($sql, $conn);
			if ($result->num_rows && $result->num_rows > 0) {
				session_start();
				$_SESSION['user'] = array();
				while($row = $result->fetch_assoc()) {
				  
				$_SESSION['user']['name'] = $row['name'];
				$_SESSION['user']['mob'] = $row['mob'];
				$_SESSION['user']['id'] = $row['u_id'];
				$_SESSION['user']['email'] = $row['email'];
				$_SESSION['user']['profile_char'] = $row['profile_char'];
				}
			}
		}
	}
}

function getUserSessionData($key){
	
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	if( !isset($_SESSION['user']) ){
		return null;
	}
	$user = $_SESSION['user'];
	switch($key){
		case "mob": return $user[$key];
				break;
		case "name": return $user[$key];
				break;
		case "id": return $user[$key];
				break;
		case "email": return $user[$key];
				break;
		case "profile_char": return $user[$key];
				break;
		default: return $user;
				break;		
	}
}

function userJsonData($conn){
	initialise_session($conn);
	//var_dump($_SESSION['user']);
	$user = getUserSessionData('');
	if( !isset($user) ){
		return '{}';
	}
	return '{mob:"' . $user["mob"] . '", name:"' . $user["name"] . '", id:"' . $user["id"] . '", email:"' . $user["email"] . '", profile_char:"' . $user["profile_char"] . '"}';
}