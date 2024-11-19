<?php
try {
    include('conexao.php');
    $ID_USER = filter_var($_POST["ID_Jogador"], FILTER_SANITIZE_NUMBER_INT);
    $ID_PERK = filter_var($_POST["ID_Perk"], FILTER_SANITIZE_NUMBER_INT);
    // Chamar a procedure para obter estatísticas do jogador
    $queryPerks = "INSERT INTO jogadorperks (`ID_Jogador`, `ID_Perks`) VALUES (?, ?);";
    $stmtPerks = mysqli_prepare($conexao, $queryPerks);
    mysqli_stmt_bind_param($stmtPerks, "ii", $ID_USER, $ID_PERK);
    mysqli_stmt_execute($stmtPerks);

    // Obtendo os resultados da procedure
    $resultPerks = mysqli_stmt_get_result($stmtPerks);
 
    if ($resultPerks) {
       echo "Cadastrado Com sucesso!";
    }else{
        echo "Erro;";
    }
}catch (Exception $error) {
    // Retornando o erro em formato JSON
    echo json_encode([
        'status' => 'error',
        'message' => $error->getMessage()
    ]);
}