-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 07/04/2019 às 12:02
-- Versão do servidor: 5.5.57-0ubuntu0.14.04.1
-- Versão do PHP: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de dados: `hackathon`
--
CREATE DATABASE IF NOT EXISTS `hackathon` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hackathon`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aula`
--

DROP TABLE IF EXISTS `aula`;
CREATE TABLE IF NOT EXISTS `aula` (
  `cd_aula` int(11) NOT NULL AUTO_INCREMENT,
  `horas` decimal(8,2) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cursoPorto_id_porto` int(11) NOT NULL,
  PRIMARY KEY (`cd_aula`),
  KEY `fk_aula_cursoPorto1_idx` (`cursoPorto_id_porto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- RELACIONAMENTOS PARA TABELAS `aula`:
--   `cursoPorto_id_porto`
--       `cursoPorto` -> `id_porto`
--

--
-- Fazendo dump de dados para tabela `aula`
--

INSERT INTO `aula` (`cd_aula`, `horas`, `nome`, `cursoPorto_id_porto`) VALUES
(1, '2.00', 'Aula inicial', 1),
(2, '0.30', 'Aula 2', 1),
(5, '0.50', 'aula 3', 1),
(7, '0.50', 'aula 3', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursoPorto`
--

DROP TABLE IF EXISTS `cursoPorto`;
CREATE TABLE IF NOT EXISTS `cursoPorto` (
  `id_porto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `horas` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_porto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Fazendo dump de dados para tabela `cursoPorto`
--

INSERT INTO `cursoPorto` (`id_porto`, `nome`, `descricao`, `horas`) VALUES
(1, 'Conferencia de Container ', 'Curso voltado a aformar profissionais com conhecimento das normas e regras para conferencia de containers ', '30.00'),
(2, 'Robotica', 'robotica e robos louco', '12.00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_funcionarioCurso`
--

DROP TABLE IF EXISTS `item_funcionarioCurso`;
CREATE TABLE IF NOT EXISTS `item_funcionarioCurso` (
  `id_funcionarioCurso` int(11) NOT NULL AUTO_INCREMENT,
  `tb_funcionario_id_funcionario` int(11) NOT NULL,
  `tb_cursosProfissional_id_cursos` int(11) NOT NULL,
  PRIMARY KEY (`id_funcionarioCurso`),
  KEY `fk_item_funcionarioCurso_tb_funcionario1_idx` (`tb_funcionario_id_funcionario`),
  KEY `fk_item_funcionarioCurso_tb_cursosProfissional1_idx` (`tb_cursosProfissional_id_cursos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- RELACIONAMENTOS PARA TABELAS `item_funcionarioCurso`:
--   `tb_cursosProfissional_id_cursos`
--       `tb_cursosProfissional` -> `id_cursos`
--   `tb_funcionario_id_funcionario`
--       `tb_funcionario` -> `id_funcionario`
--

--
-- Fazendo dump de dados para tabela `item_funcionarioCurso`
--

INSERT INTO `item_funcionarioCurso` (`id_funcionarioCurso`, `tb_funcionario_id_funcionario`, `tb_cursosProfissional_id_cursos`) VALUES
(1, 1, 1),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pontuacao`
--

DROP TABLE IF EXISTS `pontuacao`;
CREATE TABLE IF NOT EXISTS `pontuacao` (
  `cd_ponrtuacao` int(11) NOT NULL AUTO_INCREMENT,
  `pontos` decimal(8,2) DEFAULT NULL,
  `tb_funcionario_id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`cd_ponrtuacao`),
  KEY `fk_pontuacao_tb_funcionario1_idx` (`tb_funcionario_id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- RELACIONAMENTOS PARA TABELAS `pontuacao`:
--   `tb_funcionario_id_funcionario`
--       `tb_funcionario` -> `id_funcionario`
--

--
-- Fazendo dump de dados para tabela `pontuacao`
--

INSERT INTO `pontuacao` (`cd_ponrtuacao`, `pontos`, `tb_funcionario_id_funcionario`) VALUES
(1, '100.00', 1),
(2, '50.00', 2),
(3, '25.00', 3),
(4, '75.00', 4),
(8, '0.00', 5),
(44, '0.00', 28),
(45, '0.00', 29),
(48, '0.00', 32),
(49, '0.00', 33),
(50, '0.00', 34),
(51, '0.00', 35),
(52, '0.00', 36),
(53, '0.00', 37);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_cursosProfissional`
--

DROP TABLE IF EXISTS `tb_cursosProfissional`;
CREATE TABLE IF NOT EXISTS `tb_cursosProfissional` (
  `id_cursos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `pontuacao` int(6) DEFAULT NULL,
  PRIMARY KEY (`id_cursos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Fazendo dump de dados para tabela `tb_cursosProfissional`
--

INSERT INTO `tb_cursosProfissional` (`id_cursos`, `nome`, `descricao`, `pontuacao`) VALUES
(1, 'Curso de operador de Guindaste', 'Curso que valida a atividade como operador de Guindaste', 1000),
(2, 'Operador de empilhaderia 1', 'Curso que valida a atividade como operador de empilhadeira 1', 25),
(3, 'Operador de empilhaderia 2', 'Curso que valida a atividade como operador de empilhadeira 2', 50),
(4, 'Operador de empilhaderia 3', 'Curso que valida a atividade como operador de empilhadeira 3', 100),
(5, 'Vistoriador de conteineres ', 'Curso voltado a aformar profissionais com conhecimento das normas e regras para conferencia de containers ', 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
CREATE TABLE IF NOT EXISTS `tb_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `senha` varchar(8) DEFAULT NULL,
  `registro` varchar(250) DEFAULT NULL,
  `cargo` varchar(250) DEFAULT NULL,
  `situacao` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Fazendo dump de dados para tabela `tb_funcionario`
--

INSERT INTO `tb_funcionario` (`id_funcionario`, `nome`, `email`, `senha`, `registro`, `cargo`, `situacao`) VALUES
(1, 'Rubens Sposito', 'rubensspositojr@gmail.com', '05081998', 'd3795d1', 'Operador de Guindaste ', 1),
(2, 'Bruno Feitoza', 'bruno.feitoza10@hotmail.com', '12345678', 'd3296152', 'Caminhoneiro', 1),
(3, 'Gustavo Lino', 'gustavolino0411@gmail.com', '11111111', 'd3795d1', 'Vistoriador', 1),
(4, 'Lucas ', 'lucas.1234@hotmail.com', '00000000', 'KJ23134223', 'Operador de Empilhadeira', 0),
(5, 'Joao', 'joao@gmail.com', '123', 'husdusduhsa', 'Gerente', 1),
(28, 'teste', 'teste', 'teste', 'teste', 'teste', 1),
(29, 'usfohusfdu', 'oisufghfsuigfd', 'osiufgfu', 'aosiudfgsudf', 'osiaugfaosiuf', 1),
(32, 'Bruno', 'bruno.feitoza10@hotmail.com', '123456', 'sfasafdsfsd', 'vamola', 1),
(33, 'sadfdsf', 'asfdsfasd', 'sfsdaf', 'asfsdf', 'sadf', 1),
(34, 'afsdfdsf', 'asfdsff', 'asdfdsf', 'asdfsdfds', 'asdfdsf', 1),
(35, 'ssferewr', 'rwerwrew', 'werewrwe', 'rwerew', 'rwerw', 1),
(36, 'asdsadsa', 'asdsadsa', 'asdsadsa', 'asdsadasd', 'asdsadas', 1),
(37, 'sdffs', 'sdfsdf', 'sdfsdf', 'sdfsdfd', 'sdfdsf', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_horaTrabalhada`
--

DROP TABLE IF EXISTS `tb_horaTrabalhada`;
CREATE TABLE IF NOT EXISTS `tb_horaTrabalhada` (
  `cd_horaTrabalhada` int(11) NOT NULL AUTO_INCREMENT,
  `horas` decimal(8,2) DEFAULT NULL,
  `tb_funcionario_id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`cd_horaTrabalhada`),
  KEY `fk_tb_horaTrabalhada_tb_funcionario_idx` (`tb_funcionario_id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- RELACIONAMENTOS PARA TABELAS `tb_horaTrabalhada`:
--   `tb_funcionario_id_funcionario`
--       `tb_funcionario` -> `id_funcionario`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itemCursoPorto`
--

DROP TABLE IF EXISTS `tb_itemCursoPorto`;
CREATE TABLE IF NOT EXISTS `tb_itemCursoPorto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_funcionario_id_funcionario` int(11) NOT NULL,
  `aula_cd_aula` int(11) NOT NULL,
  `status` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tb_item_tb_funcionario1_idx` (`tb_funcionario_id_funcionario`),
  KEY `fk_tb_item_aula1_idx` (`aula_cd_aula`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- RELACIONAMENTOS PARA TABELAS `tb_itemCursoPorto`:
--   `aula_cd_aula`
--       `aula` -> `cd_aula`
--   `tb_funcionario_id_funcionario`
--       `tb_funcionario` -> `id_funcionario`
--

--
-- Fazendo dump de dados para tabela `tb_itemCursoPorto`
--

INSERT INTO `tb_itemCursoPorto` (`id`, `tb_funcionario_id_funcionario`, `aula_cd_aula`, `status`) VALUES
(1, 3, 1, 'Mentor'),
(2, 1, 1, 'Aluno'),
(3, 1, 1, 'Aluno'),
(4, 1, 5, 'Mentor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_numerosTelefonicos`
--

DROP TABLE IF EXISTS `tb_numerosTelefonicos`;
CREATE TABLE IF NOT EXISTS `tb_numerosTelefonicos` (
  `id_contato` int(11) NOT NULL AUTO_INCREMENT,
  `telefones` varchar(15) DEFAULT NULL,
  `tb_funcionario_id_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`id_contato`),
  KEY `fk_tb_numerosTelefonicos_tb_funcionario1_idx` (`tb_funcionario_id_funcionario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- RELACIONAMENTOS PARA TABELAS `tb_numerosTelefonicos`:
--   `tb_funcionario_id_funcionario`
--       `tb_funcionario` -> `id_funcionario`
--

--
-- Fazendo dump de dados para tabela `tb_numerosTelefonicos`
--

INSERT INTO `tb_numerosTelefonicos` (`id_contato`, `telefones`, `tb_funcionario_id_funcionario`) VALUES
(1, '13988423324', 1);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_aula_cursoPorto1` FOREIGN KEY (`cursoPorto_id_porto`) REFERENCES `cursoPorto` (`id_porto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `item_funcionarioCurso`
--
ALTER TABLE `item_funcionarioCurso`
  ADD CONSTRAINT `fk_item_funcionarioCurso_tb_cursosProfissional1` FOREIGN KEY (`tb_cursosProfissional_id_cursos`) REFERENCES `tb_cursosProfissional` (`id_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_item_funcionarioCurso_tb_funcionario1` FOREIGN KEY (`tb_funcionario_id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `pontuacao`
--
ALTER TABLE `pontuacao`
  ADD CONSTRAINT `fk_pontuacao_tb_funcionario1` FOREIGN KEY (`tb_funcionario_id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_horaTrabalhada`
--
ALTER TABLE `tb_horaTrabalhada`
  ADD CONSTRAINT `fk_tb_horaTrabalhada_tb_funcionario` FOREIGN KEY (`tb_funcionario_id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_itemCursoPorto`
--
ALTER TABLE `tb_itemCursoPorto`
  ADD CONSTRAINT `fk_tb_item_aula1` FOREIGN KEY (`aula_cd_aula`) REFERENCES `aula` (`cd_aula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_item_tb_funcionario1` FOREIGN KEY (`tb_funcionario_id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tb_numerosTelefonicos`
--
ALTER TABLE `tb_numerosTelefonicos`
  ADD CONSTRAINT `fk_tb_numerosTelefonicos_tb_funcionario1` FOREIGN KEY (`tb_funcionario_id_funcionario`) REFERENCES `tb_funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
