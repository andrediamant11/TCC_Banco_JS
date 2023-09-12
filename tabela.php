<?php
// Conexão com o banco de dados (substitua as credenciais conforme necessário)

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sucos";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

// Consulta SQL para obter os dados dos sucos
$sql = "SELECT Sabor.Sabor, Contagem.Contagem
        FROM Sabor
        LEFT JOIN Contagem ON Sabor.ID_Sabor = Contagem.ID_Sabor";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $sucos = array();
    while ($row = $result->fetch_assoc()) {
        $suco = array(
            "nome" => $row["Sabor"],
            "quantidade" => $row["Contagem"]
        );
        array_push($sucos, $suco);
    }
    // Converte o array em JSON
    $json = json_encode($sucos);
    echo $json;
} else {
    echo "Nenhum suco encontrado.";
}

// Fecha a conexão com o banco de dados
$conn->close();
?>
