<?php
try {
    include('conexao.php');
    $ID_USER = filter_var($_POST["ID_Jogador"], FILTER_SANITIZE_NUMBER_INT);

    // Chamar a procedure para obter estatísticas do jogador
    $queryEstatisticas = "CALL VerificarEstatisticasJogador(?);";
    $stmtEstatisticas = mysqli_prepare($conexao, $queryEstatisticas);
    mysqli_stmt_bind_param($stmtEstatisticas, "i", $ID_USER);
    mysqli_stmt_execute($stmtEstatisticas);

    // Obtendo os resultados da procedure
    $resultEstatisticas = mysqli_stmt_get_result($stmtEstatisticas);
    $estatisticas = mysqli_fetch_assoc($resultEstatisticas);
    echo json_encode([
    'partidasParticipadas' => $estatisticas['Partidas_Participadas'],
    'partidasGanhas' => $estatisticas['Partidas_Ganhas'],
    'partidasPerdidas' => $estatisticas['Partidas_Perdidas'],
    'barcosAfundados' => $estatisticas['Barcos_Afundados']     
    ]);


}catch (Exception $error) {
    // Retornando o erro em formato JSON
    echo json_encode([
        'status' => 'error',
        'message' => $error->getMessage()
    ]);
}