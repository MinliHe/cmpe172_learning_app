<?php

$db_name = "cmpe172_Learning_app";
$db_user = "root";
$db_pass = "cmpe172";
$db_host = "localhost";

$con = new mysqli_connect($db_host, $db_user, $db_pass, $db_name);

if($con -> connect_error)
{
    die("Connection failed: ". $conn->connect_error);
}
else
{
    echo "Connected successfully";
}

?>