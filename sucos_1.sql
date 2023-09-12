-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 12/09/2023 às 12:37
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sucos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Contagem`
--

CREATE TABLE `Contagem` (
  `ID` int(11) NOT NULL,
  `ID_Sabor` int(11) DEFAULT NULL,
  `Contagem` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Contagem`
--

INSERT INTO `Contagem` (`ID`, `ID_Sabor`, `Contagem`) VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 0),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Sabor`
--

CREATE TABLE `Sabor` (
  `ID_Sabor` int(11) NOT NULL,
  `Sabor` varchar(25) NOT NULL,
  `Valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `Sabor`
--

INSERT INTO `Sabor` (`ID_Sabor`, `Sabor`, `Valor`) VALUES
(1, 'uva', 5),
(2, 'limao', 7),
(3, 'laranja', 7),
(4, 'abacaxi', 4);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Contagem`
--
ALTER TABLE `Contagem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Sabor` (`ID_Sabor`);

--
-- Índices de tabela `Sabor`
--
ALTER TABLE `Sabor`
  ADD PRIMARY KEY (`ID_Sabor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Contagem`
--
ALTER TABLE `Contagem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Sabor`
--
ALTER TABLE `Sabor`
  MODIFY `ID_Sabor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Contagem`
--
ALTER TABLE `Contagem`
  ADD CONSTRAINT `Contagem_ibfk_1` FOREIGN KEY (`ID_Sabor`) REFERENCES `Sabor` (`ID_Sabor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
