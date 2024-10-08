<?php

try{
    
    include('conexao.php');
    
    $usuario = filter_var($_POST['Usuario'], FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['Email'], FILTER_SANITIZE_EMAIL);
    $senha = filter_var($_POST['Senha'], FILTER_SANITIZE_STRING);
    $tipoJogador = filter_var($_POST['TipoJogador'], FILTER_SANITIZE_STRING);
    $verificar_email = "SELECT Email FROM jogador WHERE Email = ?;";
    $resVerificaEmail = mysqli_prepare($conexao, $verificar_email);
    $data = date('Y-m-d');
    mysqli_stmt_bind_param($resVerificaEmail, "s", $email);
    mysqli_stmt_execute($resVerificaEmail);
    $resultado = mysqli_stmt_get_result($resVerificaEmail);
    if(mysqli_num_rows($resultado) > 0 ){
            Echo 4;
    }
    else{
        $senha = md5($senha);
        $cadastro = "INSERT INTO `jogador` (`Usuario`,`Email`, `Senha` ,`Data`, `TipoJogador`) VALUES ('$usuario', '$email', '$senha', '$data', '$tipoJogador');";        
        $response = mysqli_query($conexao, $cadastro);
        if($response){
            Echo 0;
        }
        else{   
        Echo 1;
        }
    }

mysqli_close($conexao);
}catch(exception $e){
    Echo $e;
}


?>