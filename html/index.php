<h1> It works!!!... </h1>
<h3> Attempting MySQL connection from php... </h3>
<?php
$host = 'mysql';
$user = 'root';
$pass = 'rootpassword';
$conn = new mysqli($host, $user, $pass);

if ($conn->connect_error){
    die("Connection failed! " . $conn->connect_error);
}
echo "Connected to MySQL succesfully!";

phpinfo();

?>
