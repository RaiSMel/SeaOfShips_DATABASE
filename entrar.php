<?php
try {
    include('conexao.php');
    $email = filter_var($_POST["Email"], FILTER_SANITIZE_EMAIL);
    $senha = md5(filter_var($_POST["Senha"], FILTER_SANITIZE_STRING));

    $verificar_email = "SELECT * FROM jogador WHERE Email = ? AND Senha = ?;";
    $resVerificaEmail = mysqli_prepare($conexao, $verificar_email);
    mysqli_stmt_bind_param($resVerificaEmail, "ss", $email, $senha);
    mysqli_stmt_execute($resVerificaEmail);
    $resultado = mysqli_stmt_get_result($resVerificaEmail);

    if ($resultado && mysqli_num_rows($resultado) > 0) {
        // Obtendo as informações do usuário
        $usuario = mysqli_fetch_assoc($resultado);

        // Retornando as informações do usuário em formato JSON
        echo json_encode([
            'status' => 'success',
                 'ID' => $usuario['ID_Jogador'],
                'usuario' => $usuario['Usuario'],
                'email' => $usuario['Email'],
                'moeda' => $usuario['Moeda'],
                'tipoJogador' => $usuario['TipoJogador'],
                'dataCadastro' => $usuario['Data']

        ]);
    } else {
        // Retornando código de erro em caso de falha
        echo json_encode([
            'status' => 'error',
            'message' => 'Credenciais inválidas.'
        ]);
    }

    // Fechando a conexão
    mysqli_close($conexao);
} catch (Exception $error) {
    // Retornando o erro em formato JSON
    echo json_encode([
        'status' => 'error',
        'message' => $error->getMessage()
    ]);
}
