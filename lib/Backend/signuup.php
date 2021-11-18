<?php

require_once("dbconfig.php");

$email = $_POST["email"];
$password = $_POST["pass"];

$query = "SELECT * FROM signup WHERE email LIKE '$email'";
$res = mysql_query($con, $query);
$data = mysql_fetch_array($res);

if($data[0] >= 1)
{
    echo json_encode("account already exists");
}
else
{
    //create account
    $query = "INSERT INTO signup(email, password) VALUES ('$email', '$password')"
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