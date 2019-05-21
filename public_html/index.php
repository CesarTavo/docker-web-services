<h1>LAMP!</h1>
<h4>INTENTANDO CONEXION BASE DE DATOS DESDE PHP...</h4><br>
<?php
$host = 'mysql';
$user = 'root';
$pass = 'rootpassword';
$dbname = "test";
$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
echo "Conexión exitosa!...";

$sql = "SELECT * FROM datos";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo " - Nombre: " . $row["nombre"]. " - Correo: " . $row["correo"]. "<br>";
    }
} else {
    echo "0 results";
}
?>
