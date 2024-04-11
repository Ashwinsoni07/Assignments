-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema TicketBookingSystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TicketBookingSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TicketBookingSystem` DEFAULT CHARACTER SET utf8 ;
USE `TicketBookingSystem` ;

-- -----------------------------------------------------
-- Table `TicketBookingSystem`.`venue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketBookingSystem`.`venue` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venue_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketBookingSystem`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketBookingSystem`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(255) NOT NULL,
  `event_date` DATE NOT NULL,
  `event_time` TIME NULL,
  `total_seats` INT NULL,
  `ticket_price` DOUBLE NULL,
  `event_type` VARCHAR(255) NULL,
  `venue_id` INT NOT NULL,
  `available_seats` INT NULL,
  PRIMARY KEY (`id`, `venue_id`),
  INDEX `fk_event_venue_idx` (`venue_id` ASC) ,
  CONSTRAINT `fk_event_venue`
    FOREIGN KEY (`venue_id`)
    REFERENCES `TicketBookingSystem`.`venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketBookingSystem`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketBookingSystem`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `phone_number` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TicketBookingSystem`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TicketBookingSystem`.`booking` (
  `customer_id` INT NULL,
  `event_id` INT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_tickets` INT NULL,
  `total_cost` DOUBLE NULL,
  `booking_date` DATE NULL,
  INDEX `fk_customer_has_event_event1_idx` (`event_id` ASC) ,
  INDEX `fk_customer_has_event_customer1_idx` (`customer_id` ASC) ,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_customer_has_event_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `TicketBookingSystem`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `TicketBookingSystem`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

