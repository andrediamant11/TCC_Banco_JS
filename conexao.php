<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sucos";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

$sabor_id = $_GET['sabor_id']; // Supondo que você esteja recebendo o ID do sabor via parâmetro na URL

// Aumentar a quantidade em 1
$sql_select = "SELECT Contagem FROM Contagem WHERE ID_Sabor = '$sabor_id'";
$result = mysqli_query($conn, $sql_select);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $quantidade_atual = $row['Contagem'];
    $quantidade_nova = $quantidade_atual + 1;

    // Atualizar a quantidade na tabela de Contagem
    $sql_update = "UPDATE Contagem SET Contagem = '$quantidade_nova' WHERE ID_Sabor = '$sabor_id'";
    if (mysqli_query($conn, $sql_update)) {
        echo "Quantidade de sabores atualizada com sucesso.";
    } else {
        echo "Erro ao atualizar a quantidade: " . mysqli_error($conn);
    }
} else {
    echo "Sabor não encontrado na contagem.";
}

mysqli_close($conn);

?>
