<?php

define('HOST', 'localhost');
define('USUARIO', 'root');
define('SENHA', '');
define('DB', 'batalhanaval');

$conexao = mysqli_connect(HOST, USUARIO, SENHA, DB) or die ('Banco de dados off');

session_start();

?>