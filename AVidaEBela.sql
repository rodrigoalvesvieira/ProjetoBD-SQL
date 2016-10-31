-- MySQL Script generated by MySQL Workbench
-- Tue Oct 18 04:01:56 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema avidaebela
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `avidaebela` ;

-- -----------------------------------------------------
-- Schema avidaebela
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `avidaebela` DEFAULT CHARACTER SET utf8 ;
USE `avidaebela` ;

-- -----------------------------------------------------
-- Table `avidaebela`.`Conta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Conta` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Conta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `duracao` INT NOT NULL,
  `numeroMesa` INT NOT NULL,
  `qtdClientes` INT NOT NULL,
  `criado_em` DATETIME NOT NULL DEFAULT now(),
  `atualizado_em` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Transacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Transacao` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Transacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `formaPagamento` ENUM('CREDITO', 'DEBITO', 'DINHEIRO') NOT NULL,
  `valor` DECIMAL(10,6) NOT NULL,
  `criado_em` DATETIME NOT NULL DEFAULT now(),
  `atualizado_em` DATETIME NOT NULL DEFAULT now(),
  `descricao` VARCHAR(255) NOT NULL,
  `saque` DECIMAL(10,6) NULL,
  `tipo` ENUM('PAGAMENTO_CONTA', 'DEPOSITO', 'RETIRADA') NOT NULL,
  `conta` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Transacao_Conta_idx` (`conta` ASC),
  CONSTRAINT `fk_Transacao_Conta`
    FOREIGN KEY (`conta`)
    REFERENCES `avidaebela`.`Conta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Produto` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(10,6) NOT NULL,
  `criado_em` DATETIME NOT NULL DEFAULT now(),
  `atualizado_em` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `observacao` VARCHAR(255) NOT NULL,
  `criado_em` DATETIME NOT NULL DEFAULT now(),
  `atualizado_em` DATETIME NOT NULL DEFAULT now(),
  `conta` INT NOT NULL,
  `produto` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pedido_Conta_idx` (`conta` ASC),
  INDEX `fk_Pedido_Produto_idx` (`produto` ASC),
  CONSTRAINT `fk_Pedido_Conta`
    FOREIGN KEY (`conta`)
    REFERENCES `avidaebela`.`Conta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Produto`
    FOREIGN KEY (`produto`)
    REFERENCES `avidaebela`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Estoque` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qtdItem` INT NOT NULL DEFAULT 0,
  `transacao` INT NOT NULL,
  `produto_id` INT NULL,
  PRIMARY KEY (`id`, `transacao`),
  INDEX `fk_Estoque_Transacao_idx` (`transacao` ASC),
  CONSTRAINT `fk_Estoque_Transacao`
    FOREIGN KEY (`transacao`)
    REFERENCES `avidaebela`.`Transacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Item` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `limiar` INT NOT NULL,
  `prazo_validade` DATETIME NULL,
  `criado_em` DATETIME NULL DEFAULT now(),
  `atualizado_em` DATETIME NULL DEFAULT now(),
  `estoque` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Item_Estoque_idx` (`estoque` ASC),
  CONSTRAINT `fk_Item_Estoque`
    FOREIGN KEY (`estoque`)
    REFERENCES `avidaebela`.`Estoque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL, -- TODO: HASH!
  `admin` BOOLEAN NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `avidaebela`.`Utilizacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Utilizacoes` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Utilizacoes` (
  `produto` INT NOT NULL,
  `estoque` INT NOT NULL,
  PRIMARY KEY (`produto`, `estoque`),
  INDEX `fk_Produto_has_Estoque_Estoque_idx` (`estoque` ASC),
  INDEX `fk_Produto_has_Estoque_Produto_idx` (`produto` ASC),
  CONSTRAINT `fk_Produto_has_Estoque_Produto`
    FOREIGN KEY (`produto`)
    REFERENCES `avidaebela`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Estoque_Estoque`
    FOREIGN KEY (`estoque`)
    REFERENCES `avidaebela`.`Estoque` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`Receitas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`Receitas` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`Receitas` (
  `produto` INT NOT NULL,
  `item` INT NOT NULL,
  PRIMARY KEY (`produto`, `item`),
  INDEX `fk_Produto_has_Item_Item1_idx` (`item` ASC),
  INDEX `fk_Produto_has_Item_Produto1_idx` (`produto` ASC),
  CONSTRAINT `fk_Produto_has_Item_Produto1`
    FOREIGN KEY (`produto`)
    REFERENCES `avidaebela`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Item_Item1`
    FOREIGN KEY (`item`)
    REFERENCES `avidaebela`.`Item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avidaebela`.`BaixasEstoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avidaebela`.`BaixasEstoque` ;

CREATE TABLE IF NOT EXISTS `avidaebela`.`BaixasEstoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto_id` INT NOT NULL,
  `criado_em` DATETIME NOT NULL DEFAULT NOW(),
  `qtdAtual` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

USE `avidaebela`;

DELIMITER $$

USE `avidaebela`$$
DROP TRIGGER IF EXISTS `avidaebela`.`Checar_Limiar_Estoque` $$
USE `avidaebela`$$
CREATE DEFINER = CURRENT_USER TRIGGER `avidaebela`.`Checar_Limiar_Estoque` AFTER UPDATE ON `Estoque`
FOR EACH ROW
BEGIN
	DECLARE `limiar` INT;
	SET `limiar` = 8;
	IF NEW.qtdItem <= `limiar` THEN
		-- Alertar sistema de baixa grave no estoque.
        INSERT INTO BaixasEstoque (produto_id) VALUES (NEW.produto_id);
	END IF;
END;$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
