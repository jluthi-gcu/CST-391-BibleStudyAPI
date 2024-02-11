-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



-- -----------------------------------------------------
-- Schema bible_study_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bible_study_db` ;
-- -----------------------------------------------------
-- Schema bible_study_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bible_study_db` DEFAULT CHARACTER SET utf8 ;


USE `bible_study_db` ;

-- -----------------------------------------------------
-- Table `bible_study_db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bible_study_db`.`students` (
  `student_id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bible_study_db`.`studies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bible_study_db`.`studies` (
  `study_id` INT(11) NOT NULL AUTO_INCREMENT,
  `study_name` VARCHAR(255) NOT NULL,
  `teacher_name` VARCHAR(255) NULL DEFAULT NULL,
  `max_enrollment_count` INT(11) NULL DEFAULT NULL,
  `start_date_time` DATE NULL DEFAULT NULL,
  `end_date_time` DATE NULL DEFAULT NULL,
  `room_number` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`study_id`),
  UNIQUE INDEX `unique_study_name` (`study_name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `bible_study_db`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bible_study_db`.`enrollment` (
  `enrollment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `student_id` INT(11) NOT NULL,
  `study_id` INT(11) NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `student_id` (`student_id` ASC),
  INDEX `study_id` (`study_id` ASC),
  CONSTRAINT `fk_student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `bible_study_db`.`students` (`student_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_id`
    FOREIGN KEY (`study_id`)
    REFERENCES `bible_study_db`.`studies` (`study_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8;

USE `bible_study_db` ;

-- -----------------------------------------------------
-- insert 25 studies
-- -----------------------------------------------------
INSERT INTO `studies` (`study_name`, `teacher_name`, `max_enrollment_count`, `start_date_time`, `end_date_time`, `room_number`) VALUES
('Genesis', 'John Smith', 20, '2024-02-10', '2024-04-15', 101),
('Exodus', 'Jane Johnson', 25, '2024-02-12', '2024-04-17', 102),
('Leviticus', 'David Brown', 15, '2024-02-15', '2024-04-20', 103),
('Numbers', 'Sarah Davis', 30, '2024-02-18', '2024-04-22', 104),
('Deuteronomy', 'Michael Wilson', 20, '2024-02-20', '2024-04-25', 105),
('Joshua', 'Emily Thompson', 25, '2024-02-22', '2024-04-28', 106),
('Judges', 'Daniel Lee', 15, '2024-02-25', '2024-05-01', 107),
('Ruth', 'Olivia Martinez', 30, '2024-02-28', '2024-05-04', 108),
('1 Samuel', 'William Adams', 20, '2024-03-01', '2024-05-07', 109),
('2 Samuel', 'Sophia Garcia', 25, '2024-03-03', '2024-05-10', 110),
('1 Kings', 'Benjamin Hernandez', 15, '2024-03-06', '2024-05-13', 111),
('2 Kings', 'Amelia King', 30, '2024-03-09', '2024-05-16', 112),
('Isaiah', 'Ethan Campbell', 20, '2024-03-12', '2024-05-19', 113),
('Jeremiah', 'Harper White', 25, '2024-03-15', '2024-05-22', 114),
('Ezekiel', 'Lucas Robinson', 15, '2024-03-18', '2024-05-25', 115),
('Daniel', 'Mia Young', 30, '2024-03-21', '2024-05-28', 116),
('Hosea', 'Alexander Thomas', 20, '2024-03-24', '2024-05-31', 117),
('Joel', 'Avery Moore', 25, '2024-03-27', '2024-06-03', 118),
('Amos', 'Jackson Hill', 15, '2024-03-30', '2024-06-06', 119),
('Obadiah', 'Madison Baker', 30, '2024-04-02', '2024-06-09', 120),
('Jonah', 'Sebastian Allen', 20, '2024-04-05', '2024-06-12', 121),
('Micah', 'Sofia Perez', 25, '2024-04-08', '2024-06-15', 122),
('Nahum', 'David Cooper', 15, '2024-04-11', '2024-06-18', 123),
('Habakkuk', 'Chloe Morris', 30, '2024-04-14', '2024-06-21', 124),
('Zephaniah', 'Logan Hall', 20, '2024-04-17', '2024-06-24', 125);


-- -----------------------------------------------------
-- insert 50 students
-- -----------------------------------------------------
INSERT INTO `students` (`first_name`, `last_name`, `email`, `phone`) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890'),
('Jane', 'Doe', 'jane.doe@example.com', '0987654321'),
('Alice', 'Smith', 'alice.smith@example.com', '5551234567'),
('Bob', 'Johnson', 'bob.johnson@example.com', '5559876543'),
('Emily', 'Brown', 'emily.brown@example.com', '5557891234'),
('Michael', 'Wilson', 'michael.wilson@example.com', '5554567890'),
('Emma', 'Martinez', 'emma.martinez@example.com', '5556543219'),
('Matthew', 'Anderson', 'matthew.anderson@example.com', '5553219876'),
('Olivia', 'Taylor', 'olivia.taylor@example.com', '5558887777'),
('William', 'Thomas', 'william.thomas@example.com', '5557778888'),
('Sophia', 'Hernandez', 'sophia.hernandez@example.com', '5556669999'),
('Daniel', 'Young', 'daniel.young@example.com', '5553332222'),
('Elizabeth', 'King', 'elizabeth.king@example.com', '5552223333'),
('James', 'Jones', 'james.jones@example.com', '5551114444'),
('Ella', 'White', 'ella.white@example.com', '5554445555'),
('Benjamin', 'Lee', 'benjamin.lee@example.com', '5557776666'),
('Ava', 'Scott', 'ava.scott@example.com', '5556661111'),
('Mason', 'Green', 'mason.green@example.com', '5559992222'),
('Charlotte', 'Hall', 'charlotte.hall@example.com', '5553335555'),
('Liam', 'Baker', 'liam.baker@example.com', '5552227777'),
('Amelia', 'Adams', 'amelia.adams@example.com', '5551113333'),
('Ethan', 'Nelson', 'ethan.nelson@example.com', '5554447777'),
('Harper', 'Hill', 'harper.hill@example.com', '5557773333'),
('Lucas', 'Ramirez', 'lucas.ramirez@example.com', '5556664444'),
('Mia', 'Campbell', 'mia.campbell@example.com', '5559995555'),
('Alexander', 'Mitchell', 'alexander.mitchell@example.com', '5553336666'),
('Avery', 'Roberts', 'avery.roberts@example.com', '5557771111'),
('Jackson', 'Carter', 'jackson.carter@example.com', '5556662222'),
('Madison', 'Turner', 'madison.turner@example.com', '5553337777'),
('Sebastian', 'Perez', 'sebastian.perez@example.com', '5557779999'),
('Sofia', 'Cooper', 'sofia.cooper@example.com', '5556667777'),
('David', 'Morris', 'david.morris@example.com', '5553338888'),
('Chloe', 'Murphy', 'chloe.murphy@example.com', '5557775555'),
('Logan', 'Ward', 'logan.ward@example.com', '5556663333'),
('Zoe', 'Peterson', 'zoe.peterson@example.com', '5553339999'),
('Joseph', 'Gonzalez', 'joseph.gonzalez@example.com', '5557774444'),
('Lily', 'Ross', 'lily.ross@example.com', '5556665555'),
('Samuel', 'Long', 'samuel.long@example.com', '5553332222'),
('Natalie', 'Flores', 'natalie.flores@example.com', '5557776666'),
('Henry', 'Reed', 'henry.reed@example.com', '5556669999'),
('Evelyn', 'Bailey', 'evelyn.bailey@example.com', '5553337777'),
('Gabriel', 'Harris', 'gabriel.harris@example.com', '5557773333'),
('Aria', 'Scott', 'aria.scott@example.com', '5556668888'),
('Andrew', 'Kim', 'andrew.kim@example.com', '5553334444'),
('Addison', 'Gomez', 'addison.gomez@example.com', '5557779999');

-- Display a message indicating completion
SELECT '50 students inserted successfully.';



-- -----------------------------------------------------
-- insert enrollments
-- -----------------------------------------------------
-- Create a temporary table to store random student and study IDs
CREATE TEMPORARY TABLE IF NOT EXISTS temp_enrollments (
    student_id INT,
    study_id INT
);

INSERT INTO temp_enrollments (student_id, study_id)
SELECT s.student_id, st.study_id
FROM (
    SELECT student_id, RAND() AS rnd_student
    FROM students
    ORDER BY rnd_student
    LIMIT 50
) AS s
CROSS JOIN (
    SELECT study_id, RAND() AS rnd_study
    FROM studies
    ORDER BY rnd_study
    LIMIT 50
) AS st;

INSERT INTO enrollment (student_id, study_id)
SELECT student_id, study_id
FROM temp_enrollments;

-- Drop the temporary table
DROP TEMPORARY TABLE IF EXISTS temp_enrollments;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
