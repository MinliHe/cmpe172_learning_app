<?php

require_once("dbconfig.php");

$email = $_POST["email"];
$name = $_POST["name"];
$pass = $_POST["pass"];

$query = "SELECT * FROM login WHERE email LIKE '$email'";
$res = mysql_query($con, $query);
$data = mysql_fetch_array($res);

if($data[0] >= 1)
{
    echo json_encode("account already exists");
}
else
{
    //create account
    $query = "INSERT INTO login(email, name, pass) VALUES ('$email'. '$name', 'pass')"
    $res = mysql_query($con,$query)

    if($res)
    {
        echo json_encode("true");
    }
    else
    {
        echo json_encode("false");
    }
}


?>