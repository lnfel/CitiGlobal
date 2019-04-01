<?php
$server = "127.0.0.1";
$dbName = "db_mango";
$user = "root";
$pass = "";
 
$conn = new mysqli($server, $user, $pass, $dbName);
 
if ($conn->connect_errno) {
    echo "Failed to connect to MySQL: ("
        . $conn->connect_errno 
        . ") "
        . $conn->connect_error;
}
 
$conn->set_charset("utf8");
?>