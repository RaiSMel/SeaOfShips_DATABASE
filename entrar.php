<?php
try {
    include('conexao.php');
    $email = filter_var($_POST["Email"], FILTER_SANITIZE_EMAIL);
    $senha = md5(filter_var($_POST["Senha"], FILTER_SANITIZE_STRING));
    $verificar_email = "SELECT * FROM jogador WHERE Email = ? AND Senha = ?;";
    $resVerificaEmail = mysqli_prepare($conexao, $verificar_email);
    mysqli_stmt_bind_param($resVerificaEmail, "ss", $email, $senha);
    mysqli_stmt_execute(statement: $resVerificaEmail);
    $resultado = mysqli_stmt_get_result($resVerificaEmail);

    if ($jogadorId = mysqli_fetch_assoc($resultado)) 
    {
        echo $jogadorId["ID_Jogador"];
    } 
    
    else 
    {
        echo "-1";
    }

    mysqli_close($conexao);
} catch (Exception $error) {
    echo $error;
}
?>