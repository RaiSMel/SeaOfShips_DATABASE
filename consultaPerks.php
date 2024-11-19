<?php
try {
    include('conexao.php');
    $ID_USER = filter_var($_POST["ID_Jogador"], FILTER_SANITIZE_NUMBER_INT);
    $Retorno = [];
    // Chamar a procedure para obter estatísticas do jogador
    $queryPerks = "CALL GetPerksByJogador(?);";
    $stmtPerks = mysqli_prepare($conexao, $queryPerks);
    mysqli_stmt_bind_param($stmtPerks, "i", $ID_USER);
    mysqli_stmt_execute($stmtPerks);

    // Obtendo os resultados da procedure
    $resultPerks = mysqli_stmt_get_result($stmtPerks);
 
    if (mysqli_num_rows($resultPerks) > 0) {
        while ($linha = mysqli_fetch_assoc($resultPerks)) {
            $Retorno[] = $linha['ID_perks'];
        }
        echo implode(";", $Retorno);
    }else{
        echo "";
    }
}catch (Exception $error) {
    // Retornando o erro em formato JSON
    echo json_encode([
        'status' => 'error',
        'message' => $error->getMessage()
    ]);
}