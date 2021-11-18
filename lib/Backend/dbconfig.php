<?php

$db_name = "id17962760_cmpe172_new";
$db_user = "id17962760_cmpe172user";
$db_pass = "8OjEJ4n>LfQB4#Ss";
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