-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Out-2024 às 03:32
-- Versão do servidor: 10.4.25-MariaDB
-- versão do PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `batalhanaval`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compramoeda`
--

CREATE TABLE `compramoeda` (
  `ID_Compra` int(11) NOT NULL,
  `ID_Jogador` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `DataCompra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `ID_Jogador` int(11) NOT NULL,
  `Usuario` varchar(14) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Senha` varchar(45) NOT NULL,
  `Data` date NOT NULL,
  `TipoJogador` varchar(10) NOT NULL,
  `Moeda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`ID_Jogador`, `Usuario`, `Email`, `Senha`, `Data`, `TipoJogador`, `Moeda`) VALUES
(16, 'dsad', 'sads', 'd41d8cd98f00b204e9800998ecf8427e', '2024-10-14', '', 0),
(17, 'asd', 'asdf', 'd41d8cd98f00b204e9800998ecf8427e', '2024-10-14', '', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadorpartida`
--

CREATE TABLE `jogadorpartida` (
  `ID_JogadorPartida` int(11) NOT NULL,
  `ID_Jogador` int(11) NOT NULL,
  `ID_Partida` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogadorperks`
--

CREATE TABLE `jogadorperks` (
  `ID_JogadorPerks` int(11) NOT NULL,
  `ID_Jogador` int(11) NOT NULL,
  `ID_Perks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pacotemoeda`
--

CREATE TABLE `pacotemoeda` (
  `pacote` int(11) NOT NULL,
  `nome_pacote` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `qtd_moedas` int(11) NOT NULL,
  `oferta` tinyint(1) DEFAULT 0,
  `tipo_jogador` enum('pirata','marinha') NOT NULL,
  `moedas` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `partida`
--

CREATE TABLE `partida` (
  `ID_Partida` int(11) NOT NULL,
  `DataInicio` datetime NOT NULL,
  `DataFim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perks`
--

CREATE TABLE `perks` (
  `ID_perks` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `compramoeda`
--
ALTER TABLE `compramoeda`
  ADD PRIMARY KEY (`ID_Compra`),
  ADD KEY `ID_Jogador` (`ID_Jogador`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`ID_Jogador`);

--
-- Índices para tabela `jogadorpartida`
--
ALTER TABLE `jogadorpartida`
  ADD PRIMARY KEY (`ID_JogadorPartida`),
  ADD KEY `ID_Jogador` (`ID_Jogador`),
  ADD KEY `ID_Partida` (`ID_Partida`);

--
-- Índices para tabela `jogadorperks`
--
ALTER TABLE `jogadorperks`
  ADD PRIMARY KEY (`ID_JogadorPerks`),
  ADD KEY `ID_Jogador` (`ID_Jogador`),
  ADD KEY `ID_Perks` (`ID_Perks`);

--
-- Índices para tabela `pacotemoeda`
--
ALTER TABLE `pacotemoeda`
  ADD PRIMARY KEY (`pacote`);

--
-- Índices para tabela `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`ID_Partida`);

--
-- Índices para tabela `perks`
--
ALTER TABLE `perks`
  ADD PRIMARY KEY (`ID_perks`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compramoeda`
--
ALTER TABLE `compramoeda`
  MODIFY `ID_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `ID_Jogador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `jogadorpartida`
--
ALTER TABLE `jogadorpartida`
  MODIFY `ID_JogadorPartida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jogadorperks`
--
ALTER TABLE `jogadorperks`
  MODIFY `ID_JogadorPerks` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pacotemoeda`
--
ALTER TABLE `pacotemoeda`
  MODIFY `pacote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `partida`
--
ALTER TABLE `partida`
  MODIFY `ID_Partida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perks`
--
ALTER TABLE `perks`
  MODIFY `ID_perks` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compramoeda`
--
ALTER TABLE `compramoeda`
  ADD CONSTRAINT `compramoeda_ibfk_1` FOREIGN KEY (`ID_Jogador`) REFERENCES `jogador` (`ID_Jogador`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `jogadorpartida`
--
ALTER TABLE `jogadorpartida`
  ADD CONSTRAINT `jogadorpartida_ibfk_1` FOREIGN KEY (`ID_Jogador`) REFERENCES `jogador` (`ID_Jogador`) ON DELETE CASCADE,
  ADD CONSTRAINT `jogadorpartida_ibfk_2` FOREIGN KEY (`ID_Partida`) REFERENCES `partida` (`ID_Partida`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `jogadorperks`
--
ALTER TABLE `jogadorperks`
  ADD CONSTRAINT `jogadorperks_ibfk_1` FOREIGN KEY (`ID_Jogador`) REFERENCES `jogador` (`ID_Jogador`) ON DELETE CASCADE,
  ADD CONSTRAINT `jogadorperks_ibfk_2` FOREIGN KEY (`ID_Perks`) REFERENCES `perks` (`ID_perks`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DELIMITER $$

CREATE PROCEDURE VerificarEstatisticasJogador(
    IN jogador_id INT
)
BEGIN
    DECLARE v_partidas INT DEFAULT 0;
    DECLARE v_vitorias INT DEFAULT 0;
    DECLARE v_derrotas INT DEFAULT 0;
    DECLARE v_barcos_afundados INT DEFAULT 0;

    -- Contar o número total de partidas que o jogador participou
    SELECT COUNT(*)
    INTO v_partidas
    FROM JogadorPartida
    WHERE ID_Jogador = jogador_id;

    -- Contar o número de vitórias (assumindo que o Status seja 'Vitoria' para vitórias)
    SELECT COUNT(*)
    INTO v_vitorias
    FROM JogadorPartida
    WHERE ID_Jogador = jogador_id AND Status = 'Vitoria';

    -- Contar o número de derrotas (assumindo que o Status seja 'Derrota' para derrotas)
    SELECT COUNT(*)
    INTO v_derrotas
    FROM JogadorPartida
    WHERE ID_Jogador = jogador_id AND Status = 'Derrota';

    -- Obter a quantidade de barcos afundados do jogador na tabela 'jogador'
    SELECT BarcosAfundados
    INTO v_barcos_afundados
    FROM jogador
    WHERE ID_Jogador = jogador_id;

    -- Exibir os resultados
    SELECT 
        v_partidas AS Partidas_Participadas,
        v_vitorias AS Partidas_Ganhas,
        v_derrotas AS Partidas_Perdidas,
        v_barcos_afundados AS Barcos_Afundados;
END$$

DELIMITER ;
