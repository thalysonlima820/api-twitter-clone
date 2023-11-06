-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Nov-2023 às 15:17
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `twitter_clone`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tweet` varchar(140) NOT NULL,
  `data` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tweets`
--

INSERT INTO `tweets` (`id`, `id_usuario`, `tweet`, `data`) VALUES
(11, 22, 'ola eu sou thalyson eu odeio coisas e gosto de coisas ', '2023-10-14 12:45:02'),
(12, 23, 'ola thalyson, voce é um babaca por odiar coisas ', '2023-10-14 12:45:58'),
(13, 22, 'se fuder', '2023-10-14 12:46:21'),
(14, 24, 'oi, sou a nyvvya e gosto de borboleta\r\n', '2023-10-14 12:47:05'),
(15, 24, 'quando eu eu criaça eu colocava asas de borboleta e pulava de coisas alta achando que iria voar\r\n', '2023-10-14 12:47:34'),
(16, 22, 'kkkkk burra\r\n', '2023-10-14 12:47:55'),
(17, 25, 'ola e vao tomar no cu\r\n', '2023-10-14 12:48:56'),
(18, 23, 'que é isso pedro\r\n', '2023-10-14 12:49:27'),
(27, 26, 'poste por api', '2023-11-04 11:09:03'),
(28, 26, 'poste  pelo site', '2023-11-04 11:09:17'),
(29, 26, 'poste por api mas usando o metodo post', '2023-11-04 11:10:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(22, 'thalyson', 'thalysonlima820@gmail.com', '202cb962ac59075b964b07152d234b70'),
(23, 'joao', 'joao', '202cb962ac59075b964b07152d234b70'),
(24, 'nivia', 'nivia', '202cb962ac59075b964b07152d234b70'),
(25, 'pedro', 'pedro', '202cb962ac59075b964b07152d234b70'),
(26, 'tha', 'tha', 'c5e5b2a9aee71feb308ca4ecdd626746');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_seguidores`
--

CREATE TABLE `usuarios_seguidores` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_usuario_segindo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios_seguidores`
--

INSERT INTO `usuarios_seguidores` (`id`, `id_usuario`, `id_usuario_segindo`) VALUES
(17, 23, 22),
(18, 22, 23),
(19, 24, 22),
(20, 22, 24),
(21, 25, 22),
(22, 25, 23),
(23, 23, 25),
(24, 26, 22);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios_seguidores`
--
ALTER TABLE `usuarios_seguidores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `usuarios_seguidores`
--
ALTER TABLE `usuarios_seguidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
