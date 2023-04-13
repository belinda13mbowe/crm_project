-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 13, 2022 at 03:50 PM
-- Server version: 10.5.15-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u552102571_mkd`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `CaptureError` ()  BEGIN
	
	GET DIAGNOSTICS CONDITION 1 @a = MYSQL_ERRNO, @b = MESSAGE_TEXT;
	INSERT INTO tbl_errors (`code`,`message`) VALUES (@a, @b);
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_dini` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_dhehebu` INT, IN `param_ahadi` DECIMAL(16,2), OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_dini WHERE dini_phone = param_phone) THEN
			INSERT INTO `tbl_dini`
			(
				`dini_name`,
				`dini_phone`,
				`dini_dhehebu`,
				`dini_ahadi`,
				`dini_deni`
			)
			VALUES 
			(
				 param_name,
				 param_phone,
				 param_dhehebu,
				 param_ahadi,
				 param_ahadi
			);
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_institution` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_list` INT, IN `param_ahadi` DECIMAL(16,2), OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_institutions WHERE institution_phone = param_phone) THEN
			INSERT INTO `tbl_institutions`
			(
				`institution_name`,
				`institution_phone`,
				`institution_list`,
				`institution_ahadi`,
				`institution_deni`
			)
			VALUES 
			(
				 param_name,
				 param_phone,
				 param_list,
				 param_ahadi,
				 param_ahadi
			);
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_marafiki` (IN `param_name` VARCHAR(100), IN `param_phone` VARCHAR(20), IN `param_location` VARCHAR(80), IN `param_ahadi` DECIMAL(16,2), OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_marafiki WHERE rafiki_phone = param_phone) THEN
			INSERT INTO `tbl_marafiki`
			(
				`rafiki_name`,
				`rafiki_phone`,
				`rafiki_location`,
				`rafiki_ahadi`,
				`rafiki_deni`
			)
			VALUES 
			(
				 param_name,
				 param_phone,
				 param_location,
				 param_ahadi,
				 param_ahadi
			);
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_mikutano` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_location` VARCHAR(80), IN `param_type` INT, IN `param_ahadi` DECIMAL(16,2), OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_mikutano WHERE mkutano_phone = param_phone) THEN
			INSERT INTO `tbl_mikutano`
			(
				`mkutano_name`,
				`mkutano_phone`,
				`mkutano_location`,
				`mkutano_aina`,
				`mkutano_ahadi`,
				`mkutano_deni`
			)
			VALUES 
			(
				 param_name,
				 param_phone,
				 param_location,
				 param_type,
				 param_ahadi,
				 param_ahadi
			);
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_payments` (IN `param_pcat` INT, IN `param_mid` INT, IN `param_deni` DECIMAL(16,2), IN `param_amt` DECIMAL(16,2), IN `param_balance` DECIMAL(16,2), IN `param_paid` DECIMAL(16,2), IN `param_uid` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		INSERT INTO `tbl_payments`
			(
				`payment_date`,
				`payment_cat`,
				`payment_member`,
				`payment_debt`,
				`payment_amt`,
				`payment_balance`,
				`payment_add_uid`
			)
		VALUES 
			(
				 date(now()),
				 param_pcat,
				 param_mid,
				 param_deni,
				 param_amt,
				 param_balance,
				 param_uid
			);
			if (param_pcat = 1)then
				UPDATE tbl_wakazi SET mkazi_malipo = param_paid, mkazi_deni = param_balance, payment_status = 1 WHERE mkazi_id = param_mid;
			end if;
			
			IF (param_pcat = 2)THEN
				UPDATE tbl_marafiki SET rafiki_malipo = param_paid, rafiki_deni = param_balance, payment_status = 1 WHERE rafiki_id = param_mid;
			END IF;
			
			IF (param_pcat = 3)THEN
				UPDATE tbl_mikutano SET mkutano_malipo = param_paid, mkutano_deni = param_balance, payment_status = 1 WHERE mkutano_id = param_mid;
			END IF;
			
			IF (param_pcat = 4)THEN
				UPDATE tbl_dini SET dini_malipo = param_paid, dini_deni = param_balance, payment_status = 1 WHERE dini_id = param_mid;
			END IF;
			
			IF (param_pcat = 5)THEN
				UPDATE tbl_institutions SET institution_malipo = param_paid, institution_deni = param_balance, payment_status = 1 WHERE institution_id = param_mid;
			END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_user` (IN `param_role` INT, IN `param_name` VARCHAR(150), IN `param_email` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_add` VARCHAR(100), IN `param_pwd` TEXT, IN `param_uid` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
	
		IF NOT EXISTS (SELECT * FROM tbl_users WHERE user_email = param_email) THEN
			IF NOT EXISTS (SELECT * FROM tbl_users WHERE user_mobile = param_phone) THEN
				INSERT INTO `tbl_users`
				(
					`user_name`,
					`user_email`,
					`user_mobile`,
					`user_address`,
					`user_role_id`,
					`user_pwd`,
					`user_add_date`,
					`user_add_uid`
				)
				VALUES 
				(
					 param_name,
					 param_email,
					 param_phone,
					 param_add,
					 param_role,
					 param_pwd,
					 date(NOW()),
					 param_uid
				);
			ELSE	
				SET hold_code = 3;
				SET hold_sms  = 'this number is already been used by another user!';
			END IF;
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'this email is already been used by another user';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_add_wakazi` (IN `param_name` VARCHAR(100), IN `param_phone` VARCHAR(20), IN `param_zone` INT, IN `param_shina` INT, IN `param_monitor` INT, IN `param_ahadi` DECIMAL(16,2), OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_wakazi WHERE mkazi_phone = param_phone) THEN
			INSERT INTO `tbl_wakazi`
			(
				`mkazi_name`,
				`mkazi_phone`,
				`mkazi_zone`,
				`mkazi_shina`,
				`mkazi_monitor`,
				`mkazi_ahadi`,
				`mkazi_deni`
			)
			VALUES 
			(
				 param_name,
				 param_phone,
				 param_zone,
				 param_shina,
				 param_monitor,
				 param_ahadi,
				 param_ahadi
			);
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mkazi mwingine!';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_change_password` (IN `param_pwd` TEXT, IN `param_uid` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'An error occured! Please try again.';
		ROLLBACK;
		CALL CaptureError();
	END;
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms = 'Process failed! Please try again!';
		ROLLBACK;
	        CALL CaptureError();
	END;
	START TRANSACTION;
		UPDATE `tbl_users` SET user_pwd = param_pwd WHERE user_id = param_uid ;
	COMMIT;
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_dini` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_dhehebu` INT, IN `param_ahadi` DECIMAL(16,2), IN `param_payments` INT, IN `param_dini` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_dini WHERE dini_phone = param_phone and dini_id != param_dini) THEN
			IF (param_payments = 0) THEN
				UPDATE `tbl_dini` SET 
					`dini_name` = param_name,
					`dini_phone` = param_phone,
					`dini_dhehebu` = param_dhehebu,
					`dini_ahadi` = param_ahadi,
					`dini_deni` = param_ahadi
				WHERE dini_id = param_dini;
			else
				UPDATE `tbl_dini` SET 
					`dini_name` = param_name,
					`dini_phone` = param_phone,
					`dini_dhehebu` = param_dhehebu
				WHERE dini_id = param_dini;
			END IF;	
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_institution` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_list` INT, IN `param_ahadi` DECIMAL(16,2), IN `param_payments` INT, IN `param_institution` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_institutions WHERE institution_phone = param_phone and institution_id != param_institution) THEN
			IF (param_payments = 0) THEN
				UPDATE `tbl_institutions` SET 
					`institution_name` = param_name,
					`institution_phone` = param_phone,
					`institution_list` = param_list,
					`institution_ahadi` = param_ahadi,
					`institution_deni` = param_ahadi
				WHERE institution_id = param_institution;
			else
				UPDATE `tbl_institutions` SET 
					`institution_name` = param_name,
					`institution_phone` = param_phone,
					`institution_list` = param_list
				WHERE institution_id = param_institution;
			END IF;	
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_marafiki` (IN `param_name` VARCHAR(100), IN `param_phone` VARCHAR(20), IN `param_location` VARCHAR(80), IN `param_ahadi` DECIMAL(16,2), IN `param_payments` INT, IN `param_rafiki` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_marafiki WHERE rafiki_phone = param_phone and rafiki_id != param_rafiki) THEN
			IF (param_payments = 0) THEN
				UPDATE `tbl_marafiki` SET 
					`rafiki_name` = param_name,
					`rafiki_phone` = param_phone,
					`rafiki_location` = param_location,
					`rafiki_ahadi` = param_ahadi,
					`rafiki_deni` = param_ahadi
				WHERE rafiki_id = param_rafiki;
			else
				UPDATE `tbl_marafiki` SET 
					`rafiki_name` = param_name,
					`rafiki_phone` = param_phone,
					`rafiki_location` = param_location
				WHERE rafiki_id = param_rafiki;
			END IF;	
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_mikutano` (IN `param_name` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_location` VARCHAR(80), IN `param_type` INT, IN `param_ahadi` DECIMAL(16,2), IN `param_payments` INT, IN `param_mkutano` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_mikutano WHERE mkutano_phone = param_phone and mkutano_id != param_mkutano) THEN
			IF (param_payments = 0) THEN
				UPDATE `tbl_mikutano` SET 
					`mkutano_name` = param_name,
					`mkutano_phone` = param_phone,
					`mkutano_location` = param_location,
					`mkutano_aina` = param_type,
					`mkutano_ahadi` = param_ahadi,
					`mkutano_deni` = param_ahadi
				WHERE mkutano_id = param_mkutano;
			else
				UPDATE `tbl_mikutano` SET 
					`mkutano_name` = param_name,
					`mkutano_phone` = param_phone,
					`mkutano_location` = param_location,
					`mkutano_aina` = param_type
				WHERE mkutano_id = param_mkutano;
			END IF;	
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mtumiaji mwingine!';
		END IF;
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_user` (IN `param_role` INT, IN `param_name` VARCHAR(150), IN `param_email` VARCHAR(150), IN `param_phone` VARCHAR(20), IN `param_add` VARCHAR(100), IN `param_user` INT, IN `param_uid` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
	
		IF NOT EXISTS (SELECT * FROM tbl_users WHERE user_email = param_email and user_id != param_user) THEN
			IF NOT EXISTS (SELECT * FROM tbl_users WHERE user_mobile = param_phone AND user_id != param_user) THEN
				update `tbl_users` set 
					`user_name` = param_name,
					`user_email` = param_email,
					`user_mobile` = param_phone,
					`user_address` = param_add,
					`user_role_id` = param_role,
					`user_update_date` = date(NOW()),
					`user_update_uid` = param_uid
				
				where user_id = param_user;
			ELSE	
				SET hold_code = 3;
				SET hold_sms  = 'this number is already been used by another user!';
			END IF;
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'this email is already been used by another user';
		END IF;
	
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

CREATE DEFINER=`u552102571_snott`@`127.0.0.1` PROCEDURE `sp_update_wakazi` (IN `param_name` VARCHAR(100), IN `param_phone` VARCHAR(20), IN `param_zone` INT, IN `param_shina` INT, IN `param_monitor` INT, IN `param_ahadi` DECIMAL(16,2), IN `param_payments` INT, IN `param_mkazi` INT, OUT `param_code` TINYINT, OUT `param_sms` VARCHAR(100))  BEGIN
	DECLARE hold_code TINYINT DEFAULT 0;
	DECLARE hold_sms VARCHAR(100) DEFAULT 'Success';
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SET param_code = 2;
		SET param_sms  = 'Process failed.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	DECLARE EXIT HANDLER FOR SQLWARNING
	BEGIN
		SET param_code = 1;
		SET param_sms  = 'An error occured.';
		ROLLBACK;
		CALL CaptureError();
	END;
	
	START TRANSACTION;
		IF NOT EXISTS (SELECT * FROM tbl_wakazi WHERE mkazi_phone = param_phone and mkazi_id != param_mkazi) THEN
			IF (param_payments = 0) THEN
				UPDATE `tbl_wakazi` SET 
					`mkazi_name` = param_name,
					`mkazi_phone` = param_phone,
					`mkazi_zone` = param_zone,
					`mkazi_shina` = param_shina,
					`mkazi_monitor` = param_monitor,
					`mkazi_ahadi` = param_ahadi,
					`mkazi_deni` = param_ahadi
				WHERE mkazi_id = param_mkazi;
			else
				UPDATE `tbl_wakazi` SET 
					`mkazi_name` = param_name,
					`mkazi_phone` = param_phone,
					`mkazi_zone` = param_zone,
					`mkazi_shina` = param_shina,
					`mkazi_monitor` = param_monitor
				WHERE mkazi_id = param_mkazi;
			END IF;	
		ELSE	
			SET hold_code = 3;
			SET hold_sms  = 'namba hii tayari inatumika na mkazi mwingine!';
		END IF;
	COMMIT;
	
	SET param_code = hold_code;
	SET param_sms  = hold_sms;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` int(10) DEFAULT 0,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('07b1952ec9f53a6e805b176d66ba393c4116e30f', '66.249.74.117', 1652427182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323432373138323b),
('2876f749c6d1450c8c3ebd46a5cdc0cc7ad9fd3e', '54.184.150.112', 1652429534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323432393533343b),
('cc6e398fa5215e5ee55911443e2beda832637737', '34.222.92.14', 1652430020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303032303b),
('d09d20fb56699840cbe1be58bcd7acd45af4d8f4', '34.219.101.124', 1652430028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303032383b),
('3041bcdb0d2f70e52db0bab34e48c8678d5703e2', '54.186.30.186', 1652430037, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303033373b),
('62f056058e7a0567a1967e540bba6670e150b7b3', '52.40.154.141', 1652430039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303033393b),
('819fa16907b15d0d4358ed8e6a4350d836e265fb', '52.89.76.209', 1652430215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303231353b),
('21d7992dd9f47ab2f2a22c410633ae77d0efdc04', '54.187.4.236', 1652430239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303233393b),
('31316b702e864711035d0e5c358589840a1f31fb', '35.87.127.112', 1652430268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303236383b),
('2560bbbe761e7d4372ca27b3897b6238372e1ebd', '54.187.4.236', 1652430275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303237353b),
('7bd1f9d81e7116b298b4bec1dabd0e7575b96e4e', '52.89.76.209', 1652430284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303238343b),
('9136cbb1aeca4e734d7cec0b848996d8913721fe', '44.234.114.62', 1652430301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303330313b),
('98ae590781f74b83880c54ded222ba0847e71aaf', '34.213.8.97', 1652430309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303330393b),
('4a5919e2920eba8ec3fedb0e38627b781987493d', '54.185.135.171', 1652430312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303331323b),
('561d3bda2859637a6bcfb708e864571a21ae6380', '35.86.1.94', 1652430338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303333383b),
('562500353ad81dcd66798a093c570753a5d3ee48', '35.89.177.16', 1652430428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303432383b),
('fac62d53955d10317bdc91279a242fbbd7f33784', '54.148.235.185', 1652430809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323433303830393b),
('8ddf916bc13adbc2f9dec994af47822481b28870', '123.60.83.110', 1652444346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323434343334363b),
('94ae81b67c660f23039fd82db9735f71cf4d0cd2', '2a03:94e0:ffff:185:181:60:0:189', 1652454603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635323435343630333b);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dini`
--

CREATE TABLE `tbl_dini` (
  `dini_id` int(11) NOT NULL,
  `dini_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dini_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dini_dhehebu` int(11) DEFAULT NULL,
  `dini_ahadi` decimal(16,2) NOT NULL DEFAULT 0.00,
  `dini_malipo` decimal(16,2) DEFAULT 0.00,
  `dini_deni` decimal(16,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_errors`
--

CREATE TABLE `tbl_errors` (
  `id` int(11) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_errors`
--

INSERT INTO `tbl_errors` (`id`, `code`, `message`) VALUES
(1, 1054, 'Unknown column \'rafiki_name\' in \'field list\''),
(2, 1054, 'Unknown column \'mkazi_ahadi\' in \'field list\''),
(3, 1054, 'Unknown column \'rafiki_id\' in \'where clause\''),
(4, 1054, 'Unknown column \'user_add_date\' in \'field list\''),
(5, 1054, 'Unknown column \'institution_id\' in \'where clause\''),
(6, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(7, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(8, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(9, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(10, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(11, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(12, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(13, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(14, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(15, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(16, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(17, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(18, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(19, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(20, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\''),
(21, 1267, 'Illegal mix of collations (utf8mb4_general_ci,IMPLICIT) and (utf8mb4_unicode_ci,IMPLICIT) for operation \'=\'');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institutions`
--

CREATE TABLE `tbl_institutions` (
  `institution_id` int(11) NOT NULL,
  `institution_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution_list` int(11) DEFAULT NULL,
  `institution_ahadi` decimal(16,2) NOT NULL DEFAULT 0.00,
  `institution_malipo` decimal(16,2) DEFAULT 0.00,
  `institution_deni` decimal(16,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_institutions_list`
--

CREATE TABLE `tbl_institutions_list` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_institutions_list`
--

INSERT INTO `tbl_institutions_list` (`id`, `name`) VALUES
(1, 'NHIF'),
(2, 'LATRA'),
(3, 'TRA'),
(4, 'TARURA'),
(5, 'NHC');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_madhehebu`
--

CREATE TABLE `tbl_madhehebu` (
  `dhehebu_id` int(11) NOT NULL,
  `dhehebu_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_madhehebu`
--

INSERT INTO `tbl_madhehebu` (`dhehebu_id`, `dhehebu_name`) VALUES
(1, 'RC'),
(2, 'KKKT'),
(3, 'WAISLAMU'),
(4, 'WASABATO'),
(5, 'WABAHAI'),
(6, 'ECG'),
(7, 'PHID(TAG)'),
(8, 'EAGT(KWA MWAKITABA)'),
(9, 'POG(SUMMIT)'),
(10, 'VGMI(NJIA PANDA YA JESHI)'),
(11, 'EAGT(KANISA LA ROMA)'),
(12, 'CCL(KWA EDITHA)'),
(13, 'EAGT(MBEZI MADUKANI)'),
(14, 'EGT(LONDA)'),
(15, 'OVERCOMERS MINISTRY(MBUYUNI)');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_marafiki`
--

CREATE TABLE `tbl_marafiki` (
  `rafiki_id` int(11) NOT NULL,
  `rafiki_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rafiki_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rafiki_location` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rafiki_ahadi` decimal(16,2) NOT NULL DEFAULT 0.00,
  `rafiki_malipo` decimal(16,2) DEFAULT 0.00,
  `rafiki_deni` decimal(16,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_marafiki`
--

INSERT INTO `tbl_marafiki` (`rafiki_id`, `rafiki_name`, `rafiki_phone`, `rafiki_location`, `rafiki_ahadi`, `rafiki_malipo`, `rafiki_deni`, `payment_status`) VALUES
(1, 'MUNA SULTAN', '0754215412', 'MAREKANI', '330000.00', '330000.00', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mashina`
--

CREATE TABLE `tbl_mashina` (
  `id` int(11) NOT NULL,
  `name` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_mashina`
--

INSERT INTO `tbl_mashina` (`id`, `name`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_types`
--

CREATE TABLE `tbl_meeting_types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_meeting_types`
--

INSERT INTO `tbl_meeting_types` (`type_id`, `type_name`) VALUES
(1, 'Serekali'),
(2, 'Dini'),
(3, 'Binafsi'),
(4, 'Taasisi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mikutano`
--

CREATE TABLE `tbl_mikutano` (
  `mkutano_id` int(11) NOT NULL,
  `mkutano_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkutano_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkutano_location` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkutano_aina` int(11) DEFAULT NULL,
  `mkutano_ahadi` decimal(16,2) NOT NULL DEFAULT 0.00,
  `mkutano_malipo` decimal(16,2) DEFAULT 0.00,
  `mkutano_deni` decimal(16,2) NOT NULL DEFAULT 0.00,
  `payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monitors`
--

CREATE TABLE `tbl_monitors` (
  `monitor_id` int(11) NOT NULL,
  `monitor_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitor_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monitor_zone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_monitors`
--

INSERT INTO `tbl_monitors` (`monitor_id`, `monitor_name`, `monitor_phone`, `monitor_zone`) VALUES
(1, 'zone no.1', NULL, 1),
(2, 'zone no.2', NULL, 2),
(3, 'zone no.3', NULL, 3),
(4, 'zone no.4', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `payment_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_cat` int(11) DEFAULT NULL,
  `payment_member` int(11) DEFAULT NULL,
  `payment_debt` decimal(16,2) DEFAULT NULL,
  `payment_amt` decimal(16,2) DEFAULT NULL,
  `payment_balance` decimal(16,2) DEFAULT NULL,
  `payment_add_uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payments`
--

INSERT INTO `tbl_payments` (`payment_id`, `payment_date`, `payment_cat`, `payment_member`, `payment_debt`, `payment_amt`, `payment_balance`, `payment_add_uid`) VALUES
(1, '2022-05-04', 1, 2110, '300000.00', '300000.00', '0.00', 7),
(2, '2022-05-04', 1, 4489, '10000000.00', '1000000.00', '9000000.00', 7),
(3, '2022-05-09', 2, 1, '330000.00', '330000.00', '0.00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments_cats`
--

CREATE TABLE `tbl_payments_cats` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payments_cats`
--

INSERT INTO `tbl_payments_cats` (`cat_id`, `cat_name`) VALUES
(1, 'WAKAZI'),
(2, 'MARAFIKI'),
(3, 'MIKUTANO'),
(4, 'NYUMBA ZA DINI'),
(5, 'TAASISI');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_roles`
--

INSERT INTO `tbl_roles` (`role_id`, `role_name`, `role_desc`) VALUES
(1, 'Admin', 'system administrator'),
(2, 'User', 'normal user');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(80) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(80) COLLATE utf8_bin NOT NULL,
  `user_mobile` varchar(20) COLLATE utf8_bin NOT NULL,
  `user_address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_photo` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `user_pwd` text COLLATE utf8_bin NOT NULL,
  `user_status` tinyint(4) DEFAULT 0 COMMENT '0 offline,1 online, 2 idle',
  `user_domain` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `user_active` tinyint(1) DEFAULT 1,
  `user_add_date` date DEFAULT NULL,
  `user_add_uid` int(11) DEFAULT 0,
  `user_update_date` date DEFAULT NULL,
  `user_update_uid` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_name`, `user_email`, `user_mobile`, `user_address`, `user_role_id`, `user_photo`, `user_pwd`, `user_status`, `user_domain`, `user_active`, `user_add_date`, `user_add_uid`, `user_update_date`, `user_update_uid`) VALUES
(1, 'System Admin', 'admin@gmail.com', '0768788015', 'Makongo', 1, NULL, '$2y$10$WuC6hB3H0cD3IwOguxynYeoeOzl9TH6yU2tIwIya4Ttjjw3d7TNWC', 1, NULL, 1, NULL, 1, NULL, 1),
(6, 'Makongo Donation', 'belindambowe13@gmail.com', '0735652622', 'makongo', 1, NULL, '$2y$10$vXpJco4LJfvAE8RADg74z.Se9l3d3z.EUYzJYBFN07RgV1j7Bw3rC', 0, NULL, 1, '2022-04-26', 1, '2022-05-04', 7),
(7, 'John vedastius masimo', 'ashamasimo@gmail.com', '0718251923', 'makongo', 1, NULL, '$2y$10$76RuFLCA99c9Mdj1XeEYmu32eboKzRtZF13lonBd7K8bpR.tM.YXu', 0, NULL, 1, '2022-04-27', 6, NULL, 0),
(8, 'Bernard ntati Jacob', 'benardjacob2014@gmail.com', '0656329760', 'makongo', 1, NULL, '$2y$10$NcI9OA9bqvTYxuP3LZauGeHYFSgsuPl2N6eZnWMrnpuJlcvWcEP2O', 0, NULL, 1, '2022-04-27', 6, NULL, 0),
(9, 'Magdalena albert nachunga', 'magdalenaalbertnachunga@gmail.com', '0715908195', 'makongo', 1, NULL, '$2y$10$vNgd48anOco8Yd5Mn3EfY.5CmU1yyLnT/JzXBJiKFXqwLPzTSZI1.', 0, NULL, 1, '2022-04-27', 6, NULL, 0),
(10, 'Juma Shabani Massoro', 'juma.khatau@gmail.com', '0714427259', 'makongo', 1, NULL, '$2y$10$SdMJL//uPOtAfOKWIP07mebwXl7TGhfYWpuF33iV5tNdNBfblnnpK', 0, NULL, 1, '2022-04-27', 6, '2022-05-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wakazi`
--

CREATE TABLE `tbl_wakazi` (
  `mkazi_id` int(11) NOT NULL,
  `mkazi_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkazi_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mkazi_zone` int(150) DEFAULT NULL,
  `mkazi_shina` int(11) DEFAULT NULL,
  `mkazi_ahadi` decimal(16,2) NOT NULL DEFAULT 0.00,
  `mkazi_malipo` decimal(16,2) DEFAULT 0.00,
  `mkazi_deni` decimal(16,2) NOT NULL DEFAULT 0.00,
  `mkazi_monitor` int(11) DEFAULT NULL,
  `payment_status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_wakazi`
--

INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(1, 'ERNEST MGUMBU', '255685983533', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(2, 'MARYSTELLAH KIBANO', '255686112902', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(3, 'ERNEST ERNEST', '255686109618', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(4, 'RESTUTA KIBANO', '255783524324', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(5, 'MARYSTELLAH KIBANO', '255693218319', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(6, 'MARIA SUWI', '255787007557', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(7, 'HILDA CHARLES MIHO', '255755641138', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(8, 'SAMWEL MWAYI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(9, 'ALOYCE MBATA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(10, 'MONICA MWAMBOLA', '255699508255', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(11, 'LIZZY AZIGARD SHEMNDOLWA', '255767460149', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(12, 'ELIZABETH MWAMBENJA', '255718494025', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(13, 'AZIGARD SHEMNDOLWA', '255784895044', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(14, 'SAMWEL GOMBA', '255684655928', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(15, 'RATINES SAMWEL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(16, 'JANE PAUL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(17, 'TEDY NJOWOKE', '255689169228', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(18, 'ELISHA LONGO', '255689169416', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(19, 'SEFFU YAHYA', '255714678579', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(20, 'MUNIRA RASHID', '255652712672', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(21, 'HABIBA RAMADHANI', '255658498488', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(22, 'PETER ROBERT', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(23, 'NEEMA MUSSA', '255677762084', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(24, 'ALBETO GAMA', '255754217456', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(25, 'NEEMA J MBAWALA', '255679043672', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(26, 'AIDA  CHAULA', '255652909662', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(27, 'IBRAHIM SAID', '255652909796', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(28, 'ANITA MWAKIDESILE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(29, 'ISSA SAID', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(30, 'EMMANUEL NCHILU DAMAS', '255686093560', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(31, 'CHRISTINA VENANCE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(32, 'FRANK NGELAGWA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(33, 'AMINA RAJABU', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(34, 'SIRAJI MUSA', '255788727371', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(35, 'HAMID ISMAIL', '255652713281', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(36, 'YOHANA MBOOJE', '255692621395', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(37, 'SOPHIA G ', '255717644196', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(38, 'SAIDI ALLY FUMITO', '255682939575', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(39, 'MWAJUMA IDI BAKARI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(40, 'RIGOBERT PATRICK ALMASI', '255788686527', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(41, 'SHABAN HASSAN', '255718402554', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(42, 'ANNA FLUGENCE', '255789747931', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(43, 'ISMAIL HASSAN', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(44, 'FATINA SHABAN', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(45, 'MOHAMED ISMAIL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(46, 'IMRAN ISMAIL', '255686984728', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(47, 'PETER MAMBOSHA MUNISHI', '255687753209', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(48, 'JONAS NESTORY MBATA RACHI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(49, 'ZEFORA MALICK', '255787960238', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(50, 'GLORY ERICK', '255683476689', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(51, 'ANGEL POMONI', '255682322402', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(52, 'EMMANUEL SAMUEL', '255685603559', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(53, 'ALPHONCE ROGASIAN', '255682415894', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(54, 'ROGASIAN DORGAN MABIRIKA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(55, 'VICENT ROGASIAN ', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(56, 'JOSEPH ROGASIAN', '255693202692', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(57, 'JEMA JOHN MTINANGI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(58, 'NASTIRA SAID MUSHI', '255624914760', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(59, 'SAID HUSSEIN MUSHI', '255653481348', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(60, 'MAHADIA OMARY MTIULA', '255753562513', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(61, 'NURDIN OMARY MTIULA', '255623211359', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(62, 'GEORGE B SAKUVEDA', '255687944031', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(63, 'SELINA KALISTI KIMARIO', '255782962535', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(64, 'YASINI NDIMBE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(65, 'AMINA HASANI', '255787634889', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(66, 'DAVID DOMONICK PESA', '255712118225', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(67, 'FILBERTHA JOAKIM IGNAO', '255712118225', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(68, 'RAINFRIDA DAVID PESA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(69, 'JULIETH DAVID PESA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(70, 'KASUGURI EMANERI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(71, 'BLANDINA MAKOBA', '255692787817', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(72, 'LUCY S KONGE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(73, 'JEREMIAH S KONGE', '255789023131', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(74, 'YUSTA KANUTI', '255768369547', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(75, 'JUMA MSIGALA', '255756566100', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(76, 'DOMINIC KIFARU', '255719053352', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(77, 'JUDITH NGONYANI', '255758152496', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(78, 'CHARLES JUMA', '255787735935', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(79, 'EZEKIEL EZA TUMZA', '255787352472', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(80, 'GETRUDA PAUL GUCA', '255787352472', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(81, 'YUDESI ISSAYA KILENZA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(82, 'ACKSANTO JEMES LUSHISHI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(83, 'MWAJUMA RAJABU', '255766098081', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(84, 'GERALD KURUTA MASABA', '255689811904', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(85, 'YASINTA ALEX BULEGU', '255689616880', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(86, 'PIALLESI STANLEY MKONAYA', '255625639800', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(87, 'PRAYGOD EXAUD MMARY', '255718032189', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(88, 'ROSE CHRISOSTOM NGASOMA', '255743336714', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(89, 'SAID SIRAJU NGUKU', '255715303909', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(90, 'JENNIFER PASCHACY', '255623032346', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(91, 'EMILY MARIUS', '255659488117', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(92, 'GODWIN WARANTSE', '255783972739', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(93, 'SANTINA PIUSI', '255699523139', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(94, 'DAVID FRANK', '255677650865', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(95, 'JUMA SAIDI', '255625486602', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(96, 'FAIDHA AKIDA MWIKONI', '255687274228', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(97, 'DIANA CHARLS MABONESHO', '255743157218', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(98, 'PAULO THOMASI', '255677586342', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(99, 'IRENE MKWAWA', '255679406759', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(100, 'HAMISI RAJABU', '255715686469', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(101, 'SHARIFU BAKARI', '255689751782', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(102, 'EDWARD CHATA', '255713254991', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(103, 'JOYCE SALANGI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(104, 'ANNA ALEX JOHN', '255622512328', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(105, 'MWAISA AMIR', '255686238376', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(106, 'NUHU IDD', '255714327809', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(107, 'PENDO DAUDI', '255710124124', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(108, 'HALUN WONDO', '255688567799', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(109, 'SALOME SHIJA', '255657260162', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(110, 'ZAWADI ERNEST', '255767036691', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(111, 'CHRISTOPHER ELIA', '255653950190', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(112, 'CHIMLOE ', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(113, 'NOLASS CHIUMA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(114, 'IDDI HUSSEIN MODDY', '255712441548', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(115, 'ZAINABU MAULID HINTAY', '255692361011', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(116, 'HAWA BAKARI', '255657454629', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(117, 'MARTIN MAKOLOWEKA', '255787575535', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(118, 'DIFREY ABICH', '255715143139', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(119, 'SEFROZA DIFREY OLANG', '255787797708', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(120, 'HERINA KONDASY', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(121, 'AMOSI DAUDI', '255688882726', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(122, 'ROZI STEFANO', '255712827266', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(123, 'SHABANI SALUMU', '255714363588', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(124, 'KHADIJA JUMA', '255719460337', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(125, 'SELEMANI SHABANI', '255714982434', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(126, 'ANNA SELEMANI', '255783551782', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(127, 'REVOCATUS AUGUSTINI', '255713932271', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(128, 'JULIUS OMARY KUSAGA', '255654568504', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(129, 'MWADAWA MSIMBITI', '255675036321', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(130, 'ZUBEDA IBRAHIM', '255679017585', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(131, 'AZIZA ABDALLAH', '255675286897', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(132, 'IBRAHIM NASSAB', '255786865753', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(133, 'ELIMINA EVANSI', '255759033438', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(134, 'VERONICA MESHACK', '255766718397', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(135, 'STELLAH PALMER', '255763503306', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(136, 'WINRIDA SAMWEL', '255719318118', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(137, 'ANDREW KAMBANGA', '255688803727', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(138, 'SARAH SENDWA', '255767578621', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(139, 'NAOMI ELLY', '255686075666', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(140, 'GODWIN ERNEST', '255782022009', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(141, 'MARTHA YOHANA', '255758392584', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(142, 'LAURENCE ZEFHANIA', '255756802235', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(143, 'ARON LAURENE ', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(144, 'PERPETUA STEPHEN', '255683800444', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(145, 'PAUL MANGE', '255755752450', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(146, 'ROBBY LAURENCE ZEPHANIA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(147, 'JESCA DEVID DANIEL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(148, 'EURASIA EDWARD SAIMI', '255685458520', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(149, 'KULUTHUM JUMA SWALEHE', '255787999787', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(150, 'JUMA KASSIM LINGEJU', '255685161435', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(151, 'ORIVER MSANDA', '255714293964', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(152, 'STELLA JOHANES', '255714844030', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(153, 'MSTAFA AMIR', '255719958833', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(154, 'BAHATI MIRAJI', '255656307379', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(155, 'STELLA MBAUNGA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(156, 'AUGUSTINO MANASE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(157, 'ESTHER ISA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(158, 'SARAH EMMANUEL', '255714308762', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(159, 'THERESIA A MBATA', '255742761015', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(160, 'EVA CASSIAN MLASU', '255673137450', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(161, 'JAMES MBATA', '255743356316', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(162, 'VENANCE GAITAN', '255682681066', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(163, 'MAGRETH RAPHAEL', '255752881081', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(164, 'ORESTI MWANI', '255756233435', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(165, 'ERICK KANJE', '255758972015', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(166, 'RAMADHANI A MSUYA', '255653184688', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(167, 'FESTO CHARLES TEMU', '255715046669', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(168, 'DORIS FESTO TEMU', '255683046609', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(169, 'PRISCA AMBROSE TASHA', '255759773224', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(170, 'DATIVA SHIRIMA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(171, 'LIVING KAVISHE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(172, 'GODFREY LIVING KAVISHE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(173, 'ANETH JOHN SHIRIMA', '255676665031', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(174, 'GAHIMBARE RIBAGI RIBAGI', '255689140801', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(175, 'MARIAM SALUM MWALIMU', '255786521036', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(176, 'KESIA MVURUNGU KAJIGIJI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(177, 'FAUSTIN NENKO KITUMILA', '255754238772', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(178, 'HUSSEIN SALUM ALLY', '255699502292', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(179, 'MASHAKA PHILIPO', '255657105758', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(180, 'DARIA HERMAN SATORIA', '255767221731', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(181, 'FRANCIS ANDREA CHIHONGO', '255789852409', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(182, 'JAMES JOHN JAMES ', '255686169775', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(183, 'RHODA YOHANA', '255682278481', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(184, 'YAKOBO SIMON MADUL', '255716913355', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(185, 'BAHAT G SABUGO', '255783452280', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(186, 'LEONARD STEVEN SHIRIMA', '255754304117', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(187, 'DARIA AMBROCE TESHA ', '255766605917', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(188, 'EUFRASIA JUVENARY', '255717377892', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(189, 'AIZAK WANGALE', '255717500422', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(190, 'AGNESS LUKASI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(191, 'WAMBULA WASAIMONI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(192, 'MAGOLI AIZACK', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(193, 'PAULINA CHARLES', '255713096268', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(194, 'KAITANI OROTA', '255687261182', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(195, 'ESTER G KAMGISHA', '255743854666', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(196, 'LULYANNA MICHAEY', '255684080844', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(197, 'JASSAM MAULID', '255746130284', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(198, 'ABUBAKARI FABIAN', '255719694151', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(199, 'AMINA ISSA', '255719694151', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(200, 'FATUMA SELEMAN', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(201, 'JONAS ANDREW', '255658541983', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(202, 'OMARY KHARID ', '255785688109', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(203, 'AMINA SHABANI', '255787223767', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(204, 'HAPPINES AMOSI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(205, 'MICHAEL PACKAL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(206, 'SHUKRAN SHABANI', '255712096923', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(207, 'KHADIJA SALIM', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(208, 'SALEHE IDRISA', '255715063011', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(209, 'ROSEM WIKORO', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(210, 'BERNARD LUKOSI', '255755865540', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(211, 'RETHINA LUKOSI', '255754431794', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(212, 'TARISIS MAPUNDA', '255764673980', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(213, 'JOSEPHINE KYUPE', '255719851010', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(214, 'ESTER SAIMONI', '255749813985', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(215, 'ELIZABETH BARAKA', '255766760885', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(216, 'GERMANICO DERICK', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(217, 'JOASH OTIENO', '255767752667', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(218, 'SILAS BONIFACE', '255688004407', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(219, 'MOHAMED HASSAN', '255693179271', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(220, 'ALIDASTA JASSON', '255782358230', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(221, 'MROKOZI MARCO', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(222, 'SHUKURU JACKSON', '255788374752', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(223, 'DAUD NELISON', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(224, 'SABINA MWIKOLA ', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(225, 'VICTI LUKOSI', '255756375043', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(226, 'HAMISI ROBERT', '255714802161', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(227, 'ZAINABU NGAPAWA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(228, 'ADINANI HAMISI', '255712657012', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(229, 'ASELINA INJI', '255787613860', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(230, 'ASHA YONA', '255694141117', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(231, 'HAMIS HERI', '255714926354', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(232, 'SHABANI MOHAMMED KISEGESEGE', '255656595773', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(233, 'LUCY MWASHITETE', '255710710546', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(234, 'NEEMA GABO IRAHIU', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(235, 'MUHAMED ZUBERI SAIDI', '255756250498', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(236, 'MARIAM IBRAIMU', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(237, 'CHARLES FABIAN', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(238, 'SAIDI HASSANI ', '255769013833', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(239, 'SUBIRA TWAHA', '255787729063', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(240, 'KALUNGAMYE GOMORI', '255659803387', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(241, 'MAJALIWA EMMANUEL', '255699374751', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(242, 'PETRO EMMANUEL', '255692411532', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(243, 'ZAWADI HAMISI', '255713474905', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(244, 'ABDUL MANGOLE', '255712837477', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(245, 'ELIZABETH MATEO', '255752004294', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(246, 'ALLY SHOMARY', '255688435784', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(247, 'VAILETH ALLY ', '255684199441', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(248, 'TAUSI HASHIMU', '255683564347', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(249, 'SIKITIKO HASANI', '255789445641', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(250, 'DAIMA SAIDI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(251, 'DENADO CHINURGA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(252, 'SALUM KALAGWA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(253, 'TEODOLA JUMA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(254, 'MILIKI CHANGANGA', '255689915749', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(255, 'ELIZABETH LUIS', '255788871054', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(256, 'ANTHON MWITA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(257, 'SUZANA RAMADHANI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(258, 'HUSENI ZABRA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(259, 'ASHULA ADAM', '255685064225', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(260, 'AMINA KYANDO', '255656686144', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(261, 'DEVID KYANDO', '255715903121', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(262, 'JOHN KYANDO', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(263, 'JAMES KYANDO', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(264, 'ALLY MOHAMMED HAMISI', '255786079664', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(265, 'ASHA MOHAMMED HAMISI', '255655212988', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(266, 'ALLY SELEMANI KATOMA', '255657349009', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(267, 'HAMISI CHAZO', '255684633194', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(268, 'SILIVANA RAYMONDI', '255689844341', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(269, 'JOFREY CHAZO', '255693248048', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(270, 'CLEWIS CHAZO', '255783349846', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(271, 'SOPHIA MUSHI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(272, 'EMMANUEL BRIGHTON', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(273, 'SAIMON BRIGHTON', '255659464311', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(274, 'TEDI MUSHI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(275, 'MARTHA COSMAS', '255654769929', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(276, 'SAUDA MOHAMED KASSIM', '255782402196', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(277, 'SAMWEL SAID FRANK', '255688397304', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(278, 'ANA G MSIRU', '255714910949', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(279, 'HALIS HELI SAID', '255673016401', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(280, 'EMILI L MKUDE', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(281, 'FROIDA N MPONZI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(282, 'MICHAEL MAHINYA', '255753004622', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(283, 'AGUSTINO M MAHINYA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(284, 'IMANUEL M MAHINYA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(285, 'YOHANA J MSUYA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(286, 'COSTA DAMAS', '255787302493', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(287, 'MODESTER MPEMBA', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(288, 'GRACE MICHAEL ', '255758379938', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(289, 'ALATANGA NGELA', '255788178432', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(290, 'LUSUNGU NGELA ', '255766202636', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(291, 'ELIZABETH CHRISTOPHER', '255784916524', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(292, 'ABED ADILI', '255783693608', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(293, 'NASIBU MUSSA KALUNGWA', '255693421919', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(294, 'ASHA IBRAHIM', '255677587811', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(295, 'HELENA PILI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(296, 'BENSON PILI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(297, 'FLORA ANTIPASI KASIM', '255679207403', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(298, 'SAIDI CHITWAGA ', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(299, 'BAKARI CHITWAGA', '255714676668', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(300, 'ZAITUNI CHITWAGA', '255714443948', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(301, 'RAMADHANI BAKARI', '255754057248', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(302, 'SOFIA RASHIDI', '255657490269', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(303, 'ABUBAKARI RAMADHANI', '255786886835', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(304, 'ELIA ELIGIUS MFILINGE', '255788174123', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(305, 'EZEKIA E KAMWELA', '255754740460', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(306, 'BAHATI D NTOMA', '255775474430', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(307, 'KHERI ELIA MHILIMATIKO', '255782400456', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(308, 'REHEMA RASHID', '255656533328', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(309, 'ALHAJI IDDI', '255684200867', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(310, 'HABIBU RASHID', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(311, 'FAISAR ALHAJI', '255687757488', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(312, 'IBRAHIM ALHAJI', '255685076792', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(313, 'MOHAMED ALHAJI', '255782688912', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(314, 'PAULINA ALHAJI', '255689962607', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(315, 'ANNA LALI', '255684863018', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(316, 'SOKOINE BUSHIRI', '255684863018', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(317, 'NICHOLAUS ALEX MAKONGA', '255629311163', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(318, 'NYEMBO JUMA NGASA', '255787824882', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(319, 'ASHA ALLY', '255784253770', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(320, 'ZUHURA U MGASA', '255693566651', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(321, 'HARIDI SAIDI', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(322, 'JOSEPHINE RICHARD', '255752884779', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(323, 'RICHARD PAUL', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(324, 'WINFRIDA JOEL', '255769514157', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(325, 'JACQLINE RICHARD', '255787857590', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(326, 'JESCA ELISHA', '255684540944', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(327, 'BONIFACE SHADRAKI', '255688465204', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(328, 'EMMANUEL ANYELWISYE KYOMO ', '255687823050', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(329, 'MARIA OBEDY MKUMBANGE ', '255685910520', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(330, 'MAGRET ALBERT KAVEMBA', '255716571867', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(331, 'SADA JUMANNE MAGOHE', '255787025001', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(332, 'AISHA A MYOMBE', '255692931570', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(333, 'AYUBU R MYOMBE', '255713414775', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(334, 'JANE MWASHAMBWA', '255754227745', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(335, 'GETRUDE MWASHAMBWA', '255763392368', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(336, 'HAWA ELIYA', '255657561094', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(337, 'JENIFA A KAVISHE', '255674356494', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(338, 'GAUDENCE SIPRIAN', '', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(339, 'JASPA N JACKSON', '255621564097', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(340, 'DOREEN KAFILIKA', '255678179130', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(341, 'SAMSON MWAMBENJA', '255684480522', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(342, 'EMMANUEL R CHIDUGO', '255687955460', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(343, 'SARAH MADUNDA', '255783871688', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(344, 'AISHA OMARY', '255734283613', 1, 1, '0.00', '0.00', '0.00', 1, 0),
(345, 'EVANCE L MAVIKA', '784593178', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(346, 'VALERIA J KATARA', '713016577', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(347, 'LILIAN J DOMICIAN', '684059648', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(348, 'ANDASON L POSIANI', '672538648', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(349, 'ASANTE HAULE', '628828429', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(350, 'ISAACK NGELANGELA', '737884261', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(351, 'TATU MAULID', '682245518', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(352, 'PESA RAMADHAN', '689935588', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(353, 'SALMA S MSHINDO', '686860418', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(354, 'RAMADHAN S MHOMBA', '686860418', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(355, 'MWANAIDI SUDI', '714515427', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(356, 'ASANAIN ALLY', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(357, 'HAWA ALLY', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(358, 'LUCKIUS LONGINO', '744491876', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(359, 'DORIS REVOCATUS MNYAMBO', '622448357', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(360, 'ADJA ALLY', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(361, 'DOMINICKJ GOYI', '679339080', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(362, 'ALEXANDA MARUGU', '652501176', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(363, 'JOYCE MLANDALI', '783223246', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(364, 'GADI OSIKA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(365, 'SAIMONI NGELAGWA', '718145758', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(366, 'MARIA CHAULA', '757353143', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(367, 'MAJORINO NGELANGWA', '789021540', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(368, 'OMARI AKIDA', '784619753', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(369, 'MAURAS VISENO', '711688756', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(370, 'DAMARI MAKARO', '686955002', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(371, 'KELVIN GEORGE', '687893966', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(372, 'ALLI HASANI', '689268785', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(373, 'STEFANIA KOMBA', '627963872', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(374, 'FLORA KIMIJA', '682887495', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(375, 'ZAKIRINI JAFETI', '692696869', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(376, 'SAKINA YUSUFU', '717526094', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(377, 'ABUDARA MAGIDANGA', '716116254', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(378, 'YUSUFU MAGIDANGA', '689687644', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(379, 'KAIMU SAIDI', '654510552', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(380, 'RUKIYA ABUDARA', '655510553', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(381, 'HAPPYNESIMAGOGWA', '683452654', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(382, 'MAROTINI JAKOBO', '684853347', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(383, 'ZAUJIYA AYUBU', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(384, 'MWAJUMA ASUMANI', '686980742', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(385, 'DANIEL ANTONY', '684713104', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(386, 'JUDISI ANTONY', '789034200', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(387, 'JESCA ANTONY', '713012990', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(388, 'EMANUELA ANTONY', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(389, 'VERIAN MICHAEL ', '718976335', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(390, 'SALUM ALLY', '714361395', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(391, 'VICTORIA MONICA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(392, 'RUSIA NASORO JONI', '714304540', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(393, 'MARIA CHARESSI MAIGA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(394, 'SHIMA SHIJOHN MUTE', '713503650', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(395, 'CHRISTINA P GWICHA', '655503650', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(396, 'AMANI MWASHIUYA', '714502080', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(397, 'REBECA LWAMBO', '78720800', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(398, 'SEFU OMARI MSHAM', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(399, 'AGINESI YOTHAM', '623509148', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(400, 'YOHANA LUKUMAYI', '744219319', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(401, 'VERONICA PAUREND', '688221337', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(402, 'ALEX PETER', '782751248', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(403, 'HEZIRON KATAZA', '685168773', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(404, 'MARIAM HAJI BAKARI', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(405, 'JOHN KESSY', '716428820', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(406, 'BAHATI HAMISI', '685846920', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(407, 'SAROME KASIBETI MAGEMBE', '712476863', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(408, 'MONICA CHARLES KIHONDO', '659569571', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(409, 'KASBETI MAGEMBE', '719701923', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(410, 'TABIA NICOLAUS MGEMA', '675007828', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(411, 'MASA NICORAS MGEMA', '716223232', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(412, 'TUMAINI NICORAS MGEMA', '652984378', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(413, 'GLADNES NICOLAUS MGEMA', '757828530', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(414, 'NICORAS MGEMA', '763089574', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(415, 'GEORGEAPOLO', '687150891', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(416, 'DYANA NKERYA', '755157462', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(417, 'ISAKA OBADIA MSIRU', '695537266', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(418, 'ABDALLAH KARUME', '717105799', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(419, 'FATUMA HUSENI', '688982323', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(420, 'ADAM NGONYANI', '713516265', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(421, 'MWANAIDI ONESIMO', '686748482', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(422, 'VESENTI MAIGE', '621301677', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(423, 'FRANCIS KAKUSA FURAZISI', '693362050', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(424, 'MARIA HAVA', '7139858808', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(425, 'ASEDI RAJABU MKINGA', '716845908', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(426, 'MWAJUMA NJOVU', '712136569', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(427, 'NASRA ASEDI', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(428, 'REVOCATUS MWANANDEJE', '784897999', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(429, 'INOLLA KIWANGURA', '766254073', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(430, 'FRANK REVOCATUS ', '759753683', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(431, 'BONIFASI MWANANDEJE', '699421754', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(432, 'MAURUS MWANANDEJE', '788520456', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(433, 'ABIGAELI DANIEL KIGODI', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(434, 'DAVID IZIRAELI NYAGAWA', '673518750', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(435, 'HAWA ATHUMANI MARIBICHE', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(436, 'NURAH FARID MSAKAMARI', '693314790', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(437, 'LUCY MSHANA', '762409108', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(438, 'MATRIDA COSTANTINO MASANJA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(439, 'NOELI MARISELO MBILINGI', '788193692', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(440, 'SIKORASTIKA NOELI MARISEKO', '756748424', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(441, 'FILBERT C MTUYA', '716157295', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(442, 'SKOLASTIKA EDWARD HAULE', '679168883', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(443, 'REGINA FILBERT MTUYA', '6522057089', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(444, 'STIVIN FILBERT MTUYA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(445, 'LUCAS PETER MWAMAKONDA', '754631808', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(446, 'MARIA ISAKWISA SAMBEPO', '786294002', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(447, 'SOPHIA LUKAS PETER ', '783565909', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(448, 'ABDULAZIZ ISSA', '717275474', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(449, 'MARIA PATRICK MWILO', '718986879', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(450, 'DORICE ABENEGO SEMGALAWE', '754822285', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(451, 'DORINE DIOTREFU ABENEGO', '764753901', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(452, 'DORCAS DIOTREFU ABENEGO', '656254887', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(453, 'NICE DENNIS KASARO', '620729478', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(454, 'CHRISTIAN COMFORT URASSA', '658359069', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(455, 'COMFORT RUMISHAEL URASSA', '716509303', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(456, 'EKIAKUNDA RUMISHAEL URASSA', '718613488', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(457, 'DEVOTA PAULINI MAFULU', '786745599', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(458, 'DOMINATA TUMAINI', '752439643', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(459, 'ANASTAZIA VEDASTUS', '748483566', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(460, 'ADRONICUS KATEME', '683902840', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(461, 'LEAH NYAKITA', '758228953', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(462, 'EVORD KASESE', '685900497', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(463, 'ALISTIDES ADRONICUS', '715705403', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(464, 'REHEMA AGUSTINO', '684464586', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(465, 'MARIA AMOS CHEZA', '754562151', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(466, 'AISHA SAIDI ABDALA', '655054751', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(467, 'BILAL AMILI MUSA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(468, 'GIRIAD JUSTIN MAIGA', '686877590', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(469, 'ANISIA ZAKALIA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(470, 'RHODA PETER', '682486723', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(471, 'BERTHA PAUL MGATA', '784603313', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(472, 'EPHRAZ BARTHAZARY MAFURU', '716087959', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(473, 'ESTA OGOMA NYOKO', '716047659', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(474, 'ESTA BUSANYA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(475, 'JUMA OMARI', '686822950', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(476, 'MAYASA MOHAMEDI', '693716279', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(477, 'IDI JUMA', '693675989', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(478, 'SAIDI NGODO', '658961916', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(479, 'MAIMUNA ISSA', '717010135', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(480, 'YOHANA MJOJO', '768306040', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(481, 'NEEMA YOHANA', '742478861', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(482, 'ROBAT ELLY', '753356185', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(483, 'ROZI ROBAT', '692918024', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(484, 'ELIAS FABIAN', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(485, 'DANIEL DOGAN', '765439036', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(486, 'JOSEPH FILBERT', '719169282', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(487, 'ALICE HUSENI', '714248022', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(488, 'DEOGRATIAS MATEM', '739669024', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(489, 'MARIAM YUSUPH', '747280096', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(490, 'HASANI IMANI ', '676869382', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(491, 'ABDUL MUSTAFA ', '689343546', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(492, 'SALIMA JUMA', '685070894', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(493, 'MARIAM MASINGE', '689571488', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(494, 'MASHAKA JUMANNE', '692149288', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(495, 'ELIZABETH MERITON', '655406640', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(496, 'PIUS OBADIA', '657837938', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(497, 'HASHIM MANGOSONGO', '684712832', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(498, 'MATILDA MTUMBUKA', '685620192', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(499, 'ZAITUNI RASHID ', '713369713', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(500, 'ARAFA MANGOSONGO', '625567589', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(501, 'HALIMA YUSUPH', '787712812', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(502, 'EBADI ROBAT MILANZI', '685824244', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(503, 'MOHAMED RAMADHAN MAGOE', '712406413', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(504, 'AMINA ABDALA HAMISI', '655488427', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(505, 'SHIDA RAMADHAN MAGOE', '712734906', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(506, 'HASSANI RAMADHAN MAGOE', '715488429', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(507, 'HUSEN RAMADHAN MAGOE', '693259316', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(508, 'RAMADHAN HUSENI', '676828109', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(509, 'RAMADHAN OMALI', '744261281', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(510, 'SALUM MOHAMEDI MAGOE', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(511, 'TWALIBU JUMA SADIK', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(512, 'ISIAKA TWALIBU', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(513, 'ATHUMAN JUMA SADIK', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(514, 'ABUBAKAL JUMA SADIK', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(515, 'ZAINA ATHUMAN SEIF', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(516, 'GIBSON MARAK', '688009224', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(517, 'RICHADI MBENA', '759329919', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(518, 'LIDIA MBENA', '716620167', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(519, 'STANSLAUS JAKSON KALINGA', '753121924', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(520, 'JAKLIN STANSLAUS', '788703986', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(521, 'JANET STANSLAUS', '788703899', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(522, 'JESKA PASKAL', '719961160', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(523, 'GOODLUCK NKO', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(524, 'FAUZIA SAID', '756224906', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(525, 'MAIKO MANYUS', '757039036', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(526, 'YUSTA ISAYA MATEFU', '787205837', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(527, 'JAKSONI STANSLAUS', '715717286', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(528, 'FRANK EMANUEL', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(529, 'GREGOR SILVANUS MASUNZU', '719482140', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(530, 'AGNES JOSEPH MNYANGUS', '719652040', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(531, 'ZAINABU ABED BALUAN', '652717825', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(532, 'AZIZA HASHIMU BAKALI', '683594024', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(533, 'NASRA HASHIM BAKALI', '684823721', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(534, 'ZUENA ABDALA', '715147148', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(535, 'RAMADHAN MASUD', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(536, 'ISSA ALLY MWIRU', '719564557', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(537, 'AMINA HAMIS', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(538, 'ISAAC KAMARA', '785018620', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(539, 'MARY MAGESA', '758545672', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(540, 'LUKAS ELIBARLIK MARO', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(541, 'OMEGA GODIFREY TESHA', '784396293', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(542, 'FROLIAN MISANA', '677369951', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(543, 'ANET JOSEPHAT KIKWETE', '686562729', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(544, 'OTAVINA ELIUTA NGALOKA', '716900178', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(545, 'JERASI ABEL MAYOBELA', '763994021', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(546, 'VERONIC ERNEST MWENDESHA', '673413233', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(547, 'MERY JERASI ABEL', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(548, 'TERESIA ALBINUS MASANJO', '782690808', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(549, 'KOMBO IBRAIM KAPERA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(550, 'HASAN MBILO', '718761803', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(551, 'HADIJA TWALIBU NGONYANI', '685113909', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(552, 'OSWARD WERNER NANDONDE', '782643737', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(553, 'SARA LAURENT MBWIRA', '711384645', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(554, 'TAUDESIA MICHAEL TAIRO', '718459056', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(555, 'BAKALI MAKUPULA', '682747737', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(556, 'ABILAI HALIFA', '689362341', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(557, 'WITNES THOMAS ', '786061794', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(558, 'YOHANA CHACHA', '784256673', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(559, 'HUSNA MOHAMED KIENDA', '783009066', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(560, 'GODRICH AMFREI KWEKA', '686689716', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(561, 'ANJELA AMADI HAMISI', '679692961', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(562, 'HAMADI HAMISI', '711464480', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(563, 'MARIAM MUSTAFWA LIKONGO', '654801431', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(564, 'ALLY RASHID MAKOTA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(565, 'RASHID ALLY MAKOTA', '712944561', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(566, 'ISSA  ALLY MAKOTA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(567, 'NASRA  ALLY MAKOTA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(568, 'ALLY ADAM', '657471229', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(569, 'ONESMO RICHARD NDAKI', '782101942', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(570, 'JULIUS MWIJARUBI MASIJA', '782307363', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(571, 'GRACE TELLA MNUBI', '782213729', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(572, 'BOAZ JULIUS MWIJARUBI', '713803344', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(573, 'MERCYCIANA LUAGA MALENGE', '712760291', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(574, 'MALIMA JULIUS MWIJARUBI', '654083999', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(575, 'PETER MGOGOS FRANCECE', '692394924', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(576, 'JUDITH BAHATI CHUNGU', '684811729', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(577, 'TWAHA IDDI ALLY', '788462672', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(578, 'BERTHA GEOGRATIUS KULIGE', '789100977', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(579, 'MOSESI EMANUEL MTUKA', '683727923', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(580, 'AGNES DAUDI SEMBEO', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(581, 'BAKARI HAFDHI HAMIS', '689998429', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(582, 'FATUMA AYUBU CHIVI', '689998429', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(583, 'ELIZABETH JULIAS EDWARD', '788775369', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(584, 'ROBI JULIAS EDWARD', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(585, 'JULIAS EDWARD MWITA', '686752730', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(586, 'BOKE WELEMA MALWA', '767010707', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(587, 'RICHARD FRANCECI', '717944670', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(588, 'SALUM TWAHA RASHID', '787877290', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(589, 'SHALIFA KASM TOI', '743608005', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(590, 'MERY SANGA ENOCK', '689572931', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(591, 'TEOPHILI MWANJA PAUL', '718963270', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(592, 'JACOBO ALFRED ODIDA', '787959277', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(593, 'ROSE BENARD PATALEO', '682376307', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(594, 'EMERDA CLEMENT PASKALI ', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(595, 'VICTAR CHOMOLA HENERY', '747539386', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(596, 'CHRISTINA MSIGARA BONPHAS', '694145821', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(597, 'OKEYO CHRISTOPH JAMES', '654212411', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(598, 'STIVIN OUKO', '692646075', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(599, 'ALFRED ODIDA', '692627196', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(600, 'BARAKA NYEGINGA MAKABE', '657349614', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(601, 'GIDION JOHN NDONO', '719078886', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(602, 'RITA WILIFRED MACHA', '659593810', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(603, 'JUMA HASHIM RAIZA', '692254557', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(604, 'KATHELINE JOHN HAULE', '694236500', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(605, 'SALEHE ATHUMAN SALEHE', '719525292', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(606, 'SOPHIA RAJABU MNA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(607, 'KIBAKAYA NASBU MSUYA', '710291317', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(608, 'RIDYA NOBATH KIBOGOYO', '786175030', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(609, 'RAJABU HUSSEN SOKO', '784454803', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(610, 'SAUM RARABU HUSSEIN', '786080020', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(611, 'JENIPHA JOSPEPH STEPHANO', '663211918', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(612, 'SHALFA SUFIAN RAMADHAN ', '629077271', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(613, 'JOSEPH STEPHAN MKENYE', '688610614', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(614, 'MBARUKU ABED MBARUKU', '787484294', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(615, 'RAMADHAN SAID MKUBWA', '658576736', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(616, 'TAUS SAURI BWILE', '713109757', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(617, 'FERISTAR MWITA NYAMHANGA', '767721017', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(618, 'FABIAN PIMA RUBASHA', '784641416', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(619, 'NEHEMA JOHN RUBASHA', '754641417', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(620, 'RAITON EMILO MWINUKA', '757745238', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(621, 'REHEMA MITEB MDORO', '658922990', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(622, 'SWAUM ABUBAKARI ISSA', '653100276', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(623, 'EDWIN HATANAS ANTONY', '693826718', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(624, 'SHABAN HASAN MAYAWA', '786997810', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(625, 'MOSES KISARA PETER', '689505739', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(626, 'FRANCECEKO MAIKO WILLIAM', '786109678', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(627, 'WAMBOI MAGOLE BISEKO ', '659748239', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(628, 'ZAINABU ALLY HURA', '692641660', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(629, 'OMARY WAMBOI MANGOLE', '692846788', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(630, 'ADAM MOHAMED NASSORO', '789020991', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(631, 'SOPHIA RASHID MALYUNGA', '788702746', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(632, 'ADINAN HAJI SHEKIGENDA', '719500981', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(633, 'ABISNA SULEMAN MUSSA', '654500981', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(634, 'HAJI SALUM SHEKIGENDA', '787193498', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(635, 'FESTAR SIKALA GOLYATI', '748675198', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(636, 'BOSCO EDRIO MWAKILEMBE', '714255764', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(637, 'BARAKA LAMBWE KIBONA', '757733985', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(638, 'JEN HAUZEDIA NYAULINGO', '743078250', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(639, 'RICHARD MALECHELA MADEJE', '712488182', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(640, 'KATHELINE ERNEST SAKALAN', '652485506', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(641, 'NEEMA RICHARD MALECHELA', '692827929', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(642, 'HELEN MANYANGU', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(643, 'MOSHI HERY HERY', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(644, 'JAPHET ZAKAEL MKAMA', '688182728', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(645, 'FRIDA LENATUS LOVA', '674681782', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(646, 'REBEKA GODIAN MBEHOMA', '689181071', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(647, 'EMANUELA GODIAN MBEHOMA', '', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(648, 'VELONIKA GODIAN MBEHOMA', '693828428', 1, 2, '0.00', '0.00', '0.00', 1, 0),
(649, 'JOHANES MEVAASH LUKUMAY', '255766848693', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(650, 'PILI JUMA GALAWA', '255789871780', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(651, 'RICHARD JOHANES LUKUMAY', '255692569009', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(652, 'LAZARO JOHANES LUKUMAY', '255656444201', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(653, 'MAJUTO MAJALIWA MOHAMED', '255718849889', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(654, 'NASRA RAMADHAN MDIMU', '255713202823', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(655, 'RAMADHAN SEIF MKOJERA', '255714306682', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(656, 'TIELY ELIBARIKI MSUYA', '255719925225', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(657, 'WILLIAM NYAMBOKO DIDIA', '255744621418', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(658, 'CONRAD JANUARY NJONGE', '255684371637', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(659, 'ROBAT GONDWE ADANI', '255688933651', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(660, 'ALEX MGAo', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(661, 'ANIPHA JOSEPH', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(662, 'JASMIN ALEX MGAO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(663, 'MASEMELE MANYAMA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(664, 'YUSTINA MAJULA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(665, 'TUMAINI SHAYO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(666, 'DASTAN PHILIMON MAWANGA', '255714942059', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(667, 'VEDASTIA PIUS MTEMBWE', '255788722025', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(668, 'PHILIMON DASTAN PHILIMONI', '255789889585', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(669, 'FRANCIS DASTAN PHILIMONI', '255692576565', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(670, 'FESTO DASTAN PHILIMONI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(671, 'ZAMZAM ADAM ', '255687475556', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(672, 'SAMMY A MILANZI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(673, 'ZENA MAHAMUDU IMANI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(674, 'SHARIFA SAMMY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(675, 'MACHONDA HASINA RUNJES', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(676, 'JANETH GEORGE MALE', '255746760986', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(677, 'DIANA RUNJES MACHONDA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(678, 'KELVIN H RUNJES', '255623109392', 1, 3, '0.00', '0.00', '0.00', 1, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(679, 'HERBERTH NDETEWALE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(680, 'SISTER LEMSON SIMKOKO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(681, 'JAMES CHACHA MLEWA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(682, 'TAUS RAMADHAN FURAHISHA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(683, 'ELIAS MKUWA', '255783460450', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(684, 'DONATHA KOMBA', '255781985754', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(685, 'FLAVIAN ELIAS MKUWA', '255781985754', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(686, ' JOHN ELIAS MKUWA', '255786073151', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(687, ' GROLIA ELIAS MKUWA', '255629834246', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(688, 'RICHARD MJAPANI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(689, 'ZAINABU MRISHO', '255652603159', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(690, 'SAID KIBAJA', '255788769802', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(691, 'SHARIFA KHAMIS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(692, 'RAMADHAN SHOMARY', '255755494506', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(693, 'MAULIDY ABUU SALUM', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(694, 'ZAWADI NYEMBELA GANDAWEGA', '255659278657', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(695, 'MBUTI JOSEPH MCHOCHO', '255689238117', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(696, 'RECHO JOSEPH KEVIN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(697, 'JONGO HAJI', '255754462410', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(698, 'KHADIJA HUSSEIN', '255787147711', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(699, 'SWAUMU HEMEDY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(700, 'HAJI JONGO', '255659164300', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(701, 'HUSSEIN JONGO', '255717951480', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(702, 'ASHA MAJENGO', '255659147150', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(703, 'ASIA IDDY', '255713300241', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(704, 'HASSAN AMADY', '255762673196', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(705, 'HUSSEIN DUDU', '255673336511', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(706, 'NAWAJE JONGO', '255756925401', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(707, 'ROBERT AIDAN', '255714633398', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(708, 'ZAHARA AYUBU', '255677295939', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(709, 'SWALEHA KHATIBU', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(710, 'HAMIDA SWALEHA KHATIBU', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(711, 'JONATHAN KAYUWANGA', '255767966905', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(712, 'HELENA ALFRED', '255757146966', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(713, 'GUDLUCK JOSEPH MUHIMBA', '255687768613', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(714, 'SOPHIA GUDLUCK JOSEPH', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(715, 'STEPHANO PETER', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(716, 'MWAJUMA MOHAMEDY ALLY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(717, 'EMANUEL MUHIMBA', '255717208709', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(718, 'FARAJA MKUNDA', '255717050814', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(719, 'VERTA JAPHETY', '255682300240', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(720, 'MAGRET WILLIAM', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(721, 'EDGA FANDI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(722, 'OCTAVIUS MODESTA ', '255765221608', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(723, 'CHRISTINA CRESPHOR', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(724, 'MAJIDY KHALIDY', '255717970471', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(725, 'FARIDA OMARY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(726, 'ABUBAKARI MAJIDY KHALIDY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(727, 'SHAFII MAJIDY', '255717970471', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(728, 'VICTORY MARCUS GODELO', '255765375267', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(729, 'MARTIN TANGANYIKA MWANGULE', '255686466530', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(730, 'THEODOSIA FRANCIS KISAWIKE', '255657003207', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(731, 'PETRONILLAH MARTIN MWANGULE', '255657681777', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(732, 'SABINA GAILOS MKEMWA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(733, 'SABINA BENJAMIN KISAWIKE', '255744830622', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(734, 'LUCY MARTIN MWANGULE', '255623931017', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(735, 'KOLIN KANBOY KAUNDA', '255754332868', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(736, 'NEEMA SAMUEL', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(737, 'DANIEL MATHIAS MAKAYA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(738, 'ABIUDI DANIEL', '255699394409', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(739, 'LUCY YOSIA KIBABI', '255762320040', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(740, 'ABIEZA YOSIA KIBARI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(741, 'JACKSON EZRON NGEREJA', '255788055603', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(742, 'UPENDO JOHN SAULO', '255767902363', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(743, 'JACOB MWAKIFWAMBA', '255682971190', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(744, 'ASHA RASHIDI', '255693645065', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(745, 'AHMAD NDEGE', '255789927609', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(746, 'SHAMIRA NDEGE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(747, 'ESTER ILOMO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(748, 'ISAYA ILOMO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(749, 'EDSON MWAKIFWAMBA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(750, 'RAMADHAN ABAS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(751, 'TUNU HASSAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(752, 'SALMA RAMADHAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(753, 'YAHYA  RAMADHAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(754, 'HASSAN  RAMADHAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(755, 'KHALIDY  RAMADHAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(756, 'SHABAN ADAM', '255655539650', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(757, 'AMINA SHABAN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(758, 'GROLY SAMWEL RICHARD', '255764181146', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(759, 'ENOCK SAMWEL SIMBA', '255693639761', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(760, 'DORCAS OGALLO RAPEMO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(761, 'JUSTINE THOMAS ANGIRA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(762, 'PRISCA THOMAS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(763, 'HUSSEIN HASSAN', '255715201948', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(764, 'ZAKIA MGANGA', '255655331692', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(765, 'SADIKI KALINGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(766, 'MGES CHARLES ', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(767, 'OCTAVINA MATINYA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(768, 'SAIDY JAPHARY', '255755664603', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(769, 'AGRIPINA A NDABITA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(770, 'DEO SHIJA', '255755503026', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(771, 'VERONICA ERNEST', '255785593720', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(772, 'SALEHE MAULIDY', '255712291275', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(773, 'DALIA UPEPO NJAIDI', '255714811763', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(774, 'EZEKIEL HERMAN LUSAKA', '255656537951', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(775, 'ELINA ANTONY KOBA', '255783955762', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(776, 'MICHAEL MESHACK PASHA', '255654746002', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(777, 'WINIFRIDA VICET SEBASTIAN', '255685702899', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(778, 'DAMAS M KALINGA', '255719737005', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(779, 'REHEMA D KALINGA', '255719737030', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(780, 'ISACK KALINGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(781, 'JOHN JONAS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(782, 'SAFINIEL MBWAMBO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(783, 'OMBENI KARIGO ', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(784, 'SAMWELI EMANUEL', '255653066878', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(785, 'MERY SAMWELI', '255687516561', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(786, 'ZAINABU ISSA MOHAMEDY', '255718245638', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(787, 'ISSA MOHAMEDY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(788, 'LUIS KALINDA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(789, 'DOMI LUIS KALINDA', '255699340092', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(790, 'AMINI M NGELANGWA', '255712093628', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(791, 'ELMERINDA A TEWELE', '255783568204', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(792, 'MAURUS J AMUNIMARARA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(793, 'THERESIA JOSEPH MAURUS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(794, 'REBECA JOSEPH MHARUKA', '255654489152', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(795, 'SILVESTER GALUS CHINYANGANYA', '255621994648', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(796, 'RITHA CONSTANTINE MALYAGILI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(797, 'SCOLASTICA ATHANAS', '255759554122', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(798, 'ALLY SEIF SANGARA', '255712152595', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(799, 'JUMA SHABANI MANTULE', '255787007430', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(800, 'DOROTHEA OMARY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(801, 'OMARY ALLY', '255713442671', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(802, 'PAUL SEBASTIAN MTEY', '255692658740', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(803, 'RACHEL JOSEPH DAUD', '255686234622', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(804, 'SEBASTIAN PAUL MTEY', '255752928994', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(805, 'ANASTAZIA IDDY ALLY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(806, 'LEONARD NGOMENI MWINGIRA', '255710202153', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(807, 'MALICK OMARY TIMU', '255687972844', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(808, 'SULEIMANI RAJABU', '255686196907', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(809, 'EVALISTA MICHAEL', '255788081733', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(810, 'GODFREY EXPEDITO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(811, 'NEEMA GIDION MANYASI', '255788976264', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(812, 'PAULO  GIDION MANYASI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(813, 'ELIJI SAMWEL PETER', '255788086824', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(814, 'KELVINA AGAPIT KAVISHE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(815, 'GLORY AGAPIT KAVISHE', '255788143197', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(816, 'PHILIPINA CORNEL KAVISHE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(817, 'RESHMA IBRAHIM KHAJI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(818, 'YUNUS HARUNA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(819, 'HERIETH MGAO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(820, 'VICENT MSAFIRI', '255684979783', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(821, 'VAILETH MSAFIRI', '255714578417', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(822, 'ALFRED AGUSTINO', '255658578417', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(823, 'ANORD ZACHARIA', '255789210840', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(824, 'GODWIN P RAPHAEL', '255689246135', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(825, 'OMARY KOJA MSHIRI', '255715152868', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(826, 'VANESSA NEHEMIA', '255787991253', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(827, 'VERONICA MANYAMA', '255765404027', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(828, 'STEPHANO SEVELINE PWANI', '255788266006', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(829, 'CHRISTOPHER NICHOLAUS MSAWA', '255657349037', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(830, 'NASORO SALUM ZIGI', '255684931496', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(831, 'GEORGE GERADY', '255762269982', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(832, 'MZEE NGOMENI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(833, 'VERONICA NGOMENI', '255787877639', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(834, 'MARRY NGOMENI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(835, 'NURU HASSANI', '255787877639', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(836, 'KHADIJA RAJABU', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(837, 'LAULENT ANDREA', '255788017139', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(838, 'LIVINI LYAMVYA', '255719395381', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(839, 'WITNESS LUCAS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(840, 'FARIDA OMARY MOHAMEDY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(841, 'ABASI ALLY KENGWA', '255719383441', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(842, 'ZAINABU TANU', '255782416262', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(843, 'IBRAHIM AMLANI', '255787304044', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(844, 'SELEMANI MZEE JUMA', '255717513280', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(845, 'FATUMA ZUBERI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(846, 'JAMES SAMWEL', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(847, 'DIANA GIDION', '255788456168', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(848, 'RUMONGE M GOMORY', '255655394855', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(849, 'LATIFA E MUSHI', '255672539271', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(850, 'ALFA A MOTTA', '255784020337', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(851, 'JANETH N MAKARANGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(852, 'SAID H HASHIM', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(853, 'FIDEA JOHN MWATUKA', '255788815013', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(854, 'GODWIN K GALEBA', '255788173028', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(855, 'PIUS BARAJOBIAN', '255787324802', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(856, 'ELIZABETH BARASOBIAN', '255788863036', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(857, 'CALISTUS PIUS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(858, 'IVAN IMRAN', '255655967837', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(859, 'MATHA CLEMENT', '255676838892', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(860, 'VICENT JOSEPH', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(861, 'DEONIS DEOGRATIUS', '255673555270', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(862, 'ANGEL ALOYCE', '255679993120', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(863, 'MISANGU MASANJA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(864, 'ZEPHREIN SELEMANI', '255783574182', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(865, 'JOHARI MAKAMBA', '255692372087', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(866, 'BONIFACE DUNDA', '255683877327', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(867, 'JULIANA AGUSTA', '255715662418', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(868, 'HASHIMU MSOGOYA', '255754200361', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(869, 'DORIS NJONGE', '255717052074', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(870, 'JESCA JOHN', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(871, 'PELAJA MBUGANO', '255742884459', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(872, 'NICHOLAUS MSOVELA', '255758073615', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(873, 'ZAINABU SELEMANI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(874, 'JASTINI EDWARD', '255789037469', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(875, 'JASAN KALINGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(876, 'HAPPINESS EMMANUEL', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(877, 'ELIAS WANGWE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(878, 'SIKUDHAN ELIAS WANGWE', '255675089650', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(879, 'KARIM ATHUMAN', '255685605863', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(880, 'MIRIAM MALICK', '255685605863', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(881, 'MARY FILIBETH KOMBA', '255682782141', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(882, 'MUSSA ISIHAKA KAYUGWA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(883, 'ANITHA', '255689947905', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(884, 'FRANCIS PETER', '255693368651', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(885, 'SELINA ABEL CHEUSI ', '255652960101', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(886, 'IRENE ABEL CHEUSI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(887, 'MARY JOHN MANYANGA', '255654140736', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(888, 'GODWIN JOHN MANYANGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(889, 'YAHANA PAULO WAMI', '255763775521', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(890, 'CESILIA YOSEFU', '255763775521', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(891, 'JOHNSON PETER KALIDIISHI', '255689892769', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(892, 'EMMANUEL MELCKIORY EMMANUEL', '255710811822', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(893, 'LILIAN ALLEN SESHALA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(894, 'ANTONY LUCAS KAMANGE', '255788114781', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(895, 'ALOYSIA ALOYCE KAMAGI', '255714172399', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(896, 'SARA ANTONY KAMAGI', '255714172399', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(897, 'LOVENESS REMY KIONGO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(898, 'FESTO EDWARD MBWILO', '255684270999', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(899, 'MAGRETH MESHACK PAULO', '255752108575', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(900, 'JACKSON LOMAYAN THOMAS', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(901, 'JOYCE EZRON OJAMBO', '255788150382', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(902, 'BARAKA EZRON OJAMBO', '255687851636', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(903, 'BAHATI EDWARD ', '255688742589', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(904, 'PASKALINA SAIDY', '255692214747', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(905, 'ERICK MICHAEL WILSON', '255657010626', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(906, 'STELLAH FRANK ALBANO', '255752996480', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(907, 'STANSLAUS TIMOTH MWIHAVA', '255754977771', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(908, 'MICHAEL AVITI FELIX', '255788744087', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(909, 'JUPIANA SAMWEL HIJA', '255743941807', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(910, 'ZULEHA EMMANUEL', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(911, 'SADICK SWEDI', '255683015195', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(912, 'ZUBERI MKUU', '255654887153', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(913, 'HALIMA HABIBU', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(914, 'RAFAEL STOWA', '255717105922', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(915, 'MELINA MAZENGO', '255717297721', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(916, 'HABIL S MBWAMBO', '255712699890', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(917, 'MATLIDA H MSUNGU', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(918, 'SAFIEL S MBWAMBO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(919, 'LOVENESS R MNDEME', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(920, 'RASHID O MBWAMBO', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(921, 'DAVINA HAULE', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(922, 'RAJABU STANLEY', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(923, 'GODFREY AIDAN TOJI ', '255679032101', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(924, 'MWAJUMA MWAMINI MKUMBUKWA', '255766060545', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(925, 'FRANK SAMWELI', '255694063378', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(926, 'BONIFACE MALODA', '255747964574', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(927, 'MARY MALODA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(928, 'MWAJABU HAMIDU', '255673946901', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(929, 'SHARIFA KHAMIS', '255686055770', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(930, 'THOMAS AIDAN', '255684002919', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(931, 'SAID KILAVE', '255742198922', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(932, 'ADOLPH KUSIMA', '255768446969', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(933, 'RUKIA ABDALLAH CHIKULU', '255717151254', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(934, 'ABUBAKARI SALUM MBONDE', '255676044304', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(935, 'AMANI JOSEPH MWACHA', '255656995483', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(936, 'LEONARD JONAS MLAI', '255676561817', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(937, 'RATIFA ASEDI', '255782979304', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(938, 'GODFREY KISALA', '255686696203', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(939, 'ANGEL PRUDENCE', '255673935598', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(940, 'JOASH SAMSON', '255685727810', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(941, 'JOSEPHINE THOMAS', '255712668376', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(942, 'ASHA ABDALLAH', '255788711240', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(943, 'JASTINI SWAI', '255788711240', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(944, 'HAMISI MSANGI', '255712562190', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(945, 'CLARA CHENGULA ', '255676653896', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(946, 'MOSES MBAGA', '255623952715', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(947, 'ANITHA KIRARO', '255629294812', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(948, 'SAVELA CHARAGU', '255694405146', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(949, 'DEO NYAULINGO', '255694994587', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(950, 'PILLY KEDY PIUS', '255711749345', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(951, 'FELIX MAWANGA', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(952, 'ELIZABETH NGOTI', '', 1, 3, '0.00', '0.00', '0.00', 1, 0),
(953, 'MOSES A SAKUVEDA', '255718617853', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(954, 'CHRISTINA J SAKUVEDA', '255716702406', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(955, 'JOSEPH MOSES', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(956, 'ABUBAKAR M MCHOMVU', '255713252628', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(957, 'REHEMA E SHIRIMA', '255757120822', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(958, 'MOHAMED A MOHAMED', '255782458237', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(959, 'RIZIKA S HAULE', '255676062920', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(960, 'MARY A GEHO', '255655267035', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(961, 'PILY SAID', '255683468522', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(962, 'NURUDINI ABUBAKAR', '255626065730', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(963, 'ALLY RAMADHAN', '255688210621', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(964, 'UBWA ABRAHAMANI', '255786069279', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(965, 'ABRAHAMAN SELEMANI', '255714939283', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(966, 'SALOME ROBET', '255787505267', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(967, 'HAMISI H LIGOMBA', '255713008857', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(968, 'LULU F LUFAGILE', '255693293057', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(969, 'TRIPHON MILANZI', '255675573677', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(970, 'CRISTINA MARISELI', '255682159755', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(971, 'JODAN MAKUNGU', '255692777100', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(972, 'DORINI BUMIJA', '255767999770', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(973, 'SEPH MHAGO', '255783230106', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(974, 'JAZAKA AMANI', '255713318358', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(975, 'PILLY GASIYA', '255656361606', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(976, 'EMMANUEL MADENI MKAMA', '255756260585', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(977, 'FLORENTINA JEJE KANONI', '255755860413', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(978, 'JACKLINE E MADENI', '255682886744', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(979, 'MWADAWA JACKSONI', '255712604680', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(980, 'JOEL SINYARO', '255752279529', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(981, 'ESTER NAFTARI', '255762141784', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(982, 'TEDY JOEL SINYARO', '255782191785', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(983, 'JULIUS FRANK', '255757380757', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(984, 'LEONIA PETER', '255764110005', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(985, 'PATRICK DIATUS', '255789418459', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(986, 'CHIKANGA SIMKOKO', '255716971850', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(987, 'CRISTINA CHIKANGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(988, 'GIDION CHIKANGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(989, 'GODREY JOSEPH', '255789183338', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(990, 'MARIA ANTHONY', '255692693829', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(991, 'ALEN SENDEKI', '255692539284', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(992, 'IRENE NYENZA', '255746203324', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(993, 'SELEMANI ISSA', '255784439179', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(994, 'ZAHARA HASSANI', '255682535318', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(995, 'SAIDI GOMOLE', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(996, 'YOHANA SEVERINI', '255653281052', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(997, 'VERONICA PAULO', '255699435529', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(998, 'SARA RAFAELI', '255699435529', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(999, 'ERASTO SEVERINI', '255711609913', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1000, 'NATALIA KIKOTI', '255676215135', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1001, 'IBRAHIM GEITANI', '255676215135', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1002, 'LUCIANA GEITANI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1003, 'SADOCK LUDENZI', '255071869694', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1004, 'LEONOLA FILIBETI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1005, 'BASHIRU SALUM', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1006, 'ROZI ALLY', '255658263922', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1007, 'RAMADHANI NASSORO', '255713247179', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1008, 'JOSEPHIN ALOYCE', '255071812576', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1009, 'STUMAY RAMADHANI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1010, 'AGUSTINO JAWA', '255785657544', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1011, 'NURU MOHAMED SAID', '255785656592', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1012, 'EVELINA NDAGA', '255787431265', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1013, 'BARAKA AGUSTINO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1014, 'FREDY SAMSONI LILENGA', '255683022550', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1015, 'DAFROZA AMASI LABIA', '255682896099', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1016, 'JULIAS JONSIA', '255767400300', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1017, 'TABITA MWITA', '255767400305', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1018, 'MOHAMED ALLY MPONDA', '255656921226', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1019, 'NESTA MTEUYE', '255757438399', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1020, 'ABERI MENEMA', '255674583797', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1021, 'EMANUERA CHARAMILA', '255785851519', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1022, 'JUMA MOHAMED MPONDA', '255785607833', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1023, 'FATUMA MAKAGO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1024, 'RAMADHAN NASORO', '255677614739', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1025, 'HABIBA RAMADHANI', '255719118901', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1026, 'SAID KHAMISI BAKARI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1027, 'MWASITI KHAMIS BAKARI', '255685668970', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1028, 'ELIZABETI JULIUS MTERA', '255688659674', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1029, 'NASORO BAKARI', '255692031484', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1030, 'RAMADHANI ANSI', '255684326225', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1031, 'ZUHENA MASOD', '255783497049', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1032, 'RASHID ALLY', '255768607917', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1033, 'HAWA MASOD', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1034, 'EVELINA MIKAELI', '255624249542', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1035, 'BENETO TOBIAS', '255625401474', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1036, 'ROSE MAHELA', '255759288332', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1037, 'JOHN MAHELA', '255767526265', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1038, 'CHRISTINA MBAWALA', '255657620764', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1039, 'NICHOLAUS GEHO', '255678857641', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1040, 'MSAFIRI ROGATH', '255656880885', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1041, 'MARY FRANK', '255683005732', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1042, 'FURAHA KILAVE', '255653104166', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1043, 'SEVERIN MKUMI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1044, 'EMILE WILLY', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1045, 'OBASY S MWAKIBETE', '255757605710', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1046, 'MARIAM SAHELA', '255678691465', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1047, 'SALIMA ADAM', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1048, 'HAIDARI MTORO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1049, 'COSTANTINO A MASHANGO', '255712332872', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1050, 'REHEMA JAPHETY', '255683970944', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1051, 'ZABRON J MASHANGO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1052, 'HILTRUDA DAMAS MUSHI', '255782001767', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1053, 'FLORENCE G KIMARO ', '255655544703', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1054, 'JOYCE P KIMARO ', '255689464695', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1055, 'IRENE F KIMARO ', '255659601620', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1056, 'EDSON F KIMARO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1057, 'ABDALLA CHIMU', '255693411071', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1058, 'CHIMU ABDALLAH ', '255689586704', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1059, 'MALIMA ABDALLAH', '255684237801', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1060, 'SHARIFA ABDALLAH', '255693272156', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1061, 'ZAKIA ABDALLAH', '255621285791', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1062, 'LOVENESS KHAMISI ', '255713516295', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1063, 'ROMANA SWAI', '255767106959', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1064, 'MARTHA JAMES', '255621420345', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1065, 'JASMINI ABASI', '255689658519', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1066, 'AMANI MARCO', '255788035543', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1067, 'AIDA AHAMAD', '255762434563', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1068, 'GROLIA JUMA', '255693051407', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1069, 'ABASI RAMADHANI', '255743526334', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1070, 'SAID RAMADHANI', '255733307157', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1071, 'JEYLOS LOVA', '255744788704', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1072, 'RAHABU KIMWAGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1073, 'TAUSI YASINI', '255679841681', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1074, 'DOMANA RICHARD', '255783049200', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1075, 'MWAVITA MOHAMED', '255684238371', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1076, 'ZACHARIA T KANYANDEGE', '255657353505', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1077, 'MBARAKA MOHAMEDI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1078, 'NYATI ZUBERI', '255652276105', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1079, 'CATHERINE EMMANUEL', '255658893727', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1080, 'SHABANI DIGOMBA', '255784584349', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1081, 'ASHA KASIMU', '255786179785', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1082, 'ELIA S MASONGA', '255654695442', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1083, 'YUSTA N KASALAMA', '255676050576', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1084, 'ALIKO JOHN', '255717930080', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1085, 'SAVERA PAULO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1086, 'FADIGA MWANKUGA', '255686328071', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1087, 'TUMAINI BUKUKU', '255686820808', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1088, 'GIVENN ALFEA KIZINGA', '255757743122', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1089, 'AMINA J BUKUKU', '255748747431', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1090, 'SALUM G HAMISI', '255694148146', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1091, 'FATUMA JUMA', '255684545530', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1092, 'SOPHIA YOHANA', '255788572181', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1093, 'JUMA CHACHA', '255689118701', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1094, 'JOSEPH PHILIBERT', '255718272639', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1095, 'HERMAN PHILIBERT', '255655719770', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1096, 'JIMMY ERICK', '255754590795', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1097, 'OSWAD MAURIDI', '255686414274', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1098, 'ALEX ONESMO', '255683934114', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1099, 'DIANA CHARLES', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1100, 'KHALID RAMADHAN ABAS', '255672767143', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1101, 'ABDALLAH RAJABU', '255784584748', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1102, 'ISSA OMAR HUSSEIN', '255786700554', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1103, 'REHEMA SEIF', '255784213637', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1104, 'PATRICK LONGWE', '255684403404', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1105, 'BRENDA KAMANGA', '255687829907', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1106, 'HASHIMU ISSA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1107, 'MARIAM HAMISI', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1108, 'AZIZI IDD', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1109, 'JOSEPH MUYOMBO', '255655951902', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1110, 'REHEMA RICHARD ', '255692494135', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1111, 'GABRIEL SAJINE', '255743032034', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1112, 'GRECE YOHANA', '255654681933', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1113, 'GEOFREY FRANCIS', '255716633808', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1114, 'BEATRIC E MUMBA', '255716558599', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1115, 'OMBENI JOAN FRANCIS', '255683205776', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1116, 'MOHAMED NGOMBOLELA', '255712711964', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1117, 'MWANABIBI MOHAMEDI', '255719251368', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1118, 'CATHERINE NOEL', '255759328079', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1119, 'IRINE SOSPETER', '255679307038', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1120, 'WIKESTA FINIAS', '255759328079', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1121, 'BRASMUS RAFAEL', '255786731832', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1122, 'RESTUTA REMINGTON', '255684107777', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1123, 'RUBEN REMINGTON', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1124, 'JULIANA NDAKI', '255788702714', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1125, 'CHARLES ELIAS', '255683938163', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1126, 'AZORI MUHAPA', '255786957301', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1127, 'ARONI ELIAS', '255683714264', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1128, 'RASHID AMIRI NGONGOJO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1129, 'HIDAYA OMARI KINDAMBA', '255714502357', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1130, 'ATHUMAN RASHID NGONGOJE', '255689182120', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1131, 'SAUDA RASHID NGONGOJE', '255717010135', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1132, 'LILIAN NGUO', '255715450472', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1133, 'NEEMA OMARI', '255789275084', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1134, 'MILLYCENT AGREY', '255685026678', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1135, 'PETER HASSAM', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1136, 'PETER WILSON', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1137, 'JOEL MAKEBA', '255652289651', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1138, 'SERVIA MBALINGO', '255769603371', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1139, 'YOHANA LUVANGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1140, 'AISHA CHAGURA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1141, 'JOEL M BUNGU', '255756660480', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1142, 'AYUBU A MBAJO', '255684776675', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1143, 'PAULINA MKULA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1144, 'HASHIM HAJI SAAMBILI', '255714363358', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1145, 'SIKUZANI KHALID BAKARI', '255656465879', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1146, 'SOPHIA ZUBER MOYO', '255652335659', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1147, 'ALLY ATHUMAN KIPALAMOTO', '255719602801', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1148, 'FARIDA SALUMU', '255654368625', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1149, 'RASHID SHABANI ALLY', '255713067395', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1150, 'LUCY ALEX MOHAMED ', '255689438710', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1151, 'SHABAN RASHID SHABANI', '255684696677', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1152, 'BASHIRM YUSUPH', '255686896594', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1153, 'BAHATI HAMIS', '255688241194', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1154, 'MUSA ALLY SHABAN', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1155, 'ANA', '255689321021', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1156, 'MICHAEL JOHN CHAMWENYE', '255655566658', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1157, 'HAMAD SONGOLO', '255688904841', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1158, 'PILI ABDALLAH MOHAMED', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1159, 'MUSTAPHA SAID MNYUMANGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1160, 'HAPPYNESS HERNEST', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1161, 'SAID MUSTAPHA SAID', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1162, 'EMMANUEL ALPHONCE KILAWI', '255755966960', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1163, 'PAULINA MELKIOR NDANU', '255756537078', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1164, 'MAYASA ABUSHIR', '255719129557', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1165, 'ZEMBAR', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1166, 'KEM', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1167, 'RAMADHAN MIRAJ ABUSHIR', '255716127050', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1168, 'REHEMA KASSIM MALINDURM', '255713311770', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1169, 'JOYCE JOSEPH SHAURI', '255765770834', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1170, 'DANIEL JOSEPH SHAURI', '255782627706', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1171, 'ELIMINA IBRAHIM LUKWAVU', '255784622718', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1172, 'MATHA JEMS HUNJI', '255718636656', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1173, 'SELINA ABDLLAH', '255687846131', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1174, 'PETER ABDALLAH', '255713832210', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1175, 'INOCENT W KOMBE', '255787308722', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1176, 'JAMES MKONONGO', '255658855405', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1177, 'MMASSA ', '255783470121', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1178, 'ALEN CHARLES KOMBE', '255712477676', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1179, 'VAILET MARTIN', '255712434247', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1180, 'ZABLON STEVEN NYATO', '255714147657', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1181, 'REGINA GIDOHAY SAKWEL', '255672628754', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1182, 'STEVEN ZABLON NYATO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1183, 'REHEMA ZABLON NYATO', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1184, 'ADAM EDWARD NTIGIGWA', '255655476973', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1185, 'VESTINA JONAS NDIMGWANKO', '255676522414', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1186, 'WITNES IMBAZI LAURENT', '255715484120', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1187, 'NOLASCO MGANI', '255755525470', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1188, 'FLORA IGNAS MKOMBELA', '255717600598', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1189, 'TEODOR SONGA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1190, 'NASSORO HAMISI', '255786349065', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1191, 'GLORY SEM MKUPETE', '255788213351', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1192, 'HELENA ALEX NYOKA', '255782981320', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1193, 'CRISTINA ERNEST NONDO', '255682516470', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1194, 'SOPHIA ERNEST CHIMYA', '255682757751', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1195, 'JACKSON NOLBERT', '255710393992', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1196, 'IZACK TEODOR LONGO', '255787222727', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1197, 'ZABIBU GESTON ', '255789747891', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1198, 'FADHIRU GESTON MBANGO', '255718340392', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1199, 'SAMAKA MASANJA', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1200, 'BARAKA MBOHEZI LWAMBO', '255784363518', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1201, 'ELIZABET JOSHUA HAYA', '255713363518', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1202, 'MAYASA MUSTAPHA KALAWA', '255689256711', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1203, 'MARIAM SAID MSWIN', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1204, 'WAZIR HAJI WAZIR ', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1205, 'DANIEL DISMAS MWAHIM', '255687345997', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1206, 'GERALD THIMOTH', '255782220577', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1207, 'FATUMA HAMIS', '255625199155', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1208, 'FRED MWAHIMU', '255766975553', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1209, 'EVELINE SEBAS ', '255717284818', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1210, 'ABUBAKAR MGEKULA', '255713910278', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1211, 'EMANUEL P NJIKU', '255786593066', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1212, 'ZAWAD CRISTOPHA', '255654561477', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1213, 'MRISHO HAMIS', '255653153979', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1214, 'JULIETH ABRAHAM', '255787210717', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1215, 'AKSA PETER', '255693399561', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1216, 'MOHAMED KAUMA', '255689015110', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1217, 'JENIPHA FESTO', '255653131538', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1218, 'WILSON SEBASTIANI', '255788006023', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1219, 'BENSON ADIRIAN', '255699361914', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1220, 'REHEMA JUMA', '255657103881', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1221, 'SUMA M ABUSHEHE', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1222, 'JASTIN DEVIDI', '255658360623', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1223, 'CATHERINE CHARLES BISEKO', '255784514500', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1224, 'ANDREW CHARLES BISEKO', '255654997842', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1225, 'TUKAE SHAZIL NOMBA', '255762154006', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1226, 'EDWARD MWENISONGOLE ', '255769807371', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1227, 'PAULINA MAGANGA SWILE', '255769873174', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1228, 'PROMICE EDWARD ', '255699119087', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1229, 'MALKI RAJABU', '255787012845', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1230, 'TELESIA TUNGU LISSO', '255692575160', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1231, 'MWANAHAMIS IBRAHIM', '255685777954', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1232, 'PILI SAID', '255677302767', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1233, 'MOHAMED SALUM', '255658720252', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1234, 'MWINYIMVUA RASHID', '255712720252', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1235, 'JACKLIN AGUSTINO', '255688446348', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1236, 'A.MREMA', '255676481870', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1237, 'JESCA MREMA', '255676481870', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1238, 'RITANZ ABDALLAH', '255629001028', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1239, 'SALMA LIKUNGUALA', '255657721307', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1240, 'ABDALLAH KITANZI ABDALLAH', '255789561766', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1241, 'SHAIBU MPONDA', '255788588926', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1242, 'YOHANA MWENDI', '255713994946', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1243, 'ZAHARA MPONDA', '255688720117', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1244, 'ABASI MNYANI', '255753234999', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1245, 'ZAINABU MWENDA', '255715486760', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1246, 'HUSSEIN ABAS ', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1247, 'SALMA RAMADHAN ', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1248, 'ERICK THOMAS', '', 1, 4, '0.00', '0.00', '0.00', 1, 0),
(1249, 'cHANDE GILBERT MTWANGA', '685379993', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1250, 'ASHA MOHAMEDI MSALA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1251, 'HAMIS TEGA RYANA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1252, 'MIYOKI MZUMBE TEGA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1253, 'MARIA NYAMABI RYANA', '687729616', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1254, 'HABIBA MSAFIRI URASSA', '783788014', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1255, 'GOODLUCK ALOYCE NGOLE', '676479067', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1256, 'MAUA KASSIMU MBEGA', '683405112', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1257, 'NASIRI JUMA KANJU', '717962515', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1258, 'NASRA SALUM HUSSEIN', '710013735', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1259, 'REHEMA JUMA MWADUMBIA', '711612851', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1260, 'MOSES HELEMAN MUMBE', '711612851', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1261, 'FARAJA KISWAGA KISWAGA', '694421168', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1262, 'JACKLINE KISWAGA KISWAGA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1263, 'HAPPY ERNEST KIKOTI', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1264, 'ERNEST BONIFASI CHAMBULA', '693508256', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1265, 'ELIZABETH BONIFAS CHAMBULA', '684405738', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1266, 'NEEMA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1267, 'JACK KIBINGO ABEDA', '624962368', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1268, 'VICK JACK KIBINGO', '678662207', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1269, 'ELIASI ATHUMANI MALUGU', '713191750', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1270, 'ONESMO MURISA ALEX', '713770094', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1271, 'ZAITUNI WILSON KAMBILANGA', '783050546', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1272, 'JOHN KABIGUMILA', '783515696', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1273, 'AZAKI WILSON MBILIZA', '783226437', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1274, 'LIVINI FERDINAND BUKEMA', '752278554', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1275, 'LEGINUS JOSEPH HONGOLI', '653239820', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1276, 'ALAX MPEKA ANTON', '784277409', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1277, 'JENIPHA A. MUDEKE', '712175197', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1278, 'SHEILA MWINYIPEMBE SHOMARY', '784089940', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1279, 'HAMZA ALLY MWELUGWAMI', '655744040', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1280, 'SEIPH NASORO MOHAMED ', '677218129', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1281, 'ALDON CHUTER', '621991273', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1282, 'RICHARD JOHN NDAGA', '713502795', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1283, 'SARAH PETER JEDENGWA', '685792329', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1284, 'JOHN JOHN NDAGA', '758166962', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1285, 'TERE DINANDI LADSLAUS', '766527287', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1286, 'MARTHA PASCAL MACHIBIA', '763520558', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1287, 'RAJABU MOHAMED MITAU', '716387998', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1288, 'MWAHIJA SELEMANI RICAO', '716387998', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1289, 'MWAJUMA RAJABU MITAU', '716387998', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1290, 'ABDALAH ATHUMANI KUSAGA', '693145540', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1291, 'BENEBICTOR FABIAN CHAGGA', '713400313', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1292, 'RAMADHANI HAMAD MKARO', '783301435', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1293, 'CHANDE GILBERT MTWANGA', '694110214', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1294, 'ASIA ATHUMAN KUSAGA', '782689818', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1295, 'YAHAYA ISSA MNYAU', '752025042', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1296, 'AMINA HASSAN SELEMANI', '683877737', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1297, 'NURU YAHAYA MNYAU', '752025052', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1298, 'HADIJA YAHAYA MNYAU', '752025042', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1299, 'ESTELLA ALLYMOHAMEDI', '683170545', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1300, 'KELVIN PETER MARWA ', '711698360', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1301, 'PASTENS BRUNI SIUHI', '767059598', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1302, 'ABDALLAH MUHARAM MKECHA', '676222347', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1303, 'RAMADHANI SALEHE', '713829275', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1304, 'FLORA NESSONI', '655677372', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1305, 'NAVAS HAMIS', '745369468', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1306, 'JACKLINE PETRO', '781644223', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1307, 'ANTON BULEZI', '781644223', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1308, 'AIVA FANUEL', '684897718', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1309, 'AMOS KENETH', '785376031', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1310, 'KEBELEZO MATHEY', '693323485', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1311, 'AISHA RAMADHANI', '693323185', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1312, 'GWAJA ZUBERI OMARY', '696394565', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1313, 'ZUBERI SAID OMARY ', '652535305', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1314, 'ESTER GEORGE SABUGU', '658258594', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1315, 'YUSUFU KIMOSA', '658258594', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1316, 'ASNATI ZUBERI', '658258594', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1317, 'RABIA SAIDI', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1318, 'HUSNA SEIFU JUMA', '784888095', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1319, 'PILI IDDY MWINYIMVUA ', '657409532', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1320, 'ABDULLY IDDY KIYENGU', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1321, 'IDDY MOHAMEDI KIYENGU', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1322, 'SIANA', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1323, 'MARINA KAJUNA', '692782538', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1324, 'KAJUNA EDMUND', '692782538', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1325, 'BONIFACE CHAMBARA', '786649119', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1326, 'ISSA DIGOMBA ', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1327, 'JANNETH GASTO', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1328, 'ANAGILE MKABU', '676550999', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1329, 'GUDNES', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1330, 'ISSA DIGOMBA SALUM', '784514113', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1331, 'ZULUFA MRISHO', '654756070', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1332, 'AZIZI ALLY WAZIRI', '713813059', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1333, 'HUSNA HASHIM ZUBERI', '674294384', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1334, 'RAMA ATHUMAN', '719429702', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1335, 'SALUM ISSA DIGOMBA', '699578247', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1336, 'ABDULL ISMAIL DIGOMBA', '687906605', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1337, 'SOMOE SALIMU ISSA ', '652756070', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1338, 'FEDRICK STEPHEN', '788101166', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1339, 'WILSON EDWARD MGANGO ', '699508225', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1340, 'ABDUL TAMIM BAKARI', '699508225', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1341, 'ELIAS ZUBEDAYO SAID', '658291466', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1342, 'SAKINA NASORO MGAZA', '658903666', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1343, 'SALAMA ALLY MTOROMI ', '658903666', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1344, 'AISHA MTAFA MKONGA', '658903666', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1345, 'JUSTANCE LAURIAN ZITAHONA', '783455740', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1346, 'ELIZABETH CHANGALA', '652587170', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1347, 'BENEDICTOR JUSTANCE', '788722160', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1348, 'OLIVA JUSTANCE', '785209501', 1, 5, '0.00', '0.00', '0.00', 1, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(1349, 'CATHERINE LEONARD MSHONGOO', '685341508', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1350, 'SAMUEL ERNEST MWILAWI', '654754095', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1351, 'AISHA JUMA RAMADHANI', '683661396', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1352, 'GONZAGA CHARLES KAMSWAGA', '763305197', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1353, 'LEONARD JUMA KIMOSA', '759753166', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1354, 'ERICK ROBERT SWARD', '746356316', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1355, 'SALUMU OMARY KOMBO', '683473422', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1356, 'DEODATUS GODWIN MSHEJA', '769306840', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1357, 'JAMES CHRISTOPHER ', '688300987', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1358, 'OWEN DANIEL', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1359, 'OSCAR PETER MBUGI', '786457317', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1360, 'BEATRICE ELIAS FUNDI', '625494416', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1361, 'ELIAS OSCAR MBUGI', '683418946', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1362, 'NASRA SEIF ALLY', '689230205', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1363, 'MWAJUMA SAID KIDOSHARI', '656442328', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1364, 'REMI VALENTIN REM', '656442328', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1365, 'ANNA ELIAS MALUGU', '689388353', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1366, 'HELENA MALUGU', '652108317', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1367, 'JOSEPHINA MALUGU', '786394629', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1368, 'YUNIS DANIEL MALUGU', '786394629', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1369, 'ALEXANDA MALUGU', '652501176', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1370, 'GODFREY MALUGU', '715054510', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1371, 'DANIEL MALUGU', '786394629', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1372, 'DANIEL LENADI MALUGU', '715054510', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1373, 'LAZARO KITUSA NSHOKA', '754495865', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1374, 'CHRISTINA HUNGU', '653932309', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1375, 'ASHA SAID ATHUMANI', '658768139', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1376, 'JAMIRA SAID ATHUMANI', '718303436', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1377, 'HAMIDA SAID ATHUMAN', '685044088', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1378, 'SADIKI OMARY KANGOMBE', '676552880', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1379, 'TUMAINI DEOGRAS MTITU', '678844558', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1380, 'ZUREA HAMIS', '612894404', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1381, 'MARY  PETER', '693915650', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1382, 'ALBART TUNGU', '693915650', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1383, 'DISMAS TUNGU', '686376337', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1384, 'YUSUFU IMRANI', '682694136', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1385, 'ELIZA GEORGE', '658258524', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1386, 'MWAZO J. LAZARO', '756098217', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1387, 'VAILES MALIBWA', '783498756', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1388, 'JUSTINA LUBALAJA', '745837369', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1389, 'AGNES MALIBWA', '745837369', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1390, 'ZERAH MATHIAS', '754427009', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1391, 'CAROLINA SELEMANI', '718394020', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1392, 'SELEMANI ROBERT', '718394020', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1393, 'DICKSONI MREMA', '714221595', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1394, 'JESCA SEKAMBA', '719891395', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1395, 'SAIDI BAKARI', '685276179', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1396, 'JOSEPH MWASANGULA', '713297974', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1397, 'HALIMA MZIRAI', '753981120', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1398, 'AMOSI MAKUYA', '785376631', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1399, 'EMMANUEL B. MOSHI', '714292417', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1400, 'DONATA P. LIMO', '655662305', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1401, 'MOHAMED MALUTI', '785865986', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1402, 'MARIAM AMILI', '682888492', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1403, 'HAWANI HAMADY RAIWANI', '688113800', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1404, 'HAPPYNIQUE PROSPER CHRISTOPHER', '688113800', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1405, 'AMINA MAULIDI KIRURI', '653833170', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1406, 'ABDALLAH HASSANI JUMA', '710174298', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1407, 'HULUKAI JUMA', '686123237', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1408, 'AISHA SALUM', '686123337', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1409, 'AISHA SEIF ATHUMANI', '693510081', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1410, 'YUSUFU SHABANI ABDALLA', '693510089', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1411, 'LOVENESS SELESTINI LOCK', '682221132', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1412, 'JUMANNE PINGU DOGANI', '687481358', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1413, 'MARY PASCAL HILLY', '689187488', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1414, 'ERICK SAIMON WILLIAM', '684876057', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1415, 'RENATUS EMMANUEL', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1416, 'DOMITINA DONATUS', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1417, 'AMIRI SUDI', '715717110', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1418, 'NASIRI JUMA', '717962515', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1419, 'PETER SAMSONI', '783853812', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1420, 'SARAH R. HERMANI', '714375303', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1421, 'RAHERI MANOTA ', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1422, 'ALIDIDI ABIUDI', '699325394', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1423, 'AVITI ANDREA', '783649467', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1424, 'ABED SAID', '716808079', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1425, 'SALIMA ABEDI', '712451813', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1426, 'ASINATI', '', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1427, 'SHAMILA AYUBU', '693826050', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1428, 'RISSO TUNGU', '685657512', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1429, 'BEDCTO RICHARD', '654528927', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1430, 'PETER DAUDI', '685224446', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1431, 'JASTINE BENEDICT', '710405695', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1432, 'LILIANI JASTINE', '692641884', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1433, 'HASAN ZUBERI', '654498136', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1434, 'ANASTAZIA MUSA', '694121164', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1435, 'ELIZA NYAMBUYA', '787544850', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1436, 'HAMISI RAMADHANI', '715203529', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1437, 'ESTER NGURUWE', '692238074', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1438, 'AMIRI SUDI', '715717102', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1439, 'ASHA HASSAN', '657715929', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1440, 'LEONARD R. ORIO', '655684211', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1441, 'FLORA L. ORIO', '718221006', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1442, 'SHIJA NG\'UNDE', '710714456', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1443, 'ALEX LEONARD GWAMWANTA', '717800652', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1444, 'RAHEL MANOTA', '686489307', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1445, 'LETICIA PAUL CHARLES', '629592738', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1446, 'FELISTA MHAVA', '688011773', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1447, 'NYANDA SIMBILA', '688011773', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1448, 'HANSI NYIMBO', '794848224', 1, 5, '0.00', '0.00', '0.00', 1, 0),
(1449, 'JOHN JOHN  KARIA', '255756485068', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1450, 'YASINTA JOHN KARIA', '255715308636', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1451, 'ALLEN E MUSHI', '255712946458', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1452, 'DOMINICK PESSA ', '255693202706', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1453, 'REBEKA JOHN', '255688554612', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1454, 'EDITHA MLWALE', '255674617591', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1455, 'FADHILI A MREMA ', '255784212892', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1456, 'HOSEA MSAFIRI', '255693882060', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1457, 'NEEMA ELIFURAHA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1458, 'JOHNSON TUMANUELI MARO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1459, 'JOSHUA TUMANUELI MARO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1460, 'KARIMU HASANI', '255699565282', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1461, 'JOSEPH LUGAKINGIRA', '255655280400', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1462, 'NANCE JOSEPH', '255782306726', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1463, 'ALIHAJI KIPINGU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1464, 'DIANA  DEOGRATIAS', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1465, 'PRENCIANA MWIRUKI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1466, 'PEACE MWIRUKI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1467, 'MUKIZA MWIRUKI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1468, 'ZACHARIA MBOJE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1469, 'ALLEN PHILIPO MARO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1470, 'SOPHIA JOSEPH VICENT', '255719057225', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1471, 'MARIA ALLENI  MARCO', '255656457799', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1472, 'EMANUEL ALLENI MARCO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1473, 'MBARAKA ABUSHIRI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1474, 'AKENACE HAMISI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1475, 'DAMIAN KIRIMA', '255754041663', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1476, 'JANETH KIRIMA', '255746426230', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1477, 'DAVID ROBERT ISOWE', '255655232256', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1478, 'JANETH DAVID ISOWE', '255718468029', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1479, 'EVALINE BONIFAS JAMAL', '255735232256', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1480, 'JOICE HEDRI', '255711937793', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1481, 'CHARLES KURANDA', '255711937793', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1482, 'VICKITORIA CHALEX', '255711937793', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1483, 'GISELA GODFREY MOSHA', '255689211451', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1484, 'AMINA ISSA', '255719315047', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1485, 'BERNARD W MACHA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1486, 'SAIDI MOHAMEDI MATAKA', '255712785229', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1487, 'NURU MOHAMED ALLY', '255714357980', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1488, 'PRISCA FAUSTINE', '255747466551', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1489, 'DANIEL MCHAU', '255782861442', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1490, 'RUTHI CHIWRA', '255687948133', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1491, 'ASHA HUSSEIN', '255752311625', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1492, 'JUMANNE S JOSEPHIN', '255718610800', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1493, 'VICTORIA MLESI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1494, 'DISHON VICTOR MWIRUKA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1495, 'DESMOND MWIRUKA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1496, 'ANASTELLAH MWIRUKA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1497, 'NEEMA EDSON', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1498, 'KAUSENI TERI', '255674315514', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1499, 'KAROLINA ABUSHIRI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1500, 'BARAKA KAUSENI TERI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1501, 'LINDEN BABUEL KESI', '255712404607', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1502, 'WARIDI MARO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1503, 'GODBLESS B KESSY', '255715215643', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1504, 'ANNA GODBLESS KESSY', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1505, 'PATRICK GODBLESS KESSY', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1506, 'NOEL BABUEL KESSY', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1507, 'NEEMA SIJALE', '255652327455', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1508, 'YASINI MBAWALA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1509, 'GAUDENCE MWAIPUN', '255764967883', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1510, 'HILDA MPONELA', '255765981791', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1511, 'DOMINIQUE MAGINGO', '255717096600', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1512, 'NAPALITE MAGINGO', '255712207221', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1513, 'RUTHY MAGINGO', '255783971717', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1514, 'SUNNY KAGARUKI', '255656131288', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1515, 'THOMAS CHALI', '255783043479', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1516, 'LEORNAD CHALI', '255788447111', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1517, 'GRACE KISIRAGA', '255754319732', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1518, 'RESTUTOR GAMBAGO', '255763497627', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1519, 'JOSEPH HAYOLA', '255754619585', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1520, 'ANORD KISIRANGA', '255784608877', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1521, 'RAPHAEL PAUL GAMBAGO', '255693239791', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1522, 'RAPHAEL DISMAS HAYOLA', '255786517861', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1523, 'CLEMENT DISMAS MWAMLIMA', '255755868284', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1524, 'PRISCA ANATOLI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1525, 'BRIAN JOHN MACHELA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1526, 'LILIAN NDUGILE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1527, 'PRISCA JOHN', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1528, 'NOMANI SWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1529, 'ZUBERI ZUNA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1530, 'NAJIMA ZUBERI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1531, 'ZAINABU LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1532, 'HAWA LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1533, 'HADIJA LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1534, 'OMARI LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1535, 'HADIJA LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1536, 'MWANAKOMBO LUWENO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1537, 'JASTINI IKINGURA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1538, 'JOYCE IKINGURA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1539, 'LISTA MKODA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1540, 'EMELINA MKODA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1541, 'CHRISTOPHA MKODA MKONONGO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1542, 'JAMES MKODA MKONONGO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1543, 'ESTA MKODA MKONONGO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1544, 'MARCO CHALEX', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1545, 'STEPHEN MADATA ', '255766426614', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1546, 'JULIA MADATA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1547, 'NELLIE MADATA', '255769152692', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1548, 'JOSHUA MADATA', '255742889880', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1549, 'JOACHIM SIMWINGA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1550, 'PUDENCIA SIMWINGA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1551, 'TEDDY JOACHIM', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1552, 'MOSES JOACHIM', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1553, 'MWALAMI NGAO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1554, 'KAVIBETHI SWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1555, 'PROSCANA AMANI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1556, 'EMANUEL S SHAYO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1557, 'JULIUS S SHAYO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1558, 'COSTANTINE DOMINICK', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1559, 'MOHAMED ISSA', '255787110518', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1560, 'CECILIA KAUDENCE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1561, 'AGNESS SWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1562, 'DAMIAN KIRIMA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1563, 'VICTOR MAKOMBA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1564, 'MAIKE MAIKE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1565, 'BUSELA MOSHA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1566, 'CHARLES SWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1567, 'VENERANDA SWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1568, 'NEEMA BANONGO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1569, 'ROYANA MUHANPATEL', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1570, 'SHEKERA KOMBA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1571, 'STRATON MAKUNDI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1572, 'DOROTH MASAWE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1573, 'TULA DANIEL', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1574, 'ILANGA PASCO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1575, 'EMEDI MWIJUMA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1576, 'MERYSTELLA LEKULE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1577, 'JOHN MANUMBU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1578, 'JOSEPH MANUMBU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1579, 'KAROLINI MANUMBU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1580, 'ANTONIA JAKSON', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1581, 'JANETH ZAINADI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1582, 'ANTONI CHAME', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1583, 'CHRISTINA CHAME', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1584, 'VICTOR MAYUMBA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1585, 'SHABANI YASINI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1586, 'AZIZI SHABANI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1587, 'JANETH SHURA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1588, 'EZEKIEL JAKWAI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1589, 'EVA YUSUPH', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1590, 'VENANCE JEIRO ', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1591, 'STELLA LUTIKO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1592, 'AISHA MSHANA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1593, 'ROSE KOKA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1594, 'FAUSTINI MBASA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1595, 'SALIMA RAJABU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1596, 'SAMWELI NOMANI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1597, 'BENSON FAUSTINE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1598, 'ELIZABETH MALIK JUMAPILI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1599, 'TATU IDD', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1600, 'ISSA RAJABU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1601, 'LEWIS MUNGULE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1602, 'SOPHIA MUNGULE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1603, 'STELA MAIGE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1604, 'ADAMU SELEMANI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1605, 'MOHAMED ISSA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1606, 'MARIAMU SUEDI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1607, 'JOEL NAMTANGA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1608, 'JOHN MASAWE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1609, 'FRANK MAGES', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1610, 'AGNES MACHENJE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1611, 'ATHUMANI YUSUPH', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1612, 'JAMILA HUSEIN', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1613, 'ASHURA MUSSA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1614, 'IDDI SALEHE', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1615, 'VENANCE PATRICK', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1616, 'MAGRETH BEATUS NGEREJA', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1617, 'TALE JOHN', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1618, 'SAMWELI EMMANUEL', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1619, 'FELISTA EMMANUEL', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1620, 'STEPHANO KIONO', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1621, 'DORA JOHN', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1622, 'JOSEPH KANOTI', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1623, 'KOMBO KAMPERA SALUMU', '', 1, 6, '0.00', '0.00', '0.00', 1, 0),
(1624, 'HATIBU R. MUYA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1625, 'ZULFA H. MUYA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1626, 'ZENA H. MUYA', '693455516', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1627, 'ABDALLAH F. MBAGA', '682022227', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1628, 'IRENE J. MHINA', '656227134', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1629, 'JOYCE C. MHINA', '652227134', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1630, 'JULIANA F. MHINA', '717302100', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1631, 'RHODA NGOVI', '693248823', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1632, 'THOMAS BENEDICT MAWALA', '752616047', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1633, 'VICENT D. MAIGE', '692043169', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1634, 'LEILA JOSEPH', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1635, 'ADILIANA KANUTI', '786082438', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1636, 'ZULFA SALUM LEGEZA', '787216634', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1637, 'ELISAFI ELINAZI', '652746792', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1638, 'LIBERATUS NJAU', '713660653', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1639, 'SOFIA NJAU', '684396433', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1640, 'KELVIN K. NJAU', '713826388', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1641, 'JOSETTE A. COLES', '787405009', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1642, 'CYRIL TAVARES', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1643, 'JOSHUA E. MDEMU', '714350633', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1644, 'JANE FOVO', '754647966', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1645, 'KELVIN MWANSASU', '754647966', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1646, 'STEPHEN MAURICE SUTTA', '744414502', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1647, 'MRS. SUTA', '744414502', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1648, 'WILLIAM A. NYAMULELO', '756582313', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1649, 'LOVE W. NYAMULELO', '756582313', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1650, 'MESHACK W. NYAMULELO', '756582313', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1651, 'ELISHA W. NYAMULELO', '756582313', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1652, 'DESUNCHE LEMUNGE', '754867798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1653, 'SHANGWE LEMUNGE', '754867798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1654, 'ATUKUZWE L. LEMUNGE', '754867798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1655, 'HALELUYA L. LEMUNGE', '754867798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1656, 'AMEN L. LEMUNGE', '754867798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1657, 'NESIA G. SEMIZI', '786050603', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1658, 'ANUCIATA F. LUNGU', '755872667', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1659, 'MARCELA F. LUNGU', '685405463', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1660, 'MARIA IGOMBE', '719861928', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1661, 'RAYMOND SELEMAN', '655757094', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1662, 'AINES MANKA', '622446379', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1663, 'DEBORA MABULA', '624386890', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1664, 'JOHN V. MASIMO', '783393501', 1, 1, '300000.00', '0.00', '300000.00', 1, 0),
(1665, 'MARY ARON MBANGWA', '712889711', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1666, 'MATHEW M. ALOYCE', '767596085', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1667, 'EZEKIEL D. MAJALIS', '758095964', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1668, 'AYUB A. MASALU', '656694380', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1669, 'EMANUEL GHAINA', '672578854', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1670, 'ELVIS', '683725280', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1671, 'BRENDA', '654833317', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1672, 'MBWANA A. KIUTA', '787057940', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1673, 'SARA SANGA', '754840017', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1674, 'EMMANUEL MATERU', '717430287', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1675, 'MRS. MATERU', '717430287', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1676, 'FRANK MATERU', '677282865', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1677, 'MRS. FRANK MATERU', '677282865', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1678, 'ROSE MATERU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1679, 'JOHN EDDY OLIVER', '621216131', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1680, 'AMBROSE MAULANA', '767252270', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1681, 'SOFIA MAULANA', '767252270', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1682, 'MRS. AMBROSE MAULANA', '767252270', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1683, 'STELLA MAULANA', '767252270', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1684, 'MOHAMED AHMED', '713317788', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1685, 'MRS. MOHAMED AHAMED', '713317788', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1686, 'LOTTERN Y. CHIDUO', '655607082', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1687, 'MRS. CHIDUO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1688, 'FRED OSMOND TAWETE', '784218422', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1689, 'MRS. TAWETE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1690, 'ENDULU N. MATUNU', '784337521', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1691, 'MRS. MATUNU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1692, 'STONED P. KIMAMBO', '755786837', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1693, 'MRS KIMAMBO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1694, 'VICTOR MPANDE', '769408507', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1695, 'MRS. MPANDE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1696, 'MAX JOHN', '715547812', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1697, 'MRS. MAX JOHN', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1698, 'ALBERT P. SALEWA', '745575770', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1699, 'MRS. SALEWA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1700, 'CLAUDI V. MASAWE', '783466567', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1701, 'MRS. MASAWE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1702, 'HERMAN R. MSENZEVALA', '659549167', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1703, 'MRS. MSENZEVALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1704, 'YOHANA S. SEKUBA', '655593665', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1705, 'MRS. SEKUBA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1706, 'PLASID S. TARIMO', '673713950', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1707, 'MRS. P. TARIMO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1708, 'ADELA A. MBEIKYA', '689138526', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1709, 'CLETUS A. LAINI', '785190662', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1710, 'MRS. LAINI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1711, 'GEOFREY MASAWE', '673239541', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1712, 'MRS. G. MASAWE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1713, 'SAMUEL E. HOZA', '718017971', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1714, 'MRS. HOZA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1715, 'PETER FARES MATERU', '655410150', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1716, 'MRS. P. F. MATERU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1717, 'WILBERT S. MAIGE', '753676770', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1718, 'MRS. W. MAIGE', '764541219', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1719, 'MIKIDADI ZITIYE LEGEZA', '716209139', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1720, 'BENADETA TAWETE', '718830640', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1721, 'EMMANUEL MUNYUKI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1722, 'CATHERINE OSMUND', '718830640', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1723, 'ISABELA D. CHILUMBA', '756795649', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1724, 'ERNEST TAWETE', '754406298', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1725, 'ELISHA W. SHILINGI', '652222582', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1726, 'HEKIMA TEMATEMA', '715298692', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1727, 'ERASTUS MTUI', '789333999', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1728, 'MRS MTUI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1729, 'ALEX NTAMATUNGIRO', '785421404', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1730, 'JAPHET TEMU', '783234322', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1731, 'GAUDENCE MBISHI', '684543102', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1732, 'AMBORSE CHUWA', '713553561', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1733, 'PETER CHUWA', '718028276', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1734, 'ISDORI MWANYILU', '717964767', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1735, 'PATRICK SANGWE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1736, 'MBWANA MALUMBO', '713565502', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1737, 'ALBERT NTUKULA', '716127128', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1738, 'JUMA ULINZO', '679676848', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1739, 'VEDASTUS MANG\'WELA', '717309475', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1740, 'JOEL KABEZI', '756084513', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1741, 'FABIAN SHUGHULI', '768630333', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1742, 'DR. CHUBWA EDWARD', '716217820', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1743, 'ENOCK SIMON', '714939559', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1744, 'EVARIST SEBASTIAN', '688362586', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1745, 'MOHAMED MOHAMED', '685085237', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1746, 'GEOFREY TENGA ', '682626276', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1747, 'JOHN J. MAZENG0', '689788160', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1748, 'SILVIN I. MONGELA', '765200200', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1749, 'GETRUDE MONGELA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1750, 'BAHATI SAMILANI', '653267554', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1751, 'SILVIN D. SHIRIMA', '784025438', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1752, 'ADAM H. LWENO', '717199930', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1753, 'GERLAD MLAKI', '658034934', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1754, 'ABIUDI NALINGIGWA', '784788523', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1755, 'ASUPYA B. NALINGIGWA', '784670955', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1756, 'ASTERIA MASANJA', '687019519', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1757, 'BEATRICE WILLIAM', '786173636', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1758, 'MARIA BEANALO', '688902956', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1759, 'FATUMA I. MKWELA', '714144821', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1760, 'SHABAN MSEMBELU', '788081515', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1761, 'ZAINABU KITANGO', '655442637', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1762, 'EXAUD P. LWEMBO', '789893371', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1763, 'ELIUD C. MRINGO', '773607748', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1764, 'HAMIS R. MFALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1765, 'MDATHIRU LUSHAKA', '788587201', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1766, 'DEO EDWARD LABALA', '767746806', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1767, 'ASIA H. BALOZI', '654040379', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1768, 'MUSSA A. MBARUKU', '684434128', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1769, 'E. D SHIRIMA', '788489402', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1770, 'DANIEL B. BUKUKU', '752246525', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1771, 'MTANI L. LUGINA', '784484909', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1772, 'JUMA J. SWEDI', '719477825', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1773, 'IBRAHIM D. SHIRIMA', '658475808', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1774, 'HAIKA M. BENSON', '745444409', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1775, 'HOPE S. PETER', '658123893', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1776, 'BONIPHACE KIMUGU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1777, 'AGNES M PAUL', '686009922', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1778, 'DOTTO A. MBARUKU', '685925214', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1779, 'GASTOR J. TARIMO', '676175300', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1780, 'YASINTA NGAILO', '784916637', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1781, 'SAID MAKURUKURU', '733249157', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1782, 'MICHAEL MUNGURE', '754290666', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1783, 'RICHARD T YONAK', '767394554', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1784, 'KAZI MADUHU KANGA', '753650529', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1785, 'SHABAN I SALUMU', '675162790', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1786, 'ETENOW DESI NASOMBA', '684817763', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1787, 'VERONICA W. NGAILO', '744455338', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1788, 'CAESAR SARMANIS', '784282230', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1789, 'MRS. SEKWAO', '754608798', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1790, 'MRS. CAESAR SARMANIS', '784282230', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1791, 'MRS JOEL KABEZI', '756084513', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1792, 'MRS. GEOFREY TENGA', '682626776', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1793, 'MRS. SILVIN D. SHIRIMA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1794, 'MRS. GERALD MLAKI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1795, 'MRS. MRRINGO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1796, 'MRS. H. MFALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1797, 'MRS. DEO LABALA', '767745806', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1798, 'MRS. M LUSHAKA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1799, 'MRS. MBWANA MALUMBO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1800, 'EDWARD MZUNANDA', '746437772', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1801, 'C. KALUGENDO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1802, 'MRS. ZAWADI KARUGENDO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1803, 'IRENE J. KABALYENDA', '715694840', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1804, 'SHARON J. KABALYENDA', '653559539', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1805, 'CHRISTOPHER KIMARO ', '715123326', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1806, 'LEOKARDIA KIMARO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1807, 'NEEMA KIMARO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1808, 'JULITHA NJAU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1809, 'JOHN GERLAD MHAGAMA', '754085130', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1810, 'PRISCILA LINDA MSIGWA', '715078070', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1811, 'ILLUMINATA FOCUS KISHI', '754323379', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1812, 'JUDITH DAVID MANDOA', '712557030', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1813, 'NAOMI KUSEKWA', '787434236', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1814, 'MADIA KUSEKWA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1815, 'MAGADULA KUSEKWA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1816, 'AVELINA KUSEKWA', '787434236', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1817, 'FULGENCE MAPALA', '718963370', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1818, 'HONOLINA MAPALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1819, 'ANNA MAPALA', '714793510', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1820, 'ESAYA MAPALA', '718963370', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1821, 'AIDAN MAPALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1822, 'EUPHRASIS LYIMO', '755894101', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1823, 'HEMED CHUMA', '784440484', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1824, 'HADIJA S. KILLO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1825, 'RAMADHAN Y. MWANGI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1826, 'CHUMA HEMED', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1827, 'NICKSON ROBERT', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1828, 'VICENT IBRAHIMU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1829, 'MOHAMED HEMED', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1830, 'RASHID KIXUNGU BWAGO', '784406090', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1831, 'MIRIAM ISACK KABUJE', '784746965', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1832, 'ZAINABU SALIMU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1833, 'RAMADHAN JUMA BAYA', '699495708', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1834, 'REHEMA YOHANES NYEMBA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1835, 'SAID MASUPI', '718529660', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1836, 'MWASITI ATHUMAN', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1837, 'MASUDI SAID NYALA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1838, 'DEVOTHA JUMA GILION', '713966315', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1839, 'FRANK GABRIEL MASAWE', '653716145', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1840, 'ANNASTAZIA NGOWI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1841, 'RONALD S. TARIIMO', '712968885', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1842, 'SULEIMAN . BARUANI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1843, 'DANIEL ABDALLAH SALUMU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1844, 'MARY AMOS MBAULE', '765816377', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1845, 'SAUDA ABDALLAH SALUMU', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1846, 'JOFREY SIMON ', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1847, 'TAUSI SAID SADICK', '628468494', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1848, 'FRANK KIGWA THOBIAS', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1849, 'MASELE R. PENZA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1850, 'YUSUF SHABAN HAMIS', '784917623', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1851, 'JAMILA OMARY', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1852, 'ABUBAKAR KIMARO', '718452559', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1853, 'BAHATI JUMANNE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1854, 'IRENE PHILIP KAMILI', '689638814', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1855, 'STANSLAUS J. MATIMULA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1856, 'WILBROAD DANIEL', '693153408', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1857, 'FLORA JACOB', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1858, 'ALFRED WILBROAD', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1859, 'NOBERT BUKUKU', '713908054', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1860, 'CECILIA P. KILIMANJARO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1861, 'ADOLF P. KILIMANJARO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1862, 'RACHEL J. MLEKANG\'OMBE', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1863, 'ADAM Y NGONYANI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1864, 'LATIFA BEBETO', '653968521', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1865, 'YUNUS PETRO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1866, 'LATIFA ALLY SELEMAN', '742946751', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1867, 'IDD OMARY SELEMAN', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1868, 'REGINA LEORNAD', '753093220', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1869, 'FILBERT LEORNAD', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1870, 'JAPHAT STEPHANO MAGANGA', '712234510', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1871, 'FELISTER MAGANZI', '683289674', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1872, 'SAID OMARY MTINDO', '656108441', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1873, 'ZENA SOLOMONI PRATIN', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1874, 'SEDAS LEO', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1875, 'DEUS DENIS', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1876, 'DANIEL ALLY', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1877, 'ALAWI ISAKA', '754586815', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1878, 'SOPHIA ISSA', '754851195', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1879, 'JACKLINE RICHARD', '788817849', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1880, 'AGIAS ARSENAL', '689504145', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1881, 'GRACE JOSHUA', '715782034', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1882, 'ROSEMARY SHABAN', '658008725', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1883, 'BATUL ABDALLAH', '653525290', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1884, 'ALLY SAID', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1885, 'ELIZABETH KISANGA', '754888899', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1886, 'MARY GABRIEL MBUYA', '788904770', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1887, 'PRAYGOD TESHA', '717193688', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1888, 'IMELDA YOVITI', '654167989', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1889, 'LEONTINE NKEBUKWA', '716662695', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1890, 'DIANA NKEBUKWA', '658323480', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1891, 'GWANTWA NKEBUKWA', '754934113', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1892, 'ARON NKEBUKWA', '787667836', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1893, 'AISHA KWAGILA', '694166980', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1894, 'GOODLUCK NKEBUKWA', '783452867', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1895, 'MOSES NAENGA', '622296746', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1896, 'NAETWE SABURI', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1897, 'JOSEPH RWEGASIRA', '679421421', 1, 1, '3000000.00', '0.00', '3000000.00', 1, 0),
(1898, 'MRS. JOSEPH RWEGASIRA', '', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1899, 'SHUKRANI SAMSON CHENGULA', '758732898', 1, 7, '0.00', '0.00', '0.00', 1, 0),
(1900, 'MAURICE MDOE', '659730464', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1901, 'PAUL MDOE', '712152752', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1902, 'MZEE KAJOLE', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1903, 'RUBEN KALINDIMYA', '713217170', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1904, 'CHARLES MWAMPULO', '719756574', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1905, 'PAULINA EMMANUEL', '710212240', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1906, 'ABUBAKARY', '745438183', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1907, 'THOMAS MAHOO', '659545996', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1908, 'GETRUDE MSANGI', '745360968', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1909, 'ASNAT JOHN MWAKALINGA', '689466311', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1910, 'JULIANA', '694269055', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1911, 'WESTON', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1912, 'MLINGI', '756305988', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1913, 'MAYASA SHARIFU MGABO', '713297674', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1914, 'MZEE MWASE', '767751902', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1915, 'MZEE HERI', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1916, 'MZEE MHAGAMA', '788269890', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1917, 'TAUSI RAMADHAN', '789282889', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1918, 'DR. MAHOO', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1919, 'PROF KAHAMBA', '786721680', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1920, 'MZEE LUBINGA', '689208953', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1921, 'PROF MKANDALA', '713414410', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1922, 'VICTORIA MABEYO', '763363140', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1923, 'OTARO', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1924, 'FINA MTANGALWA', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1925, 'TINA JOSEPH', '717764864', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1926, 'RWAKYOMA', '762042483', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1927, 'IAN ODUNGA', '713521918', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1928, 'LADSLAUS RUMANYIKA', '713188134', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1929, 'ESTHER LWELA', '756705127', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1930, 'ANDREW MTANGALWA', '', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1931, 'ARNOLD PONTETIN', '756766216', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1932, 'TEKLA RAMSEY', '655343256', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1933, 'BEATRICE MWALIPOSA', '744817896', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1934, 'EDGER MPAZE', '692499019', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1935, 'RAJAB MSHINDO', '754242030', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1936, 'HABIBA KIGODA', '693298197', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1937, 'ISACK', '684859667', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1938, 'JOHN', '744235771', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1939, 'SAMSON MOLELA', '713427030', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1940, 'MICHAEL KAMUKULU', '765295465', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1941, 'RASHID MONGES', '765595647', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1942, 'HOISE KIMAMBO', '746617302', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1943, 'HERI JAPHET', '788887595', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1944, 'TUBANTIZIBWA GULAYI', '766606162', 2, 1, '0.00', '0.00', '0.00', 2, 0),
(1945, 'RABIA ALLY MOYO', '719541483', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1946, 'IMANI ALPHONCE NUNGU', '658145215', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1947, 'ASHA ARIM', '752505215', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1948, 'DENIS DAVID SHIRIMA', '719767210', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1949, 'LUCY GENES TESHA', '719767210', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1950, 'ZENA GIDION MKAMA', '718794433', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1951, 'BRANDINA MVUNGI', '672661879', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1952, 'ASMA MAJID', '687381910', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1953, 'FOTUNATA CLAUD MOSHA ', '756903169', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1954, 'RITHA ALBERT MAONE', '712680361', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1955, 'KENNETH ADELINI MASIKA', '712680361', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1956, 'RAHMA JUMA MGASA', '714985879', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1957, 'FARIS JUMA MGASA', '714985810', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1958, 'MOHAMEDI JUMA MGASA', '714985819', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1959, 'ZAINABU ISSA MUSOKE', '714985819', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1960, 'GOODWICK KOMBA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1961, 'JESSY ESTONI MUSHI', '654643028', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1962, 'MOUREEN JAMES MOSHA', '673642038', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1963, 'ESTER GODFREY MUSSA', '673642038', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1964, 'EMMANUEL MARCO', '765917388', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1965, 'CHRISTINA MWAISEMBA', '765316970', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1966, 'GEORGE FRANK OWECA', '655244502', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1967, 'RAMADHANI A KALOM', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1968, 'EMMANUEL MAIKO', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1969, 'FELISTA EMANUEL MAKENZI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1970, 'AGNES EMANUEL MAKENZI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1971, 'MAGE EMANUEL MAKENZI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1972, 'BONISO JULIUS TARIMO', '716633234', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1973, 'IDDY HASANI ATHUMANI', '653171614', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1974, 'SHUKURU MASSAWE', '788821374', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1975, 'ELIAH MAKOMELO', '752174981', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1976, 'RADHIA SEFU', '684608122', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1977, 'MOHAMED SALUMU', '787914819', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1978, 'NICKSON SLYVETAR', '655207780', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1979, 'MOSHI JAFARY', '657708103', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1980, 'PAULINA ANTONI', '684996310', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1981, 'JOVIN JULIUS', '678464894', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1982, 'CHERRY JUMA', '699495456', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1983, 'MECKY THADEO', '699498486', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1984, 'JULIANA NGOWI', '767900748', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1985, 'JOHNSON TARIMO', '752550026', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1986, 'AGNES GODWIN SUMALI', '784771281', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1987, 'GODWIN ISALI SUMALI', '784976810', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1988, 'ANAMARIA GODWIN SUMARI', '689666888', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1989, 'MARY MICHAEL RAMBAU', '713695563', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1990, 'MARIA ALOYCE TOUWA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1991, 'LUCIANA FLORENCE TEMBA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1992, 'AGUSTINER AURELIANI MALIWA', '634459516', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1993, 'ELIZABETH HERDDY MUSHI', '654470372', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1994, 'DIANA IBRAHIM FUIKO ', '692096157', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1995, 'FIDELIS SALVATORY MKOTA', '692096159', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1996, 'IRENE JOHNS MATARI', '755787803', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1997, 'FLORENCE R KELLEN', '713412552', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1998, 'PETER WILLIAM', '713522168', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(1999, 'JOHN WILLIAM', '655512538', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2000, 'LILIAN ASTON', '626377595', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2001, 'PENINA ANDREA', '688196365', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2002, 'EZEKIEL SALVATORY ', '682409458', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2003, 'ASHIRAFU ABUU', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2004, 'AISHA IBRAHIM', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2005, 'ZAWADI ATHUMANI', '653458175', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2006, 'ATHUMANI RASHID', '653458175', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2007, 'PETER ZEHE', '652419744', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2008, 'SARA SWEDI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2009, 'MAGRETH PETER', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2010, 'AGNES PETER', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2011, 'BENI BWILE MASATU', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2012, 'SHABANI KINAWILO', '693274063', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2013, 'IRENE JUMA', '716287430', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2014, 'OMARI RASHID', '744201674', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2015, 'NEEMA AMOSI', '688885464', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2016, 'RASHIDI MBUMA', '699228498', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2017, 'BETINA BWILE MASATU', '755318925', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2018, 'INOSENTI MAYUYA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2019, 'DENIS NCHIMBI', '655573569', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2020, 'TEDI SAMWELI', '783159580', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2021, 'THOM NCHIMBI', '763107001', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2022, 'BONIFACE NCHIMBI', '716484963', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2023, 'TATU OMARI', '714669965', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2024, 'FURAHA JERADI', '682480604', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2025, 'AHEMED SAID KAISI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2026, 'AMINA ADAM', '676970733', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2027, 'SAID MOHAMED KAISI', '716948738', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2028, 'REGNA MPULILA', '684320625', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2029, 'ASEDI MAURID', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2030, 'LUCY MWAKANOLO', '752363817', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2031, 'DIONIS DIDAS', '76607953', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2032, 'GRACE GASPAR', '745398067', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2033, 'DICKSONI GASPAR', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2034, 'TUKAE CHUMA', '656793900', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2035, 'ENOCK MALISA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2036, 'MATRIDA ALLY BALAWAZI', '715220216', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2037, 'NANCE ANTONI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2038, 'CLEOPHACE D MAKWAYA', '754365160', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2039, 'MUSSA MBAYA', '718401766', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2040, 'MAINDA HATIBU', '692587332', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2041, 'JUDIKA UROMI', '656803274', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2042, 'AGNES FRANCIS', '787824124', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2043, 'ESTER JOHN', '693724246', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2044, 'FEBRONIA FAUSTINE', '687972780', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2045, 'JUMA SELEMANI', '712477089', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2046, 'ZAITUNI SAID', '712477089', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2047, 'AMIRI NGALINGA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(2048, 'IBADANI MATATA ', '756765644', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2049, 'JAMILA MATATA', '756765644', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2050, 'PANTALE', '747961402', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2051, 'NGOMA MBAGO', '784325255', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2052, 'DEVOTHA P MBAGO', '784943771', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2053, 'TANSIANA G MAHONDO', '759034665', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2054, 'JULIUS MCHARO', '784462633', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2055, 'IRENE J MCHARO', '658626333', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2056, 'LILIAN  J MCHARO', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2057, 'JAMES  J MCHARO', '622434742', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2058, 'JUDITH  J MCHARO', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2059, 'JOHNSON  J MCHARO', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2060, 'ELIABU S NYENZE', '657877991', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2061, 'RUTH S NYENZE', '712149120', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2062, 'MWAJUMA SINGO', '782983321', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2063, 'ASIA SWEDI', '768921084', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2064, 'SILA NDALIMA', '622281586', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2065, 'ANAMRINGI KALALU', '659941458', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2066, 'YUNIS A KALALU', '716184984', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2067, 'MICHAEL MICHAEL', '762462518', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2068, 'ATHUMANI JUMANNE ', '715560858', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2069, 'BONIVECHA FABIAN', '787374025', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2070, 'PETER KALALU', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2071, 'AMINA KIWANGA', '718200718', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2072, 'SESILIA DANIEL', '789771330', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2073, 'ZAMDA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2074, 'STELLAH TESHA ', '769848576', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2075, 'TUNGARAZA DEOGRATIUS ', '786986244', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2076, 'BEST TUNGARAZA ', '659298638', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2077, 'DIANA BEST', '759172883', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2078, 'ELIUD HAULE', '71851576', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2079, 'ALOICY NDALIO', '712322384', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2080, 'LEU STEPHANO', '762111055', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2081, 'MINA SHAINELI', '762272190', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2082, 'MWAJUMA KASIMU', '784224901', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2083, 'UPENDO PALLANGYO', '769510731', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2084, 'PETRONILA JOACHIM', '685208864', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2085, 'SAMIRA MAHMOUD RATANSY', '754215412', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2086, 'EDDIE EDWARD MHINA', '767210667', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2087, 'EDWARD HIZA MHINA', '754340488', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2088, 'JANE EMANUEL', '717703218', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2089, 'MUSSA ABDALAH AMANI', '776815591', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2090, 'SAMWEL J MHINA', '754262690', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2091, 'EVELYN J MHINA', '746768714', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2092, 'MOHAMED YAHAYA', '746768714', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2093, 'EDITHA GEORGE', '693197935', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2094, 'TABITA LUBANTI', '716864224', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2095, 'EVANS A LWAMBANO', '715886725', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2096, 'VERONIKA MWITA', '672810362', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2097, 'JOSEPH I MAONA ', '785060074', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2098, 'CORETA KOMBA', '744650490', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2099, 'JOHNSON J MWAFUNGO', '626981550', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2100, 'JOSEPH CHALES ', '689721742', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2101, 'DAVID EZEKIEL', '626981550', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2102, 'EFREM A LWAMBANO', '654838425', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2103, 'CLEMENCE ELIAH ', '769301897', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2104, 'BARAKA MICHAEL', '754303200', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2105, 'STEVEN MSEKWA', '729301897', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2106, 'MOHAMEDI JUMA ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2107, 'MBELA OMARI', '677308541', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2108, 'EVA NUNGU', '715502920', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2109, 'GROLIA IBRAHIM', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2110, 'RITHA MBOTO', '0784340299', 2, 2, '300000.00', '300000.00', '0.00', 2, 1),
(2111, 'MALKIA KATNISS MKUCHU ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2112, 'NUNU MKUCHU', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2113, 'NASMAH AMIR', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2114, 'WITNEY LYSON ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2115, 'ADELAIDE LYSON', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2116, 'WAZIRI AMIR', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2117, 'ELIZABETH CHARLES', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2118, 'GASPES MCHANGA', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2119, 'JULITHA TARIMO ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2120, 'NEDRICK SWAI', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2121, 'SAYUNI EDWARD', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2122, 'MARIA PATRICK', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2123, 'HAPPINESS MMANDA ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2124, 'AGREY UWISO', '784340299', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2125, 'WILISON MALISA ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2126, 'DINA MALISA', '652500178', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2127, 'JOICY ', '753430000', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2128, 'SKOLA NGABAA', '753430000', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2129, 'GODI AGUSTINO', '753430000', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2130, 'ALPHA MREMA', '788735136', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2131, 'LINDA MWAMUKONDA', '628449885', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2132, 'AISHA HAMZA', '628449885', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2133, 'FROLA W NGONGO', '784307401', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2134, 'BETHA S MNGONGO', '682995263', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2135, 'JOSEPH LISU ', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2136, 'NURU JOSEPH', '', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2137, 'ZULEHA MZAMILU SALIMU', '785373717', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2138, 'MARIAM YOLAMU DALAU', '694435536', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2139, 'FADHILA RAMADHANI ', '745484960', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2140, 'BIDALA MOHAMED MWANDUGU', '754444134', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2141, 'SHAFI O ODDO', '769301897', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2142, 'VUMI KOMBA', '675879585', 2, 2, '0.00', '0.00', '0.00', 2, 0),
(2143, 'KARIBI MOHAMED ISIMA', '719103883', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2144, 'ASHAM HAMED', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2145, 'BAHAT  KARIBI  MOHAMED ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2146, 'RASHID KARIBI MOHAMED', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2147, 'BAKARI MAKABA INASIO', '784221326', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2148, 'NURU MASOUD MTONO', '719527558', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2149, 'VENERANDA MKUNDI', '713395787', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2150, 'SHUKURU MKUNDI', '714624707', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2151, 'NISILE NAZALTH ', '655974165', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2152, 'JOYCE JOHN', '694058437', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2153, 'PAUL JOHN', '764102302', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2154, 'TINA HENRY', '758616122', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2155, 'GEORGE LWENA', '682169934', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2156, 'JENIPHER SAMWEL MAHIMBO', '712682312', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2157, 'EMMANUEL  ANDANGISE KASEBELE', '757734531', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2158, 'PETRO EMMANUEL MULO', '785543422', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2159, 'MWAJUMA ALLY MOHAMED', '699507451', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2160, 'GELEMANA GIZIBETH HAULE', '755970398', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2161, 'GLORY NYALANDU ', '782813227', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2162, 'SULEMAN  MARCHELO NYAULOVA', '716239696', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2163, 'KARIM MWASANGA ', '719527573', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2164, 'JAMALI ABDALA ', '788120867', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2165, 'ZAINABU ABDALA ', '745659754', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2166, 'AKIDA RAMADHAN MWAIMU', '715595968', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2167, 'SALMA RAMADHAN MWAIMU', '716686844', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2168, 'RAMADHAN AKIDA MWAIMU', '621562194', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2169, 'RASHID AKIDA MWAIMU', '684811778', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2170, 'HAMISI OMARI MPOLA', '787708897', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2171, 'MWANAID ALLY JUMA', '787708897', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2172, 'IBLAHIM HAMISI MPOLA', '787708897', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2173, 'EDWINI NGASA ', '683552558', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2174, 'JANETH MBWANA ', '788817668', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2175, 'IBRAHIM YUSUPH ', '613140646', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2176, 'DORICE HAULE', '689859777', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2177, 'FATUMA KUNAMBI ', '789901214', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2178, 'RAMADHAN', '719527588', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2179, 'KHADIJA ', '719527589', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2180, 'IDDY ', '719527590', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2181, 'BARAKA ', '716664899', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2182, 'KIFOT SAMWEL MWADWAN ', '758570516', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2183, 'ISSA SALMU ', '719527593', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2184, 'ADIJA SAID ', '784885608', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2185, 'GEORGE ISSA ', '612484282', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2186, 'JOYCE SAWALA ', '612484282', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2187, 'ROSE ALEXSANDER ', '657282597', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2188, 'JOYCE SAWALA ', '719527598', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2189, 'SHAN RASHID ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2190, 'FRANK MNYAMBWA ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2191, 'LUCY KTALE ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2192, 'RAMADHAN HASSAN', '717013277', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2193, 'WITNESS LUCAS ', '684977149', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2194, 'JESCA NASHIPAI  ', '697647803', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2195, 'ADAM LIVINGSTONE ', '763304081', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2196, 'JAKSON SEMBEO ', '786828530', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2197, 'BIBI LEMBRIS ', '786828530', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2198, 'LAURENCIA KIWEMBO ', '713607455', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2199, 'JOHN KIWEMBO ', '717111312', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2200, 'GIDEON S SONGORO', '719540033', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2201, 'ELIZABETH J KANKILA ', '713869603', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2202, 'KULVERT G SONGORO', '786929702', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2203, 'lUSY  A BAKARI', '655999748', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2204, 'GUDILA J MASSAWE ', '763178622', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2205, 'SOPHIA I MGUNYA', '717077802', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2206, 'SOPHIA O MCHAPANGOZI ', '786569713', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2207, 'OLIVA W SULLEY', '692546448', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2208, 'CATHERINE SULLEY ', '692549248', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2209, 'MARIAM ISSA ', '717450557', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2210, 'FARIDA SWALEHE ', '766260928', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2211, 'SARAH MAGOVA', '788276856', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2212, 'JACOB SEMBUCHE ', '788276346', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2213, 'FATUMA RAMADHAN ', '783151654', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2214, 'DANIEL MHINA ', '692727670', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2215, 'JOHN DANIEL ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2216, 'IMELDA NYIGO ', '782233083', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2217, 'LIBERATUSY NYAKUNGA ', '658312977', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2218, 'WILLA MBWAMBO ', '779902358', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2219, 'ROZILIA MOHALAWA', '784369277', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2220, 'SALAMA BAKARI NYAMBO ', '718293499', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2221, 'MASHAKA HABIBU ', '685353750', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2222, 'ROGATI JONAS', '659874644', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2223, 'GALLOS BONFSCE  LYIMO', '713631725', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2224, 'LULU ISSA HEMED ', '713631725', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2225, 'RAMSEI RABAN SWILLA ', '754441706', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2226, 'ZAINAB BUKULI RABAN ', '772998802', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2227, 'GODFLEY RABAN SWALLA ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2228, 'ELISHA MGISHA ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2229, 'ROSE  SWILAHA ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2230, ' SAMWELI RAMSEY', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2231, 'FATUMA ASUMANI ', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2232, 'ISAYA J MBILINYI', '652276611', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2233, 'VICTORIA MUHANDO', '716360161', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2234, 'AMRI CHEMBE', '685909694', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2235, 'KHAMIS RASOUL', '713553434', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2236, 'ARNOLD KISIRAGA', '768608877', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2237, 'GRASE N KISIRAGA ', '754319732', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2238, 'FARAJA APROCA', '714027717', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2239, 'AZAKI MASAWA', '694440955', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2240, 'JOYCE NGONYANI', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2241, 'HABIBA HAMISI NGALALA', '789929576', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2242, 'PAULO FILEMONI', '693554948', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2243, 'VERONICA MKWALA', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2244, 'DONASIAN LUHUNGA', '713105609', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2245, 'SAIDI HASSANI MWANA', '786727420', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2246, ' HABIBA RAMADHANI', '787293712', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2247, 'AHAMAD HASANI UGOMBA', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2248, 'MWANAHAMISI HASSANI', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2249, 'KAIMU HAMADI UGOMBA', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2250, 'TAUSI HAMADI UGOMBA', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2251, 'LEA LUPANDA', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2252, 'ATHUMANI JUMA', '719561812', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2253, 'REMEN MASAWE', '767255200', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2254, 'DOMINA WAGWENE', '717964199', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2255, 'DAVID WAGWENE', '785757742', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2256, 'DINAEVA MADEMBWE', '755311557', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2257, 'JACKLINE MADEMBWE', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2258, 'DOMINIC LUCAS', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2259, 'PETER KANUTI', '710288027', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2260, 'SAUDA HAMISI', '711780314', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2261, 'WAZIRI BARNABAS', '719095633', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2262, 'MAKAMbI KINEMO', '782582296', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2263, 'SAMWELI KUWE', '785385669', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2264, 'KIHOMENI WELENDI', '754334934', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2265, 'KITRA KILUJI  (shida jina)', '764942372', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2266, 'MENGSEY KASEN', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2267, 'DIALUFI KIRENGE', '784388922', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2268, 'ELISONI M KASERA', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2269, 'STIVINI I .MASAWE', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2270, 'TITO STEPHANI', '714696771', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2271, 'FELISIA JONASI', '752732424', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2272, 'ESTERIA GISAWA MRIGO', '655386221', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2273, 'ROSE NYANGI NANAI', '786994688', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2274, 'WAKURU NASORO', '655386221', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2275, 'MARTIN MUHAMADI', '688575281', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2276, 'MARIA MARTIN', '', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2277, 'DEODATA MGUNDA KAPANDE', '693167697', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2278, 'JOSIAH MATAGANE', '655308555', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2279, 'JANE KIHAULE MATAGANE', '767803008', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2280, 'PROF. WINESTER ANDERSON', '735000330', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2281, 'MERISIANA PAULO', '  ', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2282, 'JOHANES GEBWA', '684725446', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2283, 'FRANK .J. GEBWA', '  ', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2284, 'ALFREDY GEBWA', '  ', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2285, 'TWAHA JUMA ISMAIL', '718210328', 2, 4, '0.00', '0.00', '0.00', 2, 0),
(2286, 'ZAHARA M TALOHO', '718263430', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2287, 'HASSAN HILUKA ', '654960356', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2288, 'HAPPY KIMAKO', '682964742', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2289, 'ROSE KIHWELO', '783461301', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2290, 'FROLA REWADI', '624021301', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2291, 'ROSE ', '674711172', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2292, 'STEPHEN ALMAS', '758246655', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2293, 'UPENDO JACKSON', '757048845', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2294, 'BONPHACE JACKSON ', '753011188', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2295, 'EMMANUEL ALMAS', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2296, 'BATULI ALLY JUMA', '652502193', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2297, 'EVELINE MOSES MAHIMBO', '689184229', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2298, 'ELISHA JOSEPH ', '786173428', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2299, 'JUMA SAIDI MKWALA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2300, 'BARAKA NASA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2301, 'CHACHA NASA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2302, 'DANIEL PAUL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2303, 'MARIAM NASA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2304, 'MAKENZI NASA ', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2305, 'MAKENZI SHIJA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2306, 'SEIF MOHAMED ', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2307, 'MUDI AYUBU', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2308, 'ASUMANI MOHAMEDI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2309, 'HUSSEN MBOTO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2310, 'SADEM HUSSEN', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2311, 'FATUMA RASHIDI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2312, 'SUMAIA SULEMAN', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2313, 'RAHMA KANAMONA', '719816525', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2314, 'MARIAM SHABANI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2315, 'VERONICA DAVID', '692223494', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2316, 'MWANAHAMISI NYAWENGA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2317, 'TAUSI METHEW', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2318, 'ABDULI YASINI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2319, 'JASMINI MWINYI', '655620691', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2320, 'JUMA MNYIKA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2321, 'AISHA HAMISI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2322, 'DOTO MUKARI', '765767533', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2323, 'TEDY CHIMAGU', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2324, 'NEEMA CHARLES', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2325, 'AGNES SABURI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2326, 'DIKSON MKINDI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2327, 'ELIA MASHEWA', '754885741', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2328, 'KAPWETE KAPILA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2329, 'VELONICA KAPILA', '757170415', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2330, 'BONIFASI KAPILA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2331, 'BAHATI SELESTINI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2332, 'JOHN MZEE SABURI ', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2333, 'MARIA GOYAYI', '754271685', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2334, 'ELIZA SABURI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2335, 'MICHAEL MZIWANDA', '687002665', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2336, 'FRENKI WILIAM', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2337, 'TINA WILLIAM', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2338, 'ZUBEDA HAMISI', '687719422', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2339, 'HABERLY MALAIKA', '685067782', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2340, 'GHATI MWITA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2341, 'MATHEW ALABI ', '788599145', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2342, 'DILAM LYIMO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2343, 'MARIAM ALLY', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2344, 'ABUBAKAR H HILUKA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2345, 'HAMZA H HILUKA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2346, 'HAGAI ANDREA', '658524621', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2347, 'HAPPY EMMANUEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2348, 'JOSEPHIN EMMANUEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2349, 'MICHAEL ANDREA', '787336822', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2350, 'EVA KOMBO', '769313881', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2351, 'FREDI MERO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2352, 'HIDAYA TWAIBU', '682425152', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2353, 'TWAIBU ABDALA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2354, 'GEORGE EDWARD', '673664730', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2355, 'ANNA GASPEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2356, 'AURELIA REDNADI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2357, 'MKUNGU MWEMBWENI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2358, 'DORKAS EMMANUEL', '744575219', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2359, 'EMMANUEL CHEBI', '766694958', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2360, 'OCTAVIAN MKUDE', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2361, 'PAULINA AMANDUSI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2362, 'AGATA TOMASI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2363, 'ZULFA SALUMU', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2364, 'HEMED FULUKU', '788038429', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2365, 'SABLINA AFRONS', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2366, 'SHADRACK W MOLLEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2367, 'EVELYNE W MOLLEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2368, 'GLORY W MOLLEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2369, 'HEAVEN P MANKY', '755767667', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2370, 'MWANAMKASI JUMA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2371, 'GIFT', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2372, 'BALTAZAL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2373, 'BUPE', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2374, 'ABDUL SALUMU MKATA', '789660317', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2375, 'SHABANI HABDULI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2376, 'NEEMA JONES ', '768889218', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2377, 'JACKLIN JONES', '767266464', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2378, 'WENCESLAUS MTUI ', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2379, 'FLORA MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2380, 'FORGIVEN MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2381, 'PRINCE MTUI', '683068804', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2382, 'DORCAS MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2383, 'EGON MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2384, 'ANGEL AGUSTIN', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2385, 'IAN MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2386, 'ABIGAIL HOSEA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2387, 'PRESIOUS MTUI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2388, 'ALLEN E MANGOMBE ', '757489449', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2389, 'EDDY ALLEN', '754704043', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2390, 'GAGA E MANGOMBE', '766103945', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2391, 'MARIA CHIRWA', '782389601', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2392, 'ERIC ERIC', '786620308', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2393, 'TECLA BENEDICTI MSHANA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2394, 'CATHELINI BENEDCTI MSHANA', '784887800', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2395, 'OSCALINUS MNGONGO', '784887800', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2396, 'PITA KIPONDA MALI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2397, 'FALIDA SHABANI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2398, 'BONAVENTULA BENEDICT MSHANA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2399, 'DANYELI STANEL', '786468111', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2400, 'TAMILOWA ANDREA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2401, 'EDITHA WEISO', '716365349', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2402, 'STANI LASWAI', '768432658', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2403, 'INNOCENT EMMENUEL', '7460737544', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2404, 'ERIC PETER CHONJO', '715676774', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2405, 'SARAH CHONJO', '746102209', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2406, 'TOBISITI AMON', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2407, 'ELINIFIKANYIA MALISA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2408, 'JAKLIN TOBISITI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2409, 'JAKSON TOBISITI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2410, 'JULIET TOBISITI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2411, 'JACKSON MACHENJE', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2412, 'VICK MLEMA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2413, 'DAYANA FRENK', '716053678', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2414, 'DANIEL RAFAEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2415, 'JONATHAN KIBONA ', '653592322', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2416, 'HAPPINESS KASOMANGASA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2417, 'PETER KIBONA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2418, 'COFORT KASOMANGALA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2419, 'MAKAA DAVID LOSERIAN', '759027816', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2420, 'EMMANUELA LUCAS DAMIAN', '653182034', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2421, 'EMMANUEL BARAKA', '692277033', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2422, 'BONIFASI KOMBO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2423, 'ANGELA MSUYA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2424, 'FESTO KILDEN', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2425, 'GRESI CHOLELA ', '784371000', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2426, 'MONICA ERASTO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2427, 'PENDO KWEKA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2428, 'NEEMA KAVISHE', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2429, 'FREDRICK MLINGI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2430, 'HELENA HALFREDI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2431, 'DEO MUGISHAGWE', '754489312', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2432, 'AYCA REUBEN', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2433, 'LISA DEO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2434, 'JACKSON MICHAEL', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2435, 'LOYCE WILSON', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2436, 'GODFREY KIWANGA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2437, 'LINA KIWANGA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2438, 'GLORIA KIWANGA', '715777806', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2439, 'JOSEPHIN KIWANGA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2440, 'ELIZABETH KIMBI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2441, 'AIDA N MWAIKWABA', '715070866', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2442, 'AZIZA SALUMU', '783289898', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2443, 'GHATI MWITA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2444, 'JOSEFINA JONASI ELIASI', '654276717', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2445, 'SUZANA JONASI ELIASI', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2446, 'TABASHAM OMARY', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2447, 'BATULI IDDI', '688166908', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2448, 'FRENKI BUJO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2449, 'ANETH BUJO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2450, 'KISWAGA KISWAGA', '788608887', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2451, 'IBRA MWALO', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2452, 'SADICK SWAGA', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2453, 'LEI ZAN', '756675923', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2454, 'SHWAA', '715675923', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2455, 'SOPHIA KONGELA ', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2456, 'MOSES', '', 2, 5, '0.00', '0.00', '0.00', 2, 0),
(2457, 'LUCY ATHANAS AMOS ', '656120543', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2458, 'SALUMU H NGALALA', '715624417', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2459, 'ALOYCE F MASUA ', '684586303', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2460, 'LETICIA ABEL', '765917621', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2461, 'JACKLINA A MASUA', '758692828', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2462, 'MARTHA CHRISTOPHER MODESTUS', '694209191', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2463, 'DOROTHY MEENA', '784214597', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2464, 'EDIGA E G', '629458029', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2465, 'GRAT ANDERSON ', '769756058', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2466, 'REHEMA ALLY', '789188955', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2467, 'EVANS LUAMBANO', '715880735', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2468, 'WITNESS SASUMA', '756283455', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2469, 'ROSE ELIAS', '764059835', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2470, 'YUSUPH HASSAN ', '755452168', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2471, 'EVANCE TEMBA', '719232823', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2472, 'LIGHTNESS SWAI', '713325982', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2473, 'MICHAEL SLYVESTAR', '719232823', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2474, 'BERTHA MGOMBELLAH ', '710348507', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2475, 'YOLANDA MUSHI', '713331838', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2476, 'JOSEPH MPAKASI', '713847084', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2477, 'HAWARD FINOGAGE', '714319567', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2478, 'ELIZA JAFARY', '788092090', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2479, 'MARCO FINOGAGE', '657120526', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2480, 'TEDY KILILI', '655609902', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2481, 'JAMES KILILI', '756002203', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2482, 'TUKAMANYA OSWOGE', '655228787', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2483, 'GERALD C MJENA', '718962798', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2484, 'GLADNESS ISINGO', '692510039', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2485, 'ALLY ELINISAFI', '659458558', 2, 2, '110000.00', '0.00', '110000.00', 2, 0),
(2486, 'RRIAN BRISON', '622906708', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2487, 'HAMFREY ZACHARIA ', '692996951', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2488, 'CARO GIFTI', '685695727', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2489, 'ALLY OMARY', '715773218', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2490, 'VERONICA ISSA', '693277867', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2491, 'VICENT A KATABALO', '755480820', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2492, 'AGNESS CHARLES', '692962671', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2493, 'IRENE J KAVISHE', '684675424', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2494, 'JOHN KAVISHE', '784453901', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2495, 'EVETHA KAVISHE', '718244380', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2496, 'JESCA A JUMA', '682532834', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2497, 'SAMWELI BARIKI MBAGA ', '712640446', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2498, 'NEEMA NGUNILA', '769988198', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2499, 'STEPHANO NGOWI', '623707289', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2500, 'HASHBAZ B SOLLO ', '786610054', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2501, 'RHAPAEL D KISIMBA', '688672015', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2502, 'DOROTHEA PETER MLOKA', '682846883', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2503, 'LAETITIA EMMANUEL SAYI', '766341491', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2504, 'EMMANUEL B SAYI', '743405635', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2505, 'EMMANUEL ANZULUTU', '766569290', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2506, 'KAJUNA BWAWA', '754711601', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2507, 'JANETH B MAKEMO', '789220606', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2508, 'ELIZABETH K MOSHY', '715370807', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2509, 'JUSTINE R MOSHY', '715750504', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2510, 'NEEMA J MOSHY', '764171849', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2511, 'DAMALISA MAZENGO', '788181862', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2512, 'MAULID IDD JUMA', '694039061', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2513, 'NAIMA OMARY', '653548020', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2514, 'SALUMU MVULE', '688887110', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2515, 'ABDALLAH MVULE', '736235084', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2516, 'MATLIDA JOSEPH MMANGA', '756737326', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2517, 'SHEDRACK NOAH SANGA', '784005933', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2518, 'RAYMOND MLANGWA SEKAZI', '676989862', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2519, 'LEA DANIEL LAZARO', '675017459', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2520, 'HAPPY MUSSA', '788421972', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2521, 'HAPPY SLYVESTER ', '692897008', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2522, 'JACQULINE JACKSON', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2523, 'VICENT CHAGENDA', '719611218', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2524, 'ASHA ISSA ', '714545897', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2525, 'STIVINI SHANGWE', '719821470', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2526, 'STEVEN F LIBALI', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2527, 'GRACE VICENT', '718686722', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2528, 'ELIZA VICENT', '786292950', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2529, 'HENDRICA C SUMNI', '628305428', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2530, 'DENIS JEREMIAH', '682820179', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2531, 'ZAINABU KIGOMA', '719004336', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2532, 'FREDRICKSON MABOKO', '759496007', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2533, 'GRANT BARAKAEL', '769566941', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2534, 'FRANCIS GABRIEL ', '685509482', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2535, 'LABAN PHILEMON', '758636122', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2536, 'ROGASIAN MELLA', '756656082', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2537, 'LILIAN SANGA', '756656082', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2538, 'EDITHA ', '756656082', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2539, 'AISA GABRIELY URONU', '754283252', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2540, 'GLORY GABRIELY URONU', '767083041', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2541, 'ELENSIAN A NDAUKA', '719712911', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2542, 'ASHA ISSA ', '711358676', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2543, 'PHILIPO L KASANDA', '673417799', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2544, 'EDINA A TEMBA ', '685857530', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2545, 'NEEMA JOHN', '787083150', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2546, 'LUCIA MCHANE', '752450708', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2547, 'KATE SEKOKOI', '769854990', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2548, 'SULESH JUMA', '759978296', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2549, 'GLORY LYMO ', '715073441', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2550, 'VESPERY ASSENGA', '754276262', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2551, 'JOSHUA ANDABWILE MWAKILONGO', '687961331', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2552, 'BARAKA JOSHUA MWAKILONGO ', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2553, 'JENNY  JOSHUA MWAKILONGO ', '627930751', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2554, 'SABINA  JOSHUA MWAKILONGO ', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2555, 'REBEKA  JOSHUA MWAKILONGO ', '693899090', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2556, 'SABINA  JOSHUA MWAKILONGO ', '689967870', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2557, 'SHABANI MTUMWA MWINYIMBEGU', '785752704', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2558, 'CHAUSIKU MWILONGO MWILONGO', '685242789', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2559, 'HABIBA SHABANI MTUMWA', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2560, 'IBRAHIM SHABANI MTUMWA', '693775371', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2561, 'ZANIFA LIKUGA', '688224308', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2562, 'MVONEWA MTUMWA MWINYIMBEGU', '688224308', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2563, 'ERICK JONATHAN KAAYA', '715242129', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2564, 'VIDES ABRAHAM KYUTA', '715990450', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2565, 'INNOCENT ABRAHAM KAAYA', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2566, 'ZAINAB KISINJA YAMOLA', '747149315', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2567, 'AMANI IDD MMASAA', '759030900', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2568, 'MWAJUMA ABEIDI KILINDILA', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2569, 'LOICE AMANI SHEMI', '743595694', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2570, 'RUKIA AMRI MFAUME', '717965033', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2571, 'WAJERE L RIBO', '659966202', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2572, 'WEGESA MAGESA RIBHO', '656996104', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2573, 'MUSSA HAMISI HASSANI', '652511318', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2574, 'FLORA GEORGE MLAY', '713821441', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2575, 'BOSCO ODILLO SEMIONO', '621991156', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2576, 'KELVIN G MLAY', '743150985', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2577, 'MWAJUMA RASHIDI', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2578, 'WILLIAM DISMAS NGOLE', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2579, 'MAGRETH WILLIAM', '68841354', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2580, 'JESSE WILSON', '758453300', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2581, 'JUDITH SUMA', '786295031', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2582, 'VIVIAN JESSE', '688160195', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2583, 'FLORENCE HOROMBE', '787421515', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2584, 'SAID KHAMIS SALIM', '772260928', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2585, 'MARIAM KHALIF SALIM', '777619899', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2586, 'ALLY KHAMIS SALIM', '778510810', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2587, 'KAREEM ROBERTH', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2588, 'SALMA KALOLO', '', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2589, 'FEISAL SALIM', '657384363', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2590, 'CHRISTOPHER F MSANGI', '713615464', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2591, 'DOROTHY A MSANGI', '688568980', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2592, 'DARLINGTON C FREEDOM', '629232688', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2593, 'MONICA TABLEY', '786160211', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2594, 'VENJA AMOSI', '686014209', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2595, 'JUMA ALLY MOHAMED', '787530310', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2596, 'ADELINA D BANDA ', '713469435', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2597, 'ABUU JUMA ALLY', '719514997', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2598, 'AWESA AMULI NNOJELA ', '676008103', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2599, 'HALIMA JUMA ALLY', '692887480', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2600, 'ZAINAB JUMA ALLY', '658250044', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2601, 'JUMA HAMAD MBEGA', '787227818', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2602, 'MATHIAS YOHANA', '766982988', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2603, 'MARTIN MOSHA', '767210171', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2604, 'MARTHA LYIMO', '627337651', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2605, 'RASHID HABIBU', '714784404', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2606, 'PROF.FESTO KAVISHE ', '787254631', 2, 6, '0.00', '0.00', '0.00', 2, 0),
(2607, 'SUZANA BYEMELWA', '755840770', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2608, 'EVA BYEMELWA ', '719419888', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2609, 'JUMA NJAMASI', '677804906', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2610, 'HAMISI MBWANA', '716182133', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2611, 'RETICIA AGUSTINO', '787648792', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2612, 'FLORIDA KAMALA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2613, 'DENIS DIONIS ', '655113691', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2614, 'EMANUEL', '746457252', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2615, 'ANDREA MPEPO', '754488953', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2616, 'OLVIA MPEPO', '767002199', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2617, 'REHEMA MPEPO', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2618, 'MARTHA MPEPO', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2619, 'BRITH', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2620, 'KARBUEL NGONYANI', '719569110', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2621, 'NGARINGA ', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2622, 'EMANUEL LWANJA', '759262572', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2623, 'HALIMA SELEMANI', '675542764', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2624, 'FABIAN COSMAS ', '674180015', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2625, 'PASCAL ULIZA', '625866760', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2626, 'ARON ULIZA', '629679814', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2627, 'FELIX NYERA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2628, 'ADAM MDEMU', '713093456', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2629, 'HABIBA MDEMU', '754820939', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2630, 'MARIAM SHABANI', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2631, 'BETHY MWAIPOPO', '763202024', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2632, 'ERASTO BATHROMEO MWAIPOPO', '718332628', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2633, 'CLALA  BATHROMEO MWAIPOPO', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2634, 'ANETH LWIZA', '687567881', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2635, 'GRACE EDWARD', '685752742', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2636, 'JOHACKIM YONGOLO', '747457777', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2637, 'RENEE RICHARD', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2638, 'GLORY SIWAA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2639, 'NICK MANFRED', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2640, 'LAZARO HEMBULA ', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2641, 'LILIAN NYANGA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2642, 'DAUD HEMBULA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2643, 'ALLY MPENDU', '654985652', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2644, 'ESTER MBISE', '659349668', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2645, 'SALIMA ALFRED', '788703043', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2646, 'SHIRANGALE', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2647, 'TATU HAMISI', '746365209', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2648, 'ALFRED CHAMUGWANA', '714873799', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2649, 'MAGRETH JOHNSON', '788468632', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2650, 'MARK CHAMUNGWANA', '655403757', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2651, 'SEWESTINA CHAMUNGWANA', '714827800', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2652, 'JOFREY FAYA', '786175484', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2653, 'GRACE KUSILLA', '789446446', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2654, 'ALOYCE DISIMASI', '716242895', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2655, 'REA PETER', '652719676', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2656, 'ANNA ALOYCE', '656066753', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2657, 'SOPHIA YUSUFU', '715985278', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2658, 'SEIFU MOHAMED', '714575077', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2659, 'ABDALLAH HASANI', '685146436', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2660, 'AWETU RAJABU', '687722459', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2661, 'HEDA PILI', '692344920', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2662, 'NURU ISSA', '628616598', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2663, 'MARKO MARTINI', '625227780', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2664, 'NICIDADY ELIAHADU', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2665, 'NEEMA ELIASI', '712873574', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2666, 'VICTOR FAUSTINE', '685298363', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2667, 'SHEDRACK PASCHALE', '753042015', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2668, 'GERAD ANDREA', '688900701', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2669, 'SALMA LUCAS', '652052333', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2670, 'IRENEUS KOMBA', '679238763', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2671, 'MALE MDAULIMALE', '714156885', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2672, 'TATU RASHIDI', '679141047', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2673, 'RAJABU MSUYA', '656283140', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2674, 'SALMA DHAILI', '655603921', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2675, 'ISSABELLA KOMBA', '679238763', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2676, 'PEDO KOMBA', '763784142', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2677, 'FAUSTINE ITANGAJA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2678, 'ETHERLUICE ITANGAJA', '768563606', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2679, 'OLOYCE ITANGAJA', '713582587', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2680, 'GERTUDE MMASSA', '714107989', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2681, 'MZUHANDA MKWEGA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2682, 'LUCIA SALOMONI', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2683, 'MUSSA MBEGALO', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2684, 'BITTONI AILLENI', '689711706', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2685, 'HAISHA SHILWA', '689711706', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2686, 'MARIAM MFUGALE', '757000132', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2687, 'JOHN AULE', '768209691', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2688, 'MAMA KOMBA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2689, 'RAFHII BAMBAKO', '787198587', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2690, 'MARIA ONESHA', '715441578', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2691, 'JOHN SHAYO', '713751902', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2692, 'JACRINE UROKI', '712966416', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2693, 'BRITHON ALLON', '689711706', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2694, 'PENDASON PHILIMONI', '754711000', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2695, 'NICOLI', '715206882', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2696, 'SHANA', '715989895', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2697, 'MOSESI MTUKULA', '756201763', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2698, 'VIVIAN BUHULA', '784898008', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2699, 'LUKAS ( BABA RECHO)', '712001050', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2700, 'MABAMBA CLEVIS PAULO', '768009009', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2701, 'KANUTI MAHENGE', '653603824', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2702, 'MARIAM NYANGALO', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2703, 'DR.FRANK J MATENGE', '715383711', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2704, 'DR.MADARO MSHUMBUSI', '789575143', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2705, 'REBEKA JAFETH', '782252353', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2706, 'STEWAT MALETHO', '659608833', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2707, 'VUMILIA', '716775528', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2708, 'REHEMA MWENDA', '657804007', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2709, 'JOHN KANIKI', '742680400', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2710, 'MOHAMED SALUM', '718526887', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2711, 'JOHN KAFUGUGU', '714121714', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2712, 'KADALAMO TAINENDA', '688067221', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2713, 'ISRAH HASSAN ', '746850385', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2714, 'LAZARO LOTH', '713428230', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2715, 'BUNDALA', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2716, 'ZUHULA HASSAN', '788307168', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2717, 'RAPHAEL MARTINI', '712033127', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2718, 'MUHANDO GOMELA', '676274885', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2719, 'ELIZABETH NYAKIBALI', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2720, 'ELIYA JOHN', '767555199', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2721, 'BAZOLO MARKO ', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2722, 'BRINGTHON FELIX ', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2723, 'JANE MUSSA', '715420575', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2724, 'MBUGE', '719046533', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2725, 'ERENEUS SWAI', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2726, 'REILLA ANTHONY', '715906667', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2727, 'MSUNGU KICHE', '653545346', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2728, 'TOM PILI', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2729, 'CHARLES HAMAD', '', 2, 7, '0.00', '0.00', '0.00', 2, 0),
(2730, 'KARIBI MOHAMED ISIMA', '719103883', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2731, 'ASHAM HAMED', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2732, 'BAHAT  KARIBI  MOHAMED ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2733, 'RASHID KARIBI MOHAMED', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2734, 'BAKARI MAKABA INASIO', '784221326', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2735, 'NURU MASOUD MTONO', '719527558', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2736, 'VENERANDA MKUNDI', '713395787', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2737, 'SHUKURU MKUNDI', '714624707', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2738, 'NISILE NAZALTH ', '655974165', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2739, 'JOYCE JOHN', '694058437', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2740, 'PAUL JOHN', '764102302', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2741, 'TINA HENRY', '758616122', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2742, 'GEORGE LWENA', '682169934', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2743, 'JENIPHER SAMWEL MAHIMBO', '712682312', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2744, 'EMMANUEL  ANDANGISE KASEBELE', '757734531', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2745, 'PETRO EMMANUEL MULO', '785543422', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2746, 'MWAJUMA ALLY MOHAMED', '699507451', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2747, 'GELEMANA GIZIBETH HAULE', '755970398', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2748, 'GLORY NYALANDU ', '782813227', 2, 8, '0.00', '0.00', '0.00', 2, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(2749, 'SULEMAN  MARCHELO NYAULOVA', '716239696', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2750, 'KARIM MWASANGA ', '719527573', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2751, 'JAMALI ABDALA ', '788120867', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2752, 'ZAINABU ABDALA ', '745659754', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2753, 'AKIDA RAMADHAN MWAIMU', '715595968', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2754, 'SALMA RAMADHAN MWAIMU', '716686844', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2755, 'RAMADHAN AKIDA MWAIMU', '621562194', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2756, 'RASHID AKIDA MWAIMU', '684811778', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2757, 'HAMISI OMARI MPOLA', '787708897', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2758, 'MWANAID ALLY JUMA', '787708897', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2759, 'IBLAHIM HAMISI MPOLA', '787708897', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2760, 'EDWINI NGASA ', '683552558', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2761, 'JANETH MBWANA ', '788817668', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2762, 'IBRAHIM YUSUPH ', '613140646', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2763, 'DORICE HAULE', '689859777', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2764, 'FATUMA KUNAMBI ', '789901214', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2765, 'RAMADHAN', '719527588', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2766, 'KHADIJA ', '719527589', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2767, 'IDDY ', '719527590', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2768, 'BARAKA ', '716664899', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2769, 'KIFOT SAMWEL MWADWAN ', '758570516', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2770, 'ISSA SALMU ', '719527593', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2771, 'ADIJA SAID ', '784885608', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2772, 'GEORGE ISSA ', '612484282', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2773, 'JOYCE SAWALA ', '612484282', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2774, 'ROSE ALEXSANDER ', '657282597', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2775, 'JOYCE SAWALA ', '719527598', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2776, 'SHAN RASHID ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2777, 'FRANK MNYAMBWA ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2778, 'LUCY KTALE ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2779, 'RAMADHAN HASSAN', '717013277', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2780, 'WITNESS LUCAS ', '684977149', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2781, 'JESCA NASHIPAI  ', '697647803', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2782, 'ADAM LIVINGSTONE ', '763304081', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2783, 'JAKSON SEMBEO ', '786828530', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2784, 'BIBI LEMBRIS ', '786828530', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2785, 'LAURENCIA KIWEMBO ', '713607455', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2786, 'JOHN KIWEMBO ', '717111312', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2787, 'GIDEON S SONGORO', '719540033', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2788, 'ELIZABETH J KANKILA ', '713869603', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2789, 'KULVERT G SONGORO', '786929702', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2790, 'lUSY  A BAKARI', '655999748', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2791, 'GUDILA J MASSAWE ', '763178622', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2792, 'SOPHIA I MGUNYA', '717077802', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2793, 'SOPHIA O MCHAPANGOZI ', '786569713', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2794, 'OLIVA W SULLEY', '692546448', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2795, 'CATHERINE SULLEY ', '692549248', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2796, 'MARIAM ISSA ', '717450557', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2797, 'FARIDA SWALEHE ', '766260928', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2798, 'SARAH MAGOVA', '788276856', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2799, 'JACOB SEMBUCHE ', '788276346', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2800, 'FATUMA RAMADHAN ', '783151654', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2801, 'DANIEL MHINA ', '692727670', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2802, 'JOHN DANIEL ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2803, 'IMELDA NYIGO ', '782233083', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2804, 'LIBERATUSY NYAKUNGA ', '658312977', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2805, 'WILLA MBWAMBO ', '779902358', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2806, 'ROZILIA MOHALAWA', '784369277', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2807, 'SALAMA BAKARI NYAMBO ', '718293499', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2808, 'MASHAKA HABIBU ', '685353750', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2809, 'ROGATI JONAS', '659874644', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2810, 'GALLOS BONFSCE  LYIMO', '713631725', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2811, 'LULU ISSA HEMED ', '713631725', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2812, 'RAMSEI RABAN SWILLA ', '754441706', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2813, 'ZAINAB BUKULI RABAN ', '772998802', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2814, 'GODFLEY RABAN SWALLA ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2815, 'ELISHA MGISHA ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2816, 'ROSE  SWILAHA ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2817, ' SAMWELI RAMSEY', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2818, 'FATUMA ASUMANI ', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2819, 'ISAYA J MBILINYI', '652276611', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2820, 'VICTORIA MUHANDO', '716360161', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2821, 'AMRI CHEMBE', '685909694', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2822, 'KHAMIS RASOUL', '713553434', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2823, 'ARNOLD KISIRAGA', '768608877', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2824, 'GRASE N KISIRAGA ', '754319732', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2825, 'FARAJA APROCA', '714027717', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2826, 'AZAKI MASAWA', '694440955', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2827, 'JOYCE NGONYANI', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2828, 'HABIBA HAMISI NGALALA', '789929576', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2829, 'PAULO FILEMONI', '693554948', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2830, 'VERONICA MKWALA', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2831, 'DONASIAN LUHUNGA', '713105609', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2832, 'SAIDI HASSANI MWANA', '786727420', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2833, ' HABIBA RAMADHANI', '787293712', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2834, 'AHAMAD HASANI UGOMBA', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2835, 'MWANAHAMISI HASSANI', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2836, 'KAIMU HAMADI UGOMBA', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2837, 'TAUSI HAMADI UGOMBA', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2838, 'LEA LUPANDA', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2839, 'ATHUMANI JUMA', '719561812', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2840, 'REMEN MASAWE', '767255200', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2841, 'DOMINA WAGWENE', '717964199', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2842, 'DAVID WAGWENE', '785757742', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2843, 'DINAEVA MADEMBWE', '755311557', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2844, 'JACKLINE MADEMBWE', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2845, 'DOMINIC LUCAS', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2846, 'PETER KANUTI', '710288027', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2847, 'SAUDA HAMISI', '711780314', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2848, 'WAZIRI BARNABAS', '719095633', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2849, 'MAKAMbI KINEMO', '782582296', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2850, 'SAMWELI KUWE', '785385669', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2851, 'KIHOMENI WELENDI', '754334934', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2852, 'KITRA KILUJI  (shida jina)', '764942372', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2853, 'MENGSEY KASEN', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2854, 'DIALUFI KIRENGE', '784388922', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2855, 'ELISONI M KASERA', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2856, 'STIVINI I .MASAWE', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2857, 'TITO STEPHANI', '714696771', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2858, 'FELISIA JONASI', '752732424', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2859, 'ESTERIA GISAWA MRIGO', '655386221', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2860, 'ROSE NYANGI NANAI', '786994688', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2861, 'WAKURU NASORO', '655386221', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2862, 'MARTIN MUHAMADI', '688575281', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2863, 'MARIA MARTIN', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2864, 'DEODATA MGUNDA KAPANDE', '693167697', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2865, 'JOSIAH MATAGANE', '655308555', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2866, 'JANE KIHAULE MATAGANE', '767803008', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2867, 'PROF. WINESTER ANDERSON', '735000330', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2868, 'MERISIANA PAULO', '  ', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2869, 'JOHANES GEBWA', '684725446', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2870, 'FRANK .J. GEBWA', '  ', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2871, 'ALFREDY GEBWA', '  ', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2872, 'TWAHA JUMA ISMAIL', '718210328', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2873, 'GASPER DAVID KUISSIMA', '787866036', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2874, 'JUSTIN SIMON KISOKA', '787397748', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2875, 'REGINA .J.MOSHY', '744565998', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2876, 'HUSEIN IDDI YUSSUPH', '716639449', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2877, 'ADELHERMAN H. HAULE', '764773313', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2878, 'MAGDALENA GEOFREY KINGU', '693969176', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2879, 'ABEID RAPHAEL MANYAMA', '766100944', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2880, 'EVA TWAGI MWAKAGILE', '758771534', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2881, 'SHABAN FAUSTIN', '714614661', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2882, 'RUTH URIO', '675591582', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2883, 'GOODLUCK CHARLES SIMKOKO', '766082997', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2884, 'ANTIA ROBERT', '655586475', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2885, 'ANGELINA ROBERT', '654737657', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2886, 'GODFREY MCHA', '677481592', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2887, 'MOHAMED ALLY', '692789058', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2888, 'JUMA ZUBER OMARY', '717072413', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2889, 'ABDUL MUHAMED KOYONDO', '752723372', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2890, 'SHAMSA JOHN MUSHI', '766833743', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2891, 'LATIFA IDD HASSAN', '687414439', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2892, 'ALLY IBRAHIM CHUWA', '684562707', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2893, 'MICHAEL KISANGA', '763208871', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2894, 'JENIFER NYAKI', '763201871', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2895, 'BEATUS MALEMA', '754608806', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2896, 'JONAS MBASI', '754295004', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2897, 'LAVINA MUBANDO', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2898, 'JAMES MBASA', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2899, 'VERONIKA MBASA', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2900, 'NOBERT MBASA', '', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2901, 'MARY KADELIA NGOLE', '715429219', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2902, 'PATRICK JIMOLA NGOLE', '766683488', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2903, 'FELISTER ABEID NGOLE', '719571301', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2904, 'BRIAN PATRICK NGOLE', '765851820', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2905, 'MICHAEL FABIANI TIBULIKA', '783303194', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2906, 'PETER UPASYAGA', '767453031', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2907, 'ERASTI ALOYCE', '745375218', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2908, 'GODFREY TULU', '716842135', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2909, 'GEORGE JOSEPH', '719369891', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2910, 'EMMANUEL LAZARO', '654644485', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2911, 'NICHOLAUS PETER', '757302645', 2, 8, '0.00', '0.00', '0.00', 2, 0),
(2912, 'DEOGRATIUS MFUNGO', '716642019', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2913, 'GILBERT SHIRIMA', '754480654', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2914, 'JOSEPH MHIDZE', '755565659', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2915, 'PROF: SALOME MISANA', '784639598', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2916, 'REGINA CYRILO', '655790034', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2917, 'EMMANUEL MAZENGO', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2918, 'SELEMAN A. PONGOLAN', '782936939', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2919, 'LUKWARO SENKORO', '767210224', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2920, 'HAMIS SADALAH', '767515284', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2921, 'RICHMOND MTWALE', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2922, 'ZAINA ABEID', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2923, 'ERICK MKWIZU', '754841927', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2924, 'NURU A. KINGWABA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2925, 'AZIZA IBRAHIM', '-692564492', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2926, 'DENIS KIMATI', '713300766', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2927, 'MANFRED MHANDO', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2928, 'PROF: ELSON MUJUNGU', '754434355', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2929, 'DICKSON MANONGI', '787888000', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2930, 'BW. MBILINYI', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2931, 'KARAN MACHIBYA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2932, 'SHIJA MAZIKU', '686899191', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2933, 'GASPAR LYIMO', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2934, 'LYAMBA JR', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2935, 'ASHA TARIMO', '745665676', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2936, 'MZE TARIMO', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2937, 'ABUNUWAS MSUSA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2938, 'LAURENT JOHN', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2939, 'HAMIS ZUBERI', '763369350', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2940, 'GABRIEL ISHORE', '754057548', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2941, 'MATHIAS KADEBA', '716506804', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2942, 'ANJESTA IBRAHIM', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2943, 'SHIMANJE ALPHONCE', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2944, 'BW. NDILE', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2945, 'PROF OMARY', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2946, 'HAMAD MFAUME', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2947, 'ANTONY NYAGONDE', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2948, 'PETER SEREKAMBA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2949, 'ANOLD KANZA', '788809999', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2950, 'ELKIA MASSAWE', '755302434', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2951, 'EMILY SINGANO', '767422189', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2952, 'MZEE LIKIGA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2953, 'MOHAMED JAFARY', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2954, 'DK.  MALIARE', '753050993', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2955, 'TWAHA MZIRAY', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2956, 'MZEE MPONDA', '714933660', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2957, 'JOAKIIM OTARU', '752967236', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2958, 'CHRISTINA MGONJA', '782222231', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2959, 'GERLARD MTURI', '754434639', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2960, 'PRISCA LUTEGE', '715319756', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2961, 'MOSES KITILA', '716987646', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2962, 'MARK ALFRED', '755877433', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2963, 'ALPHONCE AUGUST', '714139340', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2964, 'HAMIS SADALAH', '767515284', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2965, 'GETRUDA HOLOO', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2966, 'DANIEL KULWA', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2967, 'IDD KHATIBU', '', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2968, 'AMIRI MSHIHILI', '754935852', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2969, 'JOHN MONGELA', '754268696', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2970, 'EMMANUEL MAGANGA', '712546478', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2971, 'MARWA BUSIGARA', '787775152', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2972, 'MWANAISHA SHOMARI', '718106237', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2973, 'ERICK JOHN RUTA', '654492864', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2974, 'SELEMAN ISSA MCHATA', '767442622', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2975, 'PIUS MAZIKU', '689424000', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2976, 'EMMANUEL KAJEMBE', '767672046', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2977, 'GERLARD B. MAGANGA', '682584368', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2978, 'ALPHAN ISSA MCHATA', '753600477', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2979, 'DENNIS SYLVESTA', '754521008', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2980, 'REVOCATUS MTOLELA', '715087670', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2981, 'PETRO LUFUNGA', '685186854', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2982, 'MICHAEL NJONANJE', '718915981', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2983, 'NOBART KAMSIGE', '711489980', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2984, 'FRANCIS NDIBALEMA', '655814139', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2985, 'ROBERT SALALA', '715211416', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2986, 'CALORINA MWAMBENJA', '653408977', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2987, 'LEONARD CHAMLIHO', '754304050', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2988, 'NGILA MWASI', '752427427', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2989, 'FRANCIS MANDEPY', '784220222', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2990, 'PROF. ELIFASI TOZO KISANDA', '786066632', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2991, 'GEORGE MAGOTI', '717952295', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2992, 'FATUMA MUSA SALUM', '719137059', 3, 1, '0.00', '0.00', '0.00', 3, 0),
(2993, 'WILMAN NDILE', '736303492', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2994, 'HAWA MWAMBULIKUTU', '784801802', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2995, 'REHEMA A. MWALONGO', '744917322', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2996, 'ROSE KISELEMA', '744661825', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2997, 'RAPHAELCHENGA', '687100154', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2998, 'EVELINE CHENGA', '688183701', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(2999, 'JANETH CHENGA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3000, 'ZAINAB SAID', '748767646', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3001, 'REBECA JOHN', '744350457', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3002, 'SHOLASTICA', '767325559', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3003, 'EMMANUEL', '766505075', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3004, 'GODWIN J. MZAVA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3005, 'EDINA E. MDOEE', '784376232', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3006, 'ABIGAEL J. MZAVA', '717792427', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3007, 'KONDO MOHAMED MVELE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3008, 'JUMA KONDO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3009, 'WILLIAM SIMAU THIAGO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3010, 'EMMANUEL MWILONGOO', '717364036', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3011, 'MAHALI JIMSON', '769019965', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3012, 'ALLEN EMILY', '712035474', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3013, 'MIRIAM ALLEN EMILY', '746135876', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3014, 'ANETH EMILY', '655580660', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3015, 'CHRISTINA ALEX', '715008119', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3016, 'MICHAEL KAPUGI', '714960575', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3017, 'PILI RAMADHAN ALLY', '653136321', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3018, 'ATHUMAN MASANGULA', '743019072', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3019, 'EDITH THEOBALD', '782402729', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3020, 'PASCHAL D. TANGO', '678646462', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3021, 'ROGERS MASAWE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3022, 'ADAM LUPEMBE', '787736234', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3023, 'HAWA JUMA', '783040136', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3024, 'ELIZABETH JOHN', '656689466', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3025, 'FRANK HARUN', '715254577', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3026, 'LUCY E. LUFUNGA', '743671953', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3027, 'FELIX MAZIKU BUNDALA', '736303492', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3028, 'MAGDALENA FELIX BUNDALA', '659303180', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3029, 'SAMSON FELIX BUNDALA', '746420692', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3030, 'ANTONY CHARLES SIMBILI', '742432267', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3031, 'LILIAN MINJA', '656460151', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3032, 'PETRO ABRAHAM', '714344136', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3033, 'ABILLAH HARRIS OMARI', '784666611', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3034, 'FATINA ATHUMAN MTURI', '784285175', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3035, 'PASTOR CHARLES', '682552002', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3036, 'LEVIS KASIKILA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3037, 'ZANIA AUSI KAPINGA', '753229111', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3038, 'JUMA ATHUMAN RINDEA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3039, 'ALEX WINGIA KIMARO', '754468691', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3040, 'MARY A. SENGOMA', '787529668', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3041, 'MARIANA ALEX', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3042, 'ITENI KIHANZA', '693226922', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3043, 'HAMIS WAZIRI', '782622650', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3044, 'MWANAHISHA MHIDINI', '685620999', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3045, 'SHAMSA JUMA KISIJA', '627007730', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3046, 'MOHAMED MOHAMED', '625579594', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3047, 'ESTAZIA YONGO AYUBU', '754210365', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3048, 'CHRISTOPHER MHEHE', '716876525', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3049, 'DORA MKAMA', '713458853', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3050, 'WILLIUM OTUCK', '719692204', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3051, 'CHRISTOPHER SAYI', '784357961', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3052, 'CHARLES THOMAS MKAMA', '676700793', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3053, 'EDINA ANDERSON SELEA', '714269241', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3054, 'ANDERSON SELEA', '757822598', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3055, 'GODFREY MICHAEL SWAI', '712302633', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3056, 'MWALAMI MUSSA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3057, 'MONICA SIMAU THIAGO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3058, 'ZULFA IDDI', '718616073', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3059, 'IDDI ALLY', '764688716', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3060, 'VENERANDA THOMAS', '712234133', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3061, 'CLAUDIA PESA BOCCO', '714362656', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3062, 'ANNE RICHARD BOCCO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3063, 'WHITNEY RICHARD BOCCO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3064, 'FLORENCE MUTASINGWA', '713160092', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3065, 'JUDITH K. MTEGEKI', '713934013', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3066, 'VICTORIA MRESHO', '715300067', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3067, 'JOHN MERESHO', '767345535', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3068, 'JAMES MKIGIRA', '686250636', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3069, 'KULWA PETER', '744060816', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3070, 'PETER MICHAEL', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3071, 'RACHE; KILIAN ISAKA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3072, 'FARIDA YUSUF BAHAMA', '713270917', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3073, 'ABUBAKAR Y. BAHAMA', '684666565', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3074, 'MUSA YUSUF BWAHAMA', '719862126', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3075, 'ASHURA YAHAYA', '689106174', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3076, 'SAID RAJAB SAID', '713387561', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3077, 'HASSAN ALLY', '713387561', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3078, 'EVELINE MWALONGO', '712862632', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3079, 'GRACE RICHARD MLAY', '693168548', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3080, 'NICHOLAUS E. MSOMWA', '782879147', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3081, 'HIDAYA ABDALLAH', '757390131', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3082, 'ASHA JOSEPHAT LITE', '716345955', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3083, 'EVETA ISMAIL LITE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3084, 'ONESTA JOFREY NTULUWA', '764599553', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3085, 'JOFREY RICHARD NTULUWA', '764599553', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3086, 'SEIF HASHIM OMARI', '717932013', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3087, 'SIMON EZRON JAMES', '757990561', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3088, 'GIDEON YOEL ZAKARIA', '692898470', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3089, 'BARAKA CLEMENTI', '627041712', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3090, 'PETER ANTHONY', '785983867', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3091, 'FRANK TONGO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3092, 'ADRIAN KAPILIMA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3093, 'LUCASA GABRIEL MACHOMAKAVU', '752178257', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3094, 'ESTHER AUGUSTINO MDIGO', '758242373', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3095, 'BAVIKA KAPILIMA', '754711051', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3096, 'CHRISTNA KENNEDY', '675171932', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3097, 'YASINTA BURCHARD', '658158599', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3098, 'ROBIN MPAULE', '629293857', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3099, 'AGNETHA PHOTIDAS', '678281892', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3100, 'FRANK THOBIAS', '767254227', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3101, 'HARRISON THOMAS', '768001112', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3102, 'RAZAM MUSHI', '687020903', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3103, 'GISELA KATO', '784566611', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3104, 'JOSEPH MAPESA', '758891102', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3105, 'RITHA SANGA', '657324355', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3106, 'CATHERINE SANGA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3107, 'SULEIMAN G. MWASOMOLA', '715445440', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3108, 'ANNA PELLAGE WOISO', '715060905', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3109, 'CRESENCIA ROGATIAN WOISO', '628121590', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3110, 'JESCA MATHIAS FULA', '717783617', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3111, 'NOVATH MASAO', '754365622', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3112, 'JANETH NOVATH MASAO', '655930527', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3113, 'GLORIA VALERIAN MASAO', '716375436', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3114, 'MARIA LEONARD', '715585319', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3115, 'BEATA ALINDA KAMUGISHA', '789970293', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3116, 'PETER JOHN', '788505132', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3117, 'MARTHA MARO', '789641414', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3118, 'STELLAH NDOSI', '787754414', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3119, 'MAGRETH CHARLES', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3120, 'HAMIS MPERA', '693507728', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3121, 'SENOLINA S. CHUWA', '658645310', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3122, 'KHATIB RAMADHAN MGANGA', '756477787', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3123, 'FATUMA JUMA MLALI', '713707097', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3124, 'SHABAN RAMADHAN MGANGA', '713810619', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3125, 'GRACE MKANDAWILE', '714896064', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3126, 'THOBA RAMADHAN MGANGA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3127, 'RAJAB ANTONY MPONDA', '685105083', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3128, 'ALVIN', '654975001', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3129, 'HAWA', '652215166', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3130, 'DALLAS', '767187436', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3131, 'VALLEY', '683500393', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3132, 'THOMAS URASSA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3133, 'HAJI RASHID MCHATA', '786335702', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3134, 'KAMARIA MOHAMED MCHATA', '715212148', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3135, 'HUZARA HAJI MCHATA', '744143354', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3136, 'KHARIM HAJI MCHATA', '785212145', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3137, 'PAULO RICHARD', '686295377', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3138, 'KURUTHUMU SHINJE', '786272218', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3139, 'RAKIA ALLY TINDWA', '674945808', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3140, 'TAMASHA ISSA MBAWALA', '712552281', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3141, 'GRACE KESSY', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3142, 'PETER FONGO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3143, 'HILARY', '748600956', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3144, 'NICE', '658653397', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3145, 'SEIF', '755470472', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3146, 'RIZIKI KUYONGA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3147, 'RICKSON MUGISHA RWEZAURA', '719453300', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3148, 'JANETH MUGISHA', '713881336', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3149, 'MWESIGWA RWEZAURA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3150, 'VAILETH CHITELA', '767279398', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3151, 'ISMAIL ISSA', '789380153', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3152, 'KHADIJA ISMAIL', '653518783', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3153, 'HAWA ISMAIL', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3154, 'PASCHAL KIYABO', '783708784', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3155, 'DOROTH PASCHAL', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3156, 'SEBASTIAN IZENGO', '784686041', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3157, 'RAHEL MIKA', '712264413', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3158, 'BETTY MWAMBAPA', '716676565', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3159, 'LUCY MOKIWA', '714763184', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3160, 'PAYNESS MANDA', '718129210', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3161, 'ARISTIDES RWEGASIRA', '753770682', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3162, 'BEATRICE KESSY', '769756627', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3163, 'ASHA OMARI', '746980291', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3164, 'AMINA BAKARI', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3165, 'BAKARI SHABANI', '784456515', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3166, 'MAGDALENA ALOYCE', '763006939', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3167, 'TUMAIN MACHA', '742130509', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3168, 'GEORGE', '693166702', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3169, 'ALPHONCE REMY', '755184229', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3170, 'YASIN FADHIL', '718909783', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3171, 'JALIA DANGA', '788986873', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3172, 'ASIA YASINI', '789011100', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3173, 'GODMAN GODWIN', '785727489', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3174, 'REBECA RAMADHAN', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3175, 'OFORO MONYO', '754683991', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3176, 'HEADNECK MONYO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3177, 'DORICAS UFORO MONYO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3178, 'REGLAIS UFORO MONYO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3179, 'GIBSON UFORO MONYO', '712471647', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3180, 'JACKSON UFORO MONYO', '719958437', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3181, 'RHODA JACKSON MONYO', '654040944', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3182, 'BRIAN JOHN MONYO', '659306778', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3183, 'BENJAMIN JOHN MONYO', '694397603', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3184, 'SUZANA LUCAS', '755371485', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3185, 'ROBERT HUMPHREY', '718369578', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3186, 'ZAKIA MOHAMED', '674755052', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3187, 'MOHAMED IDDI', '652396464', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3188, 'PAULO NSHIMBA', '716812610', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3189, 'YUSTINA PAULO', '783397838', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3190, 'CATHERINE PAULO', '717291586', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3191, 'WINFRIDA PAULO', '712844209', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3192, 'HERMENT VALERIAN TEMBA', '655040753', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3193, 'LIGHTNESS V. TEMBA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3194, 'GILBERTH V. TEMBA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3195, 'EDGAR MUSHI', '679565126', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3196, 'LULU MUSHI', '716556922', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3197, 'QUEEN MUSHI', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3198, 'OSCAR URIO ', '693249395', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3199, 'JOSEPH MATHEO', '627305513', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3200, 'KENETH ADAM MUSHI', '784374331', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3201, 'ELIZABETH ELIAMINI MLAY', '786272765', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3202, 'JACKLINE KENETH MUSHI', '718125666', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3203, 'ROSE KENETH MUSHI', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3204, 'GIVEN KENETH MUSHI', '694002681', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3205, 'HADIJA LUKAGO', '719578699', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3206, 'RAMADHAN KAMBONA', '659264720', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3207, 'JACKSON GIFT', '782142811', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3208, 'ANNASTAZIA SHEDRACK', '689721720', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3209, 'JOSEPH DAUD', '652374626', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3210, 'REHEMA WILLIAM', '672449353', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3211, 'SARAFINA MTWEVE', '693176669', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3212, 'ARGENTINA DAUDI', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3213, 'ESTHER BAHATI', '672079455', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3214, 'JESCA KAHAYA', '693168728', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3215, 'JOSEPH MAGANGA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3216, 'MAGRETH EMMANUEL', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3217, 'DAVID JOSEPH MAGANGA', '713037461', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3218, 'BERTHA DIDAS', '693882042', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3219, 'ADAM MWENZEGULE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3220, 'SAFINA HASSAN MAPEMBA', '714060917', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3221, 'DIANA ERASMUS', '747354060', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3222, 'DR. MUSHI', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3223, 'MARIA MARCUS', '753909342', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3224, 'MASHAMBO WASHNGTON', '689506114', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3225, 'RWEIKIZA ALBERT', '784168259', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3226, 'CLETUS SANGA', '789666196', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3227, 'OBAS NDELWA', '715003923', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3228, 'AWAZ ABDALLAH', '713483436', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3229, 'JOHN LUKWALO', '712173143', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3230, 'NGOSHA MANGI', '714616515', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3231, 'JOSEPH NGOWI', '659843777', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3232, 'GERVAS BANZI', '787307004', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3233, 'SCHOLASTICA MWALA', '787307004', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3234, 'VERONICA NKINI', '718206550', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3235, 'RAMADHAN SHABAN', '763423898', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3236, 'FRANK MAMBOLEO MUSHI', '714079418', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3237, 'EMMANUEL KIVUYO', '653423898', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3238, 'JCOB MSEMWA', '714544240', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3239, 'HAULE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3240, 'ALPHONCE KAROSWE', '746783919', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3241, 'JOSEPH ABRAHAM', '687033545', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3242, 'BOSCO MBWAMBO', '719426941', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3243, 'LUCAS MAKARANGA', '754047765', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3244, 'ONESTA J. TURWA', '758561384', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3245, 'WILNESS MAHOO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3246, 'ROSE MAHOO', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3247, 'RAY LUGINA', '682132974', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3248, 'RASTAON GABUSHA', '715200158', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3249, 'KENETH EVERSON SEMITI', '753543808', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3250, 'CHARLES KEZALA', '787186100', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3251, 'ANTONY NYAGONDE', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3252, 'PRISCA KASIKILA', '', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3253, 'RAPHAEL HAONGA', '692646254', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3254, 'ANETH KIMUTUO', '713633818', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3255, 'AMWA LIANGA', '715515416', 3, 2, '0.00', '0.00', '0.00', 3, 0),
(3256, 'SAID MFAUME MANJOTI', '657109220', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3257, 'ALLY SAID MANJOTI', '655953147', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3258, 'RICHARD FILBERT KAMENYA', '684951521', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3259, 'SAID MOHAMED MANJOTI', '785618337', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3260, 'MAMA BUNDALA', '715604838', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3261, 'GEOFREY GUNDAA', '686074604', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3262, 'WANDA MKUMBO', '654250565', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3263, 'ERICK BISANDA', '765788138', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3264, 'HUMPHREY MOKIWA', '717659655', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3265, 'EDWIN BANYENZA', '713077780', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3266, 'DAVID KITOLERA', '713570640', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3267, 'DEOGRATIUS SIZYA', '714590254', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3268, 'ALFA NJIRO', '658115838', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3269, 'FIDES', '788147279', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3270, 'ZAINAB MARIJANI', '755874943', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3271, 'GODWIN MONGI', '676259259', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3272, 'ARNOLD MISANA', '713518170', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3273, 'REWARD MKWIZU', '719934898', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3274, 'ONESMO HERMAN', '658282714', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3275, 'MWILONGO', '713428178', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3276, 'MAMA MAHINGIRA', '713141137', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3277, 'SALOME BUZIZI', '767727603', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3278, 'JUMBULA', '784329933', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3279, 'MAHOO', '713321108', 3, 3, '0.00', '0.00', '0.00', 3, 0),
(3280, 'JUMANNE MGAYA', '654821436', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3281, 'ASHA H. KIGANTA', '652464616', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3282, 'SALUMU SIMBA SHOMARI', '677786846', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3283, 'KELVIN HARRISON NZOWA', '787472392', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3284, 'SHADRACK HARRISON NZOWA', '787472292', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3285, 'HUSNA AMRI FUNDI', '6743888965', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3286, 'RASHID S. MIRAMBO', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3287, 'JUMA MTOTELA', '654519986', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3288, 'PILI SALUMU', '652143603', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3289, 'ELIAS AREZA MKINDI', '714328490', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3290, 'NEEMA SHAIBU NAMAJOJO', '762663547', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3291, 'DOTTO HUSSEIN SALUMU', '684766116', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3292, 'HASSAN HUSSEIN SALUMU', '753268728', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3293, 'RAMADHAN SAID', '692297286', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3294, 'ABUU TANO', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3295, 'HADIJA KIKOPA', '717037910', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3296, 'JUMA MUSTAPHA', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3297, 'NURU SHABANI', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3298, 'JOYCE CHIWANGU', '752999222', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3299, 'HAMISA AHMED SALEH', '717219594', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3300, 'ALLY JUMA FARAJI', '756390268', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3301, 'SHIDA SALUMU KIKOPA', '715007965', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3302, 'JAPHET JACKSON MALUGU', '684712927', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3303, 'MWANJ MAFAT', '782102555', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3304, 'IDDA EDWARD MTINA', '718910667', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3305, 'MIKA BADAN', '699342127', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3306, 'ISSABELA BADAN', '788861029', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3307, 'AISHA YUSUF', '716551199', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3308, 'TWAHA N. CHOROBI', '658246978', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3309, 'RAMLA NURU', '688792870', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3310, 'NURU ABDALAHAMED ADAM', '754268293', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3311, 'ISAYA D. SHUMBI', '716004391', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3312, 'ELLY Y. SHIMBI', '716642023', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3313, 'SEBASTIAN JOEL', '654257075', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3314, 'BENABETA GEORGE', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3315, 'EMMANULE RUTASHOBYA', '754281478', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3316, 'ESTHER K. RUTASHOBYA', '653500535', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3317, 'GERALD ANTONY', '783992208', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3318, 'AGNES SIRICHON', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3319, 'DOMINIKA MKEPULE', '767678019', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3320, 'JOACHIM MSIGWA', '714883714', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3321, 'PRISCA JACOB', '714883744', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3322, 'ROSE SHAUSI', '717167060', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3323, 'PAULO MANSWET', '764030104', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3324, 'MAPE YALED', '719057872', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3325, 'ANNA NOLO', '715493633', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3326, 'SAID MAKIRIKITI', '713416067', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3327, 'LENATA KALINDA', '714170139', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3328, 'MONIKA ZAKAYO', '782729949', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3329, 'FATIMA NYONI', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3330, 'DEODATUS B. MREMI', '715394333', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3331, 'DEO B MREMI', '715394332', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3332, 'LOHAN', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3333, 'ISACK', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3334, 'LENAS MICHAEL KIWALE', '712929470', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3335, 'ROSE AMOS KIWALE', '654224466', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3336, 'NEEMA ABDALLH AMIR', '673211655', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3337, 'JOSHUA IGNAS MKEPULE', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3338, 'TONY IGNAS MKEPULE', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3339, 'IGNAS JONA MKEPULE', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3340, 'THEODORA CHANGA', '746706047', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3341, 'YOHANA IGNUS MKEPULE', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3342, 'VIVIAN E. RUTASHOBYA', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3343, 'INNOCENT RUTASHOBYA', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3344, 'EDWIN RUTASHOBYA', '717577417', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3345, 'ANDERSON MJUNI', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3346, 'PRINCE F. MJUNI', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3347, 'MIRACLE JOSEPH EFATHA', '', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3348, 'GABRIEL LAWRENCE MWERO', '754814304', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3349, 'BONIPHACE GABRIEL MWERO', '734901488', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3350, 'FRANK A. MUSHI', '754439948', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3351, 'EVA AUGUST MTUI', '754851023', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3352, 'BENADETHA LWENA', '756885124', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3353, 'CRISTA HAULE', '758499765', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3354, 'LILIAN L. NTABU', '762049953', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3355, 'SIGFRID GABRIEL SHIRIMA', '788095791', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3356, 'KELLY MICHAEL NYAMUHURA', '713298959', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3357, 'ANTONIA OSWALD RUSASA', '715666622', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3358, 'SOFIA', '679952063', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3359, 'WAMBURRA JOA RYOBA', '654138533', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3360, 'MARTIN MALALE MIJILIMO', '754514885', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3361, 'UPENDO AHADI MKANDE', '713475915', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3362, 'SHARIFA TWAHA MOHAMED', '673478014', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3363, 'MWANAHAMISI KHALFAN', '693555686', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3364, 'YODAH MIRAJI', '785904071', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3365, 'JUDITH MTAWANGU', '713871871', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3366, 'NAIRATI MUSA', '693379632', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3367, 'PHILEMON TIRUKAIZILE', '789495775', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3368, 'LUCY MWINUKA', '687560285', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3369, 'SALHA SAID', '693768526', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3370, 'PETER SAMWEL', '788269921', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3371, 'ESTHER FUNGO', '755546668', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3372, 'CHRISPIN S SHAYO', '715390443', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3373, 'CHRISTINA H. GODWIN', '718150501', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3374, 'BYLON YASINI', '654247314', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3375, 'ESTHER CHUGULU', '687195561', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3376, 'LAMECK ALEX', '683514775', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3377, 'WILSON ALEX', '686367083', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3378, 'ALEX NYONI', '688898977', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3379, ' FAUSTINA GERVAS NYONI', '657180353', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3380, 'STELIA MARTIN', '658223739', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3381, 'WILLIAM ELIA NTIRUKA', '714894994', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3382, 'REUBEN ZAKAYO', '766182828', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3383, 'DAUD SIMON MASUBI', '788001078', 3, 4, '0.00', '0.00', '0.00', 3, 0),
(3384, 'JOHN PESA KINANDA', '785414410', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3385, 'ADELINA LIFA', '754710023', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3386, 'YAHANA SFUE', '713353776', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3387, 'LUDOVICK BENDERA', '716259871', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3388, 'GRACE IKOMBE', '713264926', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3389, 'TULIBAKO MBWIGANA', '657295562', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3390, 'HELEN MUNGUMI', '753251227', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3391, 'JAMHURI ZAKARIA', '754494734', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3392, 'TEDIE MBULIGWE', '782226088', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3393, 'JAMES MBAGA', '719648675', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3394, 'LYAMBWENE MTAHABWA', '756618836', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3395, 'SEIF NGAO ATHUMAN', '715601377', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3396, 'STELLA MBAGA', '753118640', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3397, 'TITO MANGESHO', '653797746', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3398, 'PETER JUMA', '714494734', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3399, 'HUSSEIN HAMIS MBAGA', '655151013', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3400, 'NANCY SIARA KILONZO', '786773759', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3401, 'LAULIAN SANYA', '787639191', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3402, 'MAX MTUNGI', '692486441', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3403, 'PETER SHEKENABO', '655779870', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3404, 'GASPER MUNISHI', '787667177', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3405, 'FROLENCE RUBEN', '712644170', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3406, 'MARIA BISWALO', '', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3407, 'PROSPER MSILANGA', '766334655', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3408, 'HUSNA AMIN MBAGA', '658500043', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3409, 'RESORT', '715315064', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3410, 'ADAM FRANCIS', '713123772', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3411, 'FATUMA M. NYIRENDA', '714093970', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3412, 'EZEKIEL FUE', '713381166', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3413, 'IVAN CHEDEGO', '717070789', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3414, 'AMINA JUMA KOMOLABWENGO', '654984096', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3415, 'DICKSON TEMU', '767553440', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3416, 'GEBBY WAGARA', '783697821', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3417, 'KIZA BARAGA', '693177774', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3418, 'DEO MACHA ', '767639271', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3419, 'TWALIB MSANGI', '784783478', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3420, 'JULIUS MUSHI', '754492382', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3421, 'ABDALAHFIL', '713350310', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3422, 'KILIAN MNYANYIKA BRUNO', '658490126', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3423, 'DK. SAID KAPIGA', '787480450', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3424, 'HERIEL', '754692025', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3425, 'AYUB MTISI', '786400405', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3426, 'KAZI ALLY KONDO', '714566601', 3, 5, '0.00', '0.00', '0.00', 3, 0),
(3427, 'ABDALLAH ALLY LUKUU', '652737731', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3428, 'AWESA ABDALLAH RAJABU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3429, 'ASANI ABDALAH LUKUU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3430, 'STEVEN WHITOSON SAIMONI', '712769662', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3431, 'JENIFA GEORGE JELELA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3432, 'WILLIAM PARTSON MWANDUVANI', '718892505', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3433, 'JOHNSON CHAULA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3434, 'NESERIAN SARUNI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3435, 'REBECCA SARUNI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3436, 'JUNIOR SIWILA', '654219334', 3, 6, '0.00', '0.00', '0.00', 3, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(3437, 'PENDO MOSHA JONNI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3438, 'RENFRIDA S MATHIAS', '754204573', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3439, 'NANCYROSE DAMAS', '682177171', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3440, 'MICHAEL DANIEL', '689496427', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3441, 'FRIDA WAMBI', '715204573', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3442, 'JONNI WILLIAM NASOMBA', '673749929', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3443, 'MWAJUMA JUMA SALEHE', '658477948', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3444, 'FRANCIS OKTAVIAN CHITAWAL', '68255377', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3445, 'HEN FRANZIS WIHALE', '624216255', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3446, 'JONAELY R NANYARO', '689609705', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3447, 'MATHIAS JOHN WILLIAM', '692744340', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3448, 'WILLIAM JOHN WILLIAM', '656954057', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3449, 'HEPI CHENGA MAIKO', '783048927', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3450, 'VITUSI WILIAM NASOMBA', '653937457', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3451, 'FARASTA TEODOR MUSSA', '659805481', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3452, 'ONEST K NAMBOYA', '65798684', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3453, 'FRORA DEO CHILIMA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3454, 'EDWIN JOHN NNUNDUMA', '754379133', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3455, 'SIBILINA W MASSAWE', '754560133', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3456, 'ASHA ALLY ABDALLAH ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3457, 'GODWIN EDWIN NNUNDUMA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3458, 'SALVINA EDWIN NUNDUMA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3459, 'SELEMANI BAKALI ABDALAH', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3460, 'RAFAHE ILIBALIKI MSANICI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3461, 'SABINA MTWAU YAKOBO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3462, 'TEUWA SWALEE ISSA ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3463, 'HUSNA HAMISI CHEGEKA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3464, 'HAMISI ARIDI NDILA', '719462037', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3465, 'BENADETA WILIAMU NASOMWA', '716996190', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3466, 'CHALE FREDIKI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3467, 'MARTIN KANUTI MPANDIKIZI', '783540552', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3468, 'SUZANA PHILEMON MWANSEMBO', '747492123', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3469, 'BENJAMIN LEONARD KISANGA', '757960656', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3470, 'ESTA CHARLES DANIEL', '699518182', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3471, 'LEORNARD MASSAWE', '682954661', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3472, 'CATHERINE KAVISHE', '687261043', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3473, 'LUCY KENEDY BAITAZAR', '743240739', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3474, 'FLAVIAN KENED MASSAWE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3475, 'SALHA MARTIN', '769919633', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3476, 'PAULINA MISOOI NKONO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3477, 'ISAYA MICHAELI MUSHI', '716189945', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3478, 'LULU ABUBAKARY MASSAWE', '655994442', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3479, 'STRATON JOHN KAVISHE', '653428211', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3480, 'KIJA J KASSILE', '653025881', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3481, 'CHRISTOPHER B KIHILA', '712412535', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3482, 'EDNATHA AROON ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3483, 'DR COSMAS KAPISTWEVE', '789222202', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3484, 'MRS NEEMA  KAPISTWEVE', '786258372', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3485, 'MS GISELA  KAPISTWEVE', '739954668', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3486, 'MS CONSTANCIA CHANGA', '655499256', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3487, 'NICODEMUS P CHUWA', '652605713', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3488, 'VICTORIA  R MCHGCHU', '712685062', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3489, 'PETER S CHUWA', '747825092', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3490, 'PAULO J LWENDO', '693697948', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3491, 'LINA G BALUTA', '768683840', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3492, 'ANNA M INGI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3493, 'HASSANI MAURIDI RWANDA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3494, 'SIMON LUZIGA MASANJA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3495, 'ROIDA MBWANJI', '756397342', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3496, 'DICKSON MGONGOLWA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3497, 'CLOTILDA MAIKO MUSHI', '682517258', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3498, 'NEMA JONNI ADAMU', '657212237', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3499, 'HAMISI OMARI REHA', '694004429', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3500, 'MWANAMISI SALUMU RAJABU', '675197174', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3501, 'PAULO GOGOMBA ZULWENYE', '717116136', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3502, 'PITER PAULO NGONGOMBA', '764595657', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3503, 'KARENI ISUMAILI ABDALAH', '625017127', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3504, 'STELLAH PAULO', '783387988', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3505, 'AZIZI ABDALAH LUKUU', '719859361', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3506, 'JAKISON PAULO', '710641025', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3507, 'FARIDA HAMISI YASINI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3508, 'BENADI SITAFODI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3509, 'SELINA MWALOKO MPUYU', '789604606', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3510, 'FRANK JAMES KASATI', '712263547', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3511, 'JAMES MICHAELI', '764641159', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3512, 'SOLOMON JACOB LYIMO', '754781160', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3513, 'ANNETH SOLOMON LYIMO', '765464634', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3514, 'BRAYAN SOLOMON LYIMO', '752372512', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3515, 'LEONARD WILLIAM', '717174702', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3516, 'GERLAD KADEBA SOFILA', '713109393', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3517, 'JULIANA HAULE', '656303902', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3518, 'EDWARD KADEBA', '754959354', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3519, 'SAMWEL AIDANI HAULE', '783483994', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3520, 'ISSA HAMEDI MWANGU', '683229573', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3521, 'HADIJA HASSANI MAHELA ', '762578115', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3522, 'MATULI ISSA MWANGU', '694375313', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3523, 'EFREM BEDA LUANDA', '712626731', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3524, 'JANETH SALEHE KAUZENI', '653884209', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3525, 'TEKLA BEDA LUANDA ', '763712090', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3526, 'ISABELA BEDA LUANDA', '672563738', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3527, 'TYSONI BEDA LUANDA', '783998216', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3528, 'ERNEST LINGONYO', '692780599', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3529, 'ROSEMARY JOHN', '677419535', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3530, 'YUKUNDA  I MUSHI', '684306567', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3531, 'DEVIDI JULIASI MKWIZU', '755375506', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3532, 'FERISIA JOHN MAJI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3533, 'JEIJE DAVID', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3534, 'JENI JOHN MAJI', '755895869', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3535, 'JULIETHA DEVIDI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3536, 'HELIYA DEVIDI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3537, 'JOSPHATI EVART KOMU', '655278566', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3538, 'JENNI JOSPHU KOMU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3539, 'GEORGE KABELWA', '784299672', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3540, 'MARIA NDESARIO KABELWA', '713548233', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3541, 'ABDALLAH NASSORO MANJOTI', '715957134', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3542, 'NASIBU NASSORO MANJOTI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3543, 'MARIAM LADISLAUS KIYENZE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3544, 'ASUMINI ALLY BAKARI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3545, 'IRENE SAMWELI ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3546, 'SHABANI CHAKATU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3547, 'ALLY HIRUKA OMARY', '676355972', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3548, 'FFUUSF BENADI MILANZI', '715044275', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3549, 'EDISON JUMANNE MGAYA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3550, 'MERYSIANA HAMISI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3551, 'GRACE JOSEPH MTWALIE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3552, 'MKWAYA JOSPHU MTWALIE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3553, 'FREDI STIVINI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3554, 'SAIDI HUSENI MIKILLA', '679322998', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3555, 'SALMA RAJABU RAMADHAN', '659583745', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3556, 'RABIA SAIDI MKILLA', '652568048', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3557, 'HAMISI MALECHE SAMUEL', '718157030', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3558, 'MGAZA MASUDI JUMA', '782475022', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3559, 'SOFIA MGAZA', '623786290', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3560, 'PENDO MWANYILA MWADESYA', '658476404', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3561, 'HELIZABETI MACHUPA SANGARA', '764505806', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3562, 'AGNES JOHNI NGUMBA', '714879162', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3563, 'SAMWEL LUHANYA KASANGA', '715487898', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3564, 'GERMANA EMMANUEL MJENGI', '683440881', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3565, 'HUSSEIN OMARI SAKIDUO', '752212146', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3566, 'ASIA NASORO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3567, 'OMARI HUSSIN', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3568, 'IDDI HUSSEIN SAKIDUO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3569, 'KULWA HUSSEIN SAKIDUO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3570, 'MARRY GODFREY ', '672966928', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3571, 'ABDILAHI MBARAKA J', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3572, 'OMARY JUMA SELEMAN', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3573, 'FURAHA ABDALAH MADANGA', '655718565', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3574, 'SAIDI OMARY JUMA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3575, 'MWANAKOMBO SELEMANI', '652896697', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3576, 'OSCA HANYONI MAKOTA', '673042174', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3577, 'SALLA SELEMANI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3578, 'SEVERIN KNEMANY DAUDI', '713712380', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3579, 'PILLY SALUMU ABDALLAH ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3580, 'ALLY CHIKWIMBA', '715515640', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3581, 'VERONICA S URASSA', '655503565', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3582, 'PROSECI MKANDA MASAWE', '718439857', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3583, 'VINGITA MICHAEL SWAI', '758338873', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3584, 'KARORINA MKANDA MASAWE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3585, 'NICODEMUS PETER CHUWA', '713382066', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3586, 'GRACE PETER CHUWA', '713864717', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3587, 'KELVIN PETER CHUWA', '714507318', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3588, 'IBRAHIM AMIR LEMA', '717364604', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3589, 'SHUFAA IDDY BAKARI', '716079989', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3590, 'NGAYA S NDOSSY', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3591, 'ALEX DAVID SILAA', '754299714', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3592, 'GAUDENSIA BALTAZARI CHUWA', '715799379', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3593, 'ABDUL AYUB KIMBAU', '757274192', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3594, 'HAMIDA RASHIDI NASORO', '714474593', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3595, 'FATUMA KIMBAU', '757487952', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3596, 'PAULO NKINGA', '655107873', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3597, 'REHEMA ISSA', '786136366', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3598, 'HAMINA RASHIDI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3599, 'JENETI WILLIAM KIILAWE', '654297879', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3600, 'ADAMU KARAY', '768291302', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3601, 'ZAINABU CHANZI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3602, 'SALMA ABDALLAH ', '752097170', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3603, 'AMIRY HUSENI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3604, 'NASMA YUSUPH', '699351441', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3605, 'BILLAL LAWAI SHEMZIGWA', '788033185', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3606, 'PAULO FARIHANI KILOGA', '718764653', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3607, 'MONICA ELIEZA NGARIA', '713342129', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3608, 'HERIETI PAULO', '692744456', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3609, 'ELIZA PAULO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3610, 'SOLOME JAMES BALAINI ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3611, 'ELIUDY E MLYUKA', '763366668', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3612, 'MARTH E MLIYUKA', '755956694', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3613, 'IRENE MLYUKA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3614, 'JANETH MLYUKA ', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3615, 'EZEKIEL MLYUKA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3616, 'KASIMU HASANI BAKALI', '652340183', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3617, 'REHEMA MABRUKI ZAIDI', '713576519', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3618, 'GRAYSON ELIYFOO URASSA', '787563797', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3619, 'JOYCE JAPHET MLUNZA', '712580686', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3620, 'BRIAN GRATSON URASSA ', '719606695', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3621, 'BRIGHTNESS GRAYSON URASSA', '680464594', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3622, 'SAIMO SPERAS MMBANDO', '714786627', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3623, 'MONICA ALDIS SHAYO', '655025104', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3624, 'JACKSON RICHARD MBOYA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3625, 'SAIMONI KOMBA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3626, 'HAMIS ATHUMAN', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3627, 'FAUSTA KAALE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3628, 'WENCESLAUS BASIL MOSHA', '786077207', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3629, 'MICHAELLI MOLISI RAZORO', '787465914', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3630, 'MELISIANA JAPHETI MKWAKARA', '626778468', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3631, 'SANKE ERNEST', '764690800', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3632, 'FOIBE SANKE', '764690800', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3633, 'ISSA HASAN MTUPA', '654846110', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3634, 'ZUWENA FRADUSI KAZITALILI', '714982239', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3635, 'ALLY HASANI MTUPA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3636, 'MARIAM R MCHATA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3637, 'BOHAZI  MAKIO RIFIKA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3638, 'RAHAMA ABUBAKALI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3639, 'RAIMONDI KELAMBO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3640, 'DIVIAN B', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3641, 'DIANA A MGAO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3642, 'RAMADHANI I MCHATA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3643, 'DEVOTA JAFARI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3644, 'EVARILE SAMU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3645, 'ELIN ELIAS', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3646, 'BAKARI HUSENI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3647, 'DAVIDI TOA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3648, 'TONY MBILINYI', '786284778', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3649, 'LEONARD LEMA', '716278366', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3650, 'LUSAKO SICHONA', '713414642', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3651, 'EVANCE PHILBERT AYENDERA', '782433099', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3652, 'VANIA JOSEPH', '765828997', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3653, 'FERDINAND S MGOVOWO', '713272259', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3654, 'SPERANCIA A MTASIWA', '713423652', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3655, 'SARA F MGOVOWO', '716675399', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3656, 'ALOISIA F MGOVANO', '655588175', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3657, 'LUCY BAHATI', '744996858', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3658, 'SLYVIA MGOVANO', '714555988', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3659, 'ADELTUS KAIJAGE', '754710499', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3660, 'JULIETH IRABA', '714107563', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3661, 'CHRISTINA MWASHA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3662, 'AMISI LINDOME', '676770647', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3663, 'KIRISTINA NASANIELE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3664, 'NEHEMA ERIASI', '656397501', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3665, 'HDRUEA JUMA', '656633832', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3666, 'SOFIA ERIASI', '692970339', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3667, 'KRAUD SAIDI ZEBEDAYO', '785355581', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3668, 'MWAIJA OMARY', '684053465', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3669, 'MESIYO RAMAZANI MESIYU', '765677957', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3670, 'SEMRAERY', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3671, 'ALBERTT NIKODEMU', '653169075', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3672, 'TATU RASHID MOHAMED', '620536428', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3673, 'AMINA RASHID', '746438498', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3674, 'SALOME TESHA KADUNDU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3675, 'RUKAYA OMARY DUNGWE', '683793034', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3676, 'KULWA NDEVU', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3677, 'MWANAMISI MSISI', '785807756', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3678, 'ERICS S KADODA', '753789552', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3679, 'VICTORIA S KADODA', '719990043', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3680, 'GEORGE S SWAI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3681, 'BEATHA K LYAKURWA', '715957018', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3682, 'ILDA SILASI WILE', '788917971', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3683, 'VIKITORY HANATONI', '715505147', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3684, 'HASANI ALMASI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3685, 'RICHARD A SHIRIMA', '656830967', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3686, 'CERUDA MZELE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3687, 'JACOB MTENGA', '689553635', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3688, 'ANGELINA MTENGA', '658086568', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3689, 'KASIMU HAWADHI MDEME', '711469117', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3690, 'JUMA ALLY MNINYIGOGO', '757024412', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3691, 'JOYCE WILISON MUYOMBE', '756358119', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3692, 'HARRISONI RUWANGA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3693, 'HABERA NDAGUZI', '715070539', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3694, 'MUSA HMBIKA', '789133127', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3695, 'FRANCIS NATO', '685163282', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3696, 'JOWAKIM MATIHASI REDIO', '785152548', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3697, 'REJINA RAURENCE MTMULLA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3698, 'CATHERINA SOSTHENES MAGOMWA', '621005027', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3699, 'CHARLES J.G MALLYA', '712818789', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3700, 'SHOMARI IDDI ZUNGO', '713677778', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3701, 'HAMISA MOH ZAHARI', '713639156', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3702, 'ZENA SHOMARI ZUNGO', '711357154', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3703, 'MOHAMED SHOMARI ZUNGO', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3704, 'FATUMA SHOMARI ZUNGO', '743536992', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3705, 'IDDI SHOMARI ZUNGO', '693010338', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3706, 'JOSEPINA DAUDI NDEGE', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3707, 'SILIMA KAWANGWA', '686433304', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3708, 'DOREEN NGAIZA', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3709, 'NORASCO NOVATH', '671908718', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3710, 'AMANI AKILIMALI ZIDOTO', '767555776', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3711, 'GLORIA AMANI', '', 3, 6, '0.00', '0.00', '0.00', 3, 0),
(3712, 'SELEMAN MAJATA', '788469245', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3713, 'ZENA OMARY', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3714, 'ABDUL SELEMANI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3715, 'ESTHER SANGA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3716, 'PATRICK CHIKWEZA', '699132124', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3717, 'JOYCE SELEMAN', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3718, 'ESTHER GIDEON', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3719, 'VICENT SHIMA', '742095565', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3720, 'DISMAS HATARI', '686491604', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3721, 'AGNESS KAIOLA', '745913865', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3722, 'RAMADHAN MSABAHA ATHUMAN', '713556956', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3723, 'DANOSHA HALIFA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3724, 'RAMADHAN SELEMAN', '674649583', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3725, 'SUZANA SELEMAN', '656027171', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3726, 'MARY JOSEPH', '782711770', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3727, 'MOHAMED S. MASATA', '673250285', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3728, 'SIHABA MOHAMED', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3729, 'ELIZA MUSANYA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3730, 'VERO MUSANYA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3731, 'SALMA SHABAN', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3732, 'OMARI HATIBU', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3733, 'NOEL NGOMUO', '754594949', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3734, 'EVEN SHIRIMA', '679228804', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3735, 'REHEMA KISOKA', '693708864', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3736, 'KELVIN NGOMUO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3737, 'SARA KINDOLE', '783911285', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3738, 'JULIUS SANYAGALO', '684296844', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3739, 'JOYCE LUBELEZE', '682074343', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3740, 'CHARLES RAPAHAEL', '693549995', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3741, 'SAID SALUMU', '676141213', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3742, 'SILVIA DISMAS ', '683347888', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3743, 'FATUMA GILIAD', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3744, 'LEOKARDIAMWALA', '655879002', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3745, 'ATHANAS SAMWEL', '716023362', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3746, '', '716985512', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3747, 'FROLENCE SHENAGWA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3748, 'JENIPHER MBEZI', '756067660', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3749, 'VANTACY MBEZI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3750, 'SARAFINA MICHAEL', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3751, 'MAIKO IJANGA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3752, 'CATHERINE SHENYAGAWA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3753, 'DIONOSIA MWALA', '654721755', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3754, 'HAMZA HAJI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3755, 'AMINA HAMZA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3756, 'BRIGITA SHENYAGWA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3757, 'GRAYSON REOBERT KIGANYA', '787976330', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3758, 'PETER WILLSON', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3759, 'ALFA JUMANNE JUMA', '716527387', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3760, 'AISHA RAMADHAN ISSA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3761, 'VENANCE KALONGOLELA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3762, 'HAMZA SALUMU MBOA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3763, 'SOFIA HAMZA MKURU', '763162765', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3764, 'JANET MALITI MBOGAMBE', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3765, 'DISMAS MATETELA LAURENT', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3766, 'EMMANUEL S. MSOKELO', '713993656', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3767, 'NEEMA J. MABALA', '719649851', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3768, 'VERONICA WILSON MSANYA ', '717067899', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3769, 'ELIZABETH WILSON MSANYA', '713056826', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3770, 'MATHIAS WILSON MSANYA', '787925664', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3771, 'WILSON MSANYA MIYOMBO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3772, 'DAMIAN DISMAS MSANGI', '717310266', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3773, 'ELIBARIKI DAUDI TSARA', '683621300', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3774, 'GRACE AINEA MSANGI', '715579386', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3775, 'EVA KENETH MKULU', '683621660', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3776, 'ROSE KOMBE', '693998346', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3777, 'REMY KOMBE', '782404878', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3778, 'AZIZA L. KABETA', '684668665', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3779, 'ISMAIL IBRAHIM', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3780, 'MARTHA A. SARIA', '716611796', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3781, 'ISAYA SHIJA MAGANGA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3782, 'EMILIANA EMMANUEL', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3783, 'FRANK BEATUS KIHONDO', '754994468', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3784, 'STEVEN EZEKIEL MGONJA', '765581063', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3785, 'ANNA STEVEN MGONJA', '673329329', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3786, 'MAYALA MADIRISHA', '715209667', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3787, 'FLORA J. KANKILA', '655565129', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3788, 'ALSON S. BWIRE', '715565128', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3789, 'COSMAS MBILINYI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3790, 'BENSON OKOTH OLOO', '754745779', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3791, 'GERUDE OKOTH OLOO', '757726729', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3792, 'MEDARDUS DANIEL MAPUNDA', '754420324', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3793, 'ESTHER LEONARD MHAGAMA', '621712616', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3794, 'SCHOLASTICA MAPUNDA', '621338833', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3795, 'FRANK KONDO', '656486671', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3796, 'MARRY NGAIZA', '713421541', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3797, 'ALPHA V. KONDO', '687379681', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3798, 'DOTTO JUMA ALLY', '687611343', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3799, 'DAVID I. MWANDETE', '756092511', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3800, 'COSTA YUSTIN PAUL', '788077618', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3801, 'MECYLINE KIMATI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3802, 'PAUL EMMANUEL', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3803, 'YOSEPHA NDEMEKA', '716456454', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3804, 'LETICIA MADINDA', '693792788', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3805, 'NEEMA GEORGE', '652835420', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3806, 'ANDREW A. MSUMENO', '7166501778', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3807, 'JANETH JOHN LASWAY', '718117488', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3808, 'SARA H. MBEKE', '759876940', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3809, 'ISACK MASANJA', '692719511', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3810, 'ELIAS ROBERT AUMWA', '676282827', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3811, 'FRANCIS AUGUSTINO CHAMI', '784313880', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3812, 'PETER ZAGA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3813, 'BESTIDA JUSTINE NDEREKA', '758123775', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3814, 'MATOKEO PETERSON KIBAMBA', '742371878', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3815, 'VICTORIA FRANCIS CHAMI', '784720003', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3816, 'PIO FRANCIS CHAMI', '784596915', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3817, 'KIZITO FRANCIS CHAMI', '672661798', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3818, 'PROTUS TESHA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3819, 'FRANCIS P .TESHA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3820, 'STELLA K. MAMBOSHO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3821, 'FARAJA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3822, 'ANGEL', '712564939', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3823, 'YOSTIS YOHANA MHINA', '782100452', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3824, 'HAPPY YUSTIS MHINA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3825, 'ALBINA M. RIMOY', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3826, 'PRECIOUS PROTAS KINABO', '756863533', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3827, 'DIONIS W. WISSO', '764056061', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3828, 'NEEMA D. WISSO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3829, 'ELIZABETH D. WISSO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3830, 'DEODATUS S. MALEMA', '699811319', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3831, 'SARAH ANTONY MANYONO', '712774792', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3832, 'EVELINA MUSSA MAKASSY', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3833, 'FAITH MUSA MAKASSY', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3834, 'MUSSA CHARLES MAKASSY', '678755778', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3835, 'ALLY ADAM KILA', '683488361', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3836, 'AMAN ADAM KILA', '788852501', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3837, 'MARIA ISACK', '789726784', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3838, 'HEMEDY A. KARUME', '766100182', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3839, 'KALUNDE AMIRI', '784471758', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3840, 'SALIMA OMARI KILA', '653601295', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3841, 'SAID HASSAN JOHARI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3842, 'IDD ADAM KILA', '684694693', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3843, 'JACKLINE JOSEPH MASANG', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3844, 'SAMWEL YUSTUS MHINA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3845, 'DORCAS YUSTUS MHINA', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3846, 'SIKUDHAN  HAMADI', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3847, 'LUKASI TOMASI TOBIASI', '71750343442', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3848, 'JUVENAL LADIUS KANJE', '682396339', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3849, 'DIIGNA JAMES TEMBA', '784810840', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3850, 'JONAS JUVENAL KANJE', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3851, 'JOSTIMU JUVENAL', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3852, 'BETUEL A KISOMA', '755531776', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3853, 'MAURA H TURUKA', '692134066', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3854, 'BAKARI IBRAHIMU', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3855, 'SABINA THOMAS', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3856, 'JAMES E NDAIGA', '745174206', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3857, 'WITNES A TARIMO', '745369863', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3858, 'MARK SHAO', '767289526', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3859, 'ADOROFINA MOSESI', '688361561', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3860, 'NEHENA FURUKO', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3861, 'CAROLINE MOSESE', '', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3862, 'DIKISON HIBRAIMU', '783753823', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3863, 'RERITA SAIDI', '713646210', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3864, 'ERASTO EMMENUEL MBIRIE', '674525682', 3, 7, '0.00', '0.00', '0.00', 3, 0),
(3865, 'SALUM OMARY MZUZURI', '682219815', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3866, 'ZAINA SAIDI ABDALAH', '711788760', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3867, 'BELO GODFREY KILO', '716041946', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3868, 'FLORA GODFREY', '758262679', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3869, 'SHILINDE MAKOYE', '765515205', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3870, 'ASHA ALLY SELEMANI', '686786902', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3871, 'MWANAIDI MOHAMED', '693326224', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3872, 'NOEL MFINANGA', '782669082', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3873, 'WITO MGONJA', '684179773', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3874, 'MFAUME MOHAMED', '788769990', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3875, 'EMMANUEL SILIWALI', '688156010', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3876, 'HEMIRIKO DAUDI', '654308815', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3877, 'RAMADHAN  KAYANDE', '689554461', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3878, 'RAMADHAN KIWEMBO', '622868359', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3879, 'JABIRI MZUKA', '624109050', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3880, 'MICHAELI MALITI', '676757451', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3881, 'GREYSON PANDU', '657735434', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3882, 'ELIA LEORNARD', '694042471', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3883, 'ATHuMAN SALUM', '763480706', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3884, 'ISACK DANIEL', '757575177', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3885, 'HERY RUVUGO', '742527447', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3886, 'ISACK MAGEMBE', '787527806', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3887, 'MARCO KIGODI', '688592620', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3888, 'ROSE KOLA HUMBA', '784523191', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3889, 'MARY KOLA', '653222599', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3890, 'DAVID E MALEGI', '684277588', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3891, 'SAUMU RAMADHANI', '684555013', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3892, 'ARON ISHENGOMA', '762479772', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3893, 'PATRICE MARIO', '686898165', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3894, 'MALO CHARLES', '788226786', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3895, 'HOWA MSEFYA', '785725494', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3896, 'HADIJA MRUMBA', '767416406', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3897, 'AMIDA HUSSEIN KAIGI', '655695858', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3898, 'HUSSEIN YUSUPH', '683096418', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3899, 'SULEIMANI ZAKARIA', '756402690', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3900, 'NESTORI E MALEGI', '684449006', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3901, 'MERINA MATHEW ', '685313599', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3902, 'MARIETHA MATHEW', '682676344', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3903, 'MONICA DANIEL MLAPONI', '656913255', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3904, 'EASTER LUCAS ', '657131846', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3905, 'JOHARI AMOS', '766325643', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3906, 'BAHATI YASINI', '718872333', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3907, 'BARAKA SAIMONI', '717036413', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3908, 'ZAINAB MOHAMED', '752176441', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3909, 'HASSANI JUSI', '784995173', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3910, 'MWIGA MFAUME', '767408692', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3911, 'RAJABU MFAUME', '676406208', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3912, 'TATU MFAUME', '754577686', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3913, 'MFAUME MFAUME', '693380495', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3914, 'MAGRETH JOSEPHAT', '694377515', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3915, 'KOLIMBA SAMWEL', '710153700', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3916, 'MONICA MuHOJA', '756712148', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3917, 'JULI SAMWELI', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3918, 'MAGRETH ONESMO', '712193786', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3919, 'PAULO JONIS', '717441796', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3920, 'MARY MABULA', '625000635', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3921, 'ERICK COSTA', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3922, 'COSTA MBOYA', '717200270', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3923, 'DEODATHA KOMBA', '683297756', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3924, 'SHABANI HAMISI', '656300773', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3925, 'HASSANI HAMISI', '673041425', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3926, 'MAIMUNA SALUM', '715469300', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3927, 'ANNA MHONE', '688586016', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3928, 'SAMWEL MHONE', '682297353', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3929, 'REGINA GERVAS', '713525571', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3930, 'JUMA OMARY', '719817647', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3931, 'HABIBA JUMA', '679409404', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3932, 'SHABANI JUMA', '758077256', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3933, 'UPENDO AYUBU', '762544458', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3934, 'JUMA YUSUPH KANDULU', '653250346', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3935, 'CLINTON MICHAEL LIKONGA', '659693503', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3936, 'ALBERT URASA', '713409057', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3937, 'LUCIA FADHILI', '658006471', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3938, 'AGUSTINO HAMISI', '685830577', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3939, 'STEVEN EUGINE KILIWA', '658108150', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3940, 'DAUDI LUBEYA', '787761510', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3941, 'ENES A MWAKASENGE', '713505172', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3942, 'CIARA DAUDI', '657747350', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3943, 'IRENE DAUDI', '692887516', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3944, 'VICENT DAUDI', '625811576', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3945, 'MWALIMU MWINYIGOHA', '754518123', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3946, 'UPENDO B MANYENGA', '626222224', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3947, 'ALEX MAKENE', '713821212', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3948, 'DR.KARAFUNJA OSAKI', '754679173', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3949, 'ANTONI TUKAI', '787136141', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3950, 'PERITO MAHINDA', '786670405', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3951, 'RASHIDI SALULU', '719107297', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3952, 'ERNEST MAGWAYA', '788200710', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3953, 'RACHEL IGWISYA', '785798169', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3954, 'LOVENESS IGWISYA', '762016044', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3955, 'ANNA NYARONGA', '717939373', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3956, 'GUARD MZIRAY', '713350521', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3957, 'MALALE A MASWANYA', '713663926', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3958, 'UGUMBA A MASWANYA', '655921916', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3959, 'ISANGA A MASWANYA', '746775551', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3960, 'MASWANYA A MASWANYA', '719616730', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3961, 'PROF JOE LUGALA', '682494686', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3962, 'MWAUSA MASANYA ', '784771887', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3963, 'RAMADHAN MASENGA', '688602177', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3964, 'MOSHI MASENGA', '676744433', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3965, 'AMINA MATOLA', '658268238', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3966, 'MIKE MANDE', '719217479', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3967, 'MOHAMED MILANZI', '686786902', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3968, 'PROF.H.MGOMBELO', '784471993', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3969, 'MASENGWA RAMADHANI', '692598019', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3970, 'SALOME B MUSSANA', '759907060', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3971, 'DAUDI SIMON', '757572730', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3972, 'JUMA MZUZURI', '716093116', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3973, 'CHRISTIAN SHIRIMA', '784235440', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3974, 'WITNESS KIUSA', '683518841', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3975, 'ZAWADI ASSA', '654272729', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3976, 'MAGRETH MSEFYA', '714666385', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3977, 'ZUHURA MKINDI', '717366764', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3978, 'PRISCA NGODA', '693333882', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3979, 'ISABELA VICENT', '752725966', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3980, 'FIDELIS M KAIJAGE', '763210484', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3981, 'FURAHA B MANYEGA', '758123055', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3982, 'HAMISI HAMISI', '715542274', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3983, 'GETRUDE LOKI', '689206090', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3984, 'ANGELINA W MTUU', '715216894', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3985, 'ASSA RUBEN', '763523800', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3986, 'AKWILA MMBAGA', '746208912', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3987, 'JOSFON JACKSON', '744278080', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3988, 'ARON MATONYA', '716302346', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3989, 'ABED JAMES', '733510800', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3990, 'NDEWINA OSAKI', '686316416', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3991, 'CHARLES MUHANGWA', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3992, 'TUMA ALLY JUMA', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3993, 'DICKSON MATINYI', '753778699', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3994, 'LAWRENCE MUHAGAWA', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3995, 'GEORGE MLAWILA', '743025700', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3996, 'REUBEN YOHANA CHACHA', '753437733', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3997, 'DEUS SIMON', '748243659', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3998, 'MATHIAS SIMON', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(3999, 'MWANAHAMISI RASHIDI', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4000, 'JUMA MGAYA', '692770542', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4001, 'NEEMA MAHINDA', '787352809', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4002, 'QUEENLIZY MICHAEL', '622677895', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4003, 'MSAFIRI KULWA', '', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4004, 'MZEE MALEGI', '689928488', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4005, 'JOHA ERNEST MALEGI', '692718587', 4, 1, '0.00', '0.00', '0.00', 4, 0),
(4006, 'FRED HURUMA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4007, 'EDISON KIFOKO', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4008, 'ANETH SHAYO', '653188600', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4009, 'JAMILA JAPE', '657166140', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4010, 'ANDREW AFANIKIWE CHAULA', '769960768', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4011, 'SAIDA BAKARI', '762723189', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4012, 'ERNEST KANNA', '788200719', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4013, 'MEGU WILSON MVANO', '757471637', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4014, 'EDNA CHARLES', '655595650', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4015, 'PASCHAL DISMAS', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4016, 'SUZANA PASCHAL LWEGO', '656669034', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4017, 'JOSEPHINE JULIUS MBOZO', '759198432', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4018, 'ALEX ERNEST', '654841914', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4019, 'BONIPHACE NYAMAHANGA', '654615407', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4020, 'DANIEL YONA', '754788966', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4021, 'EDINA BENARD', '684031884', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4022, 'EDWARD NKWABI', '688516574', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4023, 'ELIAKIM MOSHI', '658810190', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4024, 'ELIZABETH HENRY YONA', '655476560', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4025, 'EPHRAIM E. KALINGA', '713784190', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4026, 'ERICK MARUPA', '758151512', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4027, 'GERVAS KADIO', '757066448', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4028, 'IRENE LYIMO', '652710689', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4029, 'ISMAIL ABDULRAHAMAN', '769122885', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4030, 'JANE JOSEPH', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4031, 'JANE MADLU', '717123143', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4032, 'JOSEPH JOSEPH CHALE', '712857237', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4033, 'JOSEPH MUKONO', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4034, 'KHADIJA JUMA MUNNA', '719692391', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4035, 'ERICK EMMANUEL', '757066448', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4036, 'KILIAN KAMOTE', '653763201', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4037, 'MAGRETH S. MATHAYO', '743113515', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4038, 'NEEMA NYIGWA', '672029925', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4039, 'NOEL MSIMBE', '716722560', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4040, 'OLIVIA EDWARD', '658398771', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4041, 'PAUL R. MBASHA', '654598219', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4042, 'PETER LEONARD', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4043, 'POLITE P. KAMETA', '762354927', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4044, 'RAHIM JUMA', '658121820', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4045, 'RITHA FREDY', '763763577', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4046, 'SAMSON E. SHAIDI', '788000004', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4047, 'SAMWEL MTALEMWA', '717808989', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4048, 'SHAMSA A. MANZI', '788000027', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4049, 'STEPHEN MNDEME', '713667214', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4050, 'SWEDI BORI', '713319064', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4051, 'SAKINA SHABANI MKEMBE', '717083935', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4052, 'ISMAIL SWEDI BORI', '717737080', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4053, 'NASMA SWEDI BORI', '657030198', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4054, 'NASRA SWEDI BORI', '711601003', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4055, 'SALEHE CASMIR KIMARO', '652908414', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4056, 'ASIAH ABDALLAH', '716884553', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4057, 'RAJAB S. NGEMBA', '653071992', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4058, 'MADADI OMARI', '718516229', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4059, 'MOHAMED SUNDAY', '654830607', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4060, 'DEOGRASIAS MLAMKA', '753639955', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4061, 'FRAINE NGAILO', '756911898', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4062, 'SIF ALLY NYILENDA', '652277900', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4063, 'REGINA JOHN  ZACHARIA', '746561106', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4064, 'ERASMUS LEON MMARY', '754832638', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4065, 'DOMINICK MATANDIKO', '622815274', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4066, 'SANGIJA NICHOLAUS', '755961510', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4067, 'TEMBO JACKSON', '743689384', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4068, 'MICHAEL GERVAS MICHAEL', '652057925', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4069, 'ANNA GERVAS MICHAEL', '678515296', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4070, 'MICHAEL GERVAS KOMBO', '676650330', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4071, 'FRIDA GERVAS MICHAEL', '714041662', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4072, 'BONIFACE D. MKANGA', '652504666', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4073, 'ANNA GEROGE MWENDA', '657879622', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4074, 'HAMZA GILION MOYO', '715915950', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4075, 'JOSEPHER H. MOYO', '674911643', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4076, 'SELINA JOSEPH MHAGAMA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4077, 'SALUM BAKARI', '718244687', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4078, 'JOYCE H. MOYO', '713244763', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4079, 'BARAKA ADAM MWAMBASHI', '787223273', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4080, 'PROSPER A.NGOWE', '679972766', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4081, 'BARAKA A. MWAMBASHI', '658226089', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4082, 'JAMARI JAFARI', '719212720', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4083, 'MSAFIRI ALLY  ABDALLAH', '715814591', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4084, 'JAMILA MUHAGE', '656324197', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4085, 'WARDA MSAFIRI', '717213180', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4086, 'TWAHA MSAFIRI', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4087, 'RASHIDI JUMA MAHAGE', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4088, 'WAHIRU JUMA MUHAGE', '742237143', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4089, 'HEMED HAMIS SAID', '786956056', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4090, 'MARY W. MBOZU', '754399748', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4091, 'TESHA KADUNDU', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4092, 'ELIAS JULIUS LOKO', '764645182', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4093, 'MUSSA KUDRA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4094, 'JULIETE COSTA', '714638573', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4095, 'JUSTINE DAUD', '658360623', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4096, 'RASHID S. MAWAYA', '719112797', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4097, 'ABDALLHA R. MAWAYA', '679063963', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4098, 'MWANAHAMISI R. MAWAYA', '654614133', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4099, 'ALIMISHA ALLY', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4100, 'HASSAN R. MAWAYA', '689497573', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4101, 'SHABAN R. SALIM', '766781628', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4102, 'JUMA R. MAWAYA', '717379513', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4103, 'RAJAB R. MAWAYA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4104, 'RAMADHAN ATHUMAN', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4105, 'JOSEPH LUCAS', '766983104', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4106, 'HASHIM A.RAJAB', '745718696', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4107, 'CATHERINE H. KIMBO', '653584798', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4108, 'HALIMA HAMISI', '692374056', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4109, 'RAYMOND E. MAGESA', '757394168', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4110, 'LEANA MUTAYOBA', '765271446', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4111, 'ANETH MUNISHI', '677267740', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4112, 'MAKULA JOSEPH', '766527877', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4113, 'KANSIGO E. EMILY', '657685411', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4114, 'NDIMI MAYALA', '766731354', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4115, 'KIWALE WISDOM', '769020993', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4116, 'HALIMA RAMADHAN', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4117, 'GEORGE KILULA', '677572968', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4118, 'SAID BAKARI', '762723189', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4119, 'ERNEST KANDA', '717740328', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4120, 'SAID MOHAMED MARITI', '719519996', 4, 2, '0.00', '0.00', '0.00', 4, 0);
INSERT INTO `tbl_wakazi` (`mkazi_id`, `mkazi_name`, `mkazi_phone`, `mkazi_zone`, `mkazi_shina`, `mkazi_ahadi`, `mkazi_malipo`, `mkazi_deni`, `mkazi_monitor`, `payment_status`) VALUES
(4121, 'PEREPETUA DORIS MVAA', '653584798', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4122, 'OMARI SAID', '765277577', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4123, 'SIWA SAID MARITI', '714270966', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4124, 'HAPPY THADEO', '659534729', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4125, 'MICHAEL MWANGAKALA', '788454216', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4126, 'MOHAMED SAID MARITI', '657111913', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4127, 'TERESPHORY T. BATEZI', '767633818', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4128, 'ANETH A. KIMUTUO', '713633818', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4129, 'JANE THERESPHORY', '711436102', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4130, 'HELENA W. MTATINA', '736633818', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4131, 'MAULID ALLY', '654201419', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4132, 'OMARI MAULID', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4133, 'HAMADI ADAM', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4134, 'KOSENA NKENDYANOI', '762502025', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4135, 'ROZINA CHAWALA', '743101377', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4136, 'ABDALLAH SHABAN', '712062452', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4137, 'HUSNA JUMA', '652793820', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4138, 'DICKSON W. MWENDA', '786576249', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4139, 'COSMA M. MWANYIKA', '7668576250', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4140, 'STYAWANU Y. SENYAGWA', '719128013', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4141, 'GRACE SHILLA', '754401050', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4142, 'AMANI SHILLA', '652168477', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4143, 'MAGRETH ELIYA OMARI', '785707468', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4144, 'EVELINE KINGU KITUNDU', '746268194', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4145, 'NOVATUS D. MAKENE', '762904025', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4146, 'JAMES M. BUNYUNGU', '716119598', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4147, 'GIDION SAMWEL', '762676143', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4148, 'PROSEPR L. MWANGOMILE', '766894406', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4149, 'MAEMBE EMMANUEL', '755654676', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4150, 'JOHNSON GEOFREY JOSEPHAT', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4151, 'SHABAN ZOGORA', '713326894', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4152, 'MARTIN RAYMOND NKINI', '713603712', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4153, 'CHRISTINA M. SIKANENDA', '746383053', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4154, 'ESTHER M SIKANENDA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4155, 'SETH R. ASURE', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4156, 'EDWARD M. SIKANENDA', '652254633', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4157, 'PHILIPO GEORGE MAPUNDA', '752538138', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4158, 'TEDDY ISSA CHELEWA', '714357130', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4159, 'ANTON M. SIKANENDA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4160, 'ANDREW URANDO', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4161, 'NISENT P. BEDA', '716769653', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4162, 'JESCA G. FILBETH', '742211039', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4163, 'CHRISTIAN BEDA', '782487140', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4164, 'IRENE R. NKINI', '713603712', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4165, 'HAPPYNESS VICENT', '759194376', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4166, 'ANGELA JUSTINE', '763296825', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4167, 'EMMANUEL MDEKIPALA', '712057896', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4168, 'JOHN J. SIWALE', '674609076', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4169, 'MOHAMED SAMA', '713421031', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4170, 'ATHLAR E. RUTAGANDANDANA', '768199934', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4171, 'SAUDA KAJUNA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4172, 'SASHA GEORGE', '629059647', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4173, 'SAID MANZI', '717050618', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4174, 'REHEMA SAID MARITI', '658553238', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4175, 'SAID SALUM', '785766811', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4176, 'KARAFUNJA OSAKI', '754679173', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4177, 'HELENA MABALA', '653141439', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4178, 'JOSEPH MABALA NGUWA', '754579903', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4179, 'LUCAS J. MABALA', '712184692', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4180, 'JESCA JAMES', '713328092', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4181, 'LEONARD TARIMO', '767401621', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4182, 'YUSTA B. PAUL', '767401621', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4183, 'KHADIJA MOHAMED', '716317590', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4184, 'KULWA S. MAGAZI', '764212456', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4185, 'MSAFIRI SHEMFUKO', '718937112', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4186, 'ESTHER JOSEPH MABALA', '714562680', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4187, 'ENOCK EZEKIEL KITINGA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4188, 'ROSE MUNISI', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4189, 'CYPRIAN F. KIPALAMOTO', '713323814', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4190, 'LUKE MOHAMED MGENDELA', '786648637', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4191, 'DEOGRATIUS LUKA MGENDELA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4192, 'LUCAS MGENDELA', '789238341', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4193, 'COLETHA RAYMOND MKENDYANONI', '715119011', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4194, 'MARY CHALAMILA', '754307594', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4195, 'SALLY CHALAMILA', '782962580', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4196, 'EVARTO CHALAMILA', '674953149', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4197, 'MARIAM AMAN', '759605593', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4198, 'ABDUL MUSTAFA KONDO', '672092956', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4199, 'FIKIRI MPONDA', '769266928', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4200, 'DIANA LEONARD', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4201, 'SHARIFA SIMON', '766459770', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4202, 'PAULO MASTONE', '686519616', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4203, 'DAUD MUSSA', '718148108', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4204, 'DISMAS LUEGO', '716312353', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4205, 'MARI DISMAS', '656569038', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4206, 'TEDDY LWEGO', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4207, 'ELIUFOO MAHINDA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4208, 'EMMANUEL NYIGA', '754016803', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4209, 'CHRISRINA JACOB SHIMBI', '758730055', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4210, 'ANNA SIMBA', '754834972', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4211, 'ISRAEL SIMBA', '754605598', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4212, 'KRIGO ELIUFOO', '713548242', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4213, 'NEEMA THADEO MASANJA', '717457045', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4214, 'LIDYA VEDASTUS COSTANTINO', '743492626', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4215, 'LENA MAHINDA', '784798494', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4216, 'ROSE ANAYAKUA', '652574501', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4217, 'MANKA ANYAKUA', '786820827', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4218, 'MAGDALENA HANGO', '759203324', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4219, 'CECILIA E. ANDREW', '745808891', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4220, 'EVA EMMANUEL', '653347331', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4221, 'JULIUS E. ANDREW ', '657518239', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4222, 'SUZANA V. LUBIIGHA', '768464331', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4223, 'FAITH I. UDOBA', '656013328', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4224, 'GRACE JOSEPH', '679833425', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4225, 'TANDU PONGOLA', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4226, 'MICHAEL MATENGA', '769051286', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4227, 'SIYAWANI YESE', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4228, 'NORBERT NOMBA', '768676518', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4229, 'LODLAND G. JOHN', '754069769', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4230, 'DICKSON MATINYI', '753778699', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4231, 'TATU JUMANNE SIMBA', '652323231', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4232, 'BARAKA ALPAKUSHANI', '676236697', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4233, 'ROSE NYONI', '713153123', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4234, 'SOPHIA MAKUNYA', '719742549', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4235, 'ZWADI J ASSA', '742232984', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4236, 'PHILIMON SILAS', '676663599', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4237, 'JOSEPH MATUNDE', '653111119', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4238, 'MARIETHA ELIAS', '653111119', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4239, 'DOTO JOSEPH MTUNDE', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4240, 'SOPHIA JOSEPH MTUNDE', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4241, 'JUSTINA JOHN MATERU', '', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4242, 'JAMES FRANCIS MASAWE', '754372822', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4243, 'FRANCIS SILAYO DIONIS', '752596806', 4, 2, '0.00', '0.00', '0.00', 4, 0),
(4244, 'HAMIS ABDULRAHAMN FIMBO', '755008290', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4245, 'JUMA ABDULRAHAMAN FIMBO', '716686448', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4246, 'YUSUPH ABDULRAHAMAN FIMBO', '718944162', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4247, 'NURU ALLY KOMBA', '657676160', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4248, 'MAULA GEORGE KOMBA', '652199915', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4249, 'AZIZA BAKARI MPULUZI', '786395722', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4250, 'RASHID ALLY MKONO', '713241818', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4251, 'MWAJUMA MOHAMED RAMADHAN', '714175830', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4252, 'ABDULRAHAMAN FIMBO', '659806049', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4253, 'FATUMA ABDALLAH MOSHI', '654085206', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4254, 'SALUM HAMIS FIMBO', '693387754', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4255, 'RUKIA YUSUPH FIMBO', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4256, 'ABDULKARIM YUSUPH FIMBO', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4257, 'GEORGE ENOCK SANGA', '713232702', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4258, 'MAGANA ATHUMANI LEGEZA', '765010494', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4259, 'GWERINO WILLIUM CHUNGU', '786404018', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4260, 'ROGATH IBRAHIM MWAKAWAGO', '719812849', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4261, 'FRANK OBADIA MAKALA', '715890676', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4262, 'JUSTIN JIMSON FIHAVANGO', '716797998', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4263, 'SALAMA MOHAMED', '676178436', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4264, 'ABDUL YAHYA SALUMU', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4265, 'KARIM YAHYA SALUMU', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4266, 'PETRO PAULO MAIGE', '784622841', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4267, 'NEEMA PETRO MAIGE', '784759780', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4268, 'ASHURA ATHUMAN KUGO', '679975360', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4269, 'SADIKI HEMED MWAMTEMI', '655489184', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4270, 'RUKIA KAMOTE RAJABU', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4271, 'OLIVIA ANYANGISYE MWANDUPE', '674912825', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4272, 'ABDALLAH RASHID KIGOMA', '714985261', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4273, 'FRIDA JACKSON LEONARD', '754247648', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4274, 'MUSA SADIKI MWAMTEMI', '656108457', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4275, 'ZUENA JUMA SAID', '712621790', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4276, 'MARIAM ABDALLAH FIHAVANGO', '714238458', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4277, 'IRENE ELIZABETH HIZA', '743395215', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4278, 'JACKLINE RENATUS BULAKA', '768208897', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4279, 'LASTON THOMAS MSONGOLE', '713602185', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4280, 'ANDENGENYE ANDAMBWILE MWAIPOPO', '884281706', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4281, 'NSUBILI AMON MWAIPOPO', '784239020', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4282, 'WILLIUM VICTOR KILUSUNGU', '786404018', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4283, 'NESTORY BARNABAS MABEYO', '654697479', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4284, 'JOSEPH MAJEMBE MJANJA', '674337950', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4285, 'SALVATORY JOHN SWAI', '713400861', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4286, 'CLARA ABROGASTI PAULO', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4287, 'MARY PETER MABUBU', '718891461', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4288, 'DAUDI YONA KAMOTE', '714951901', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4289, 'HERIETH YONA KAMOTE', '658452760', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4290, 'EVELINA YONA KAMOTE', '652317758', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4291, 'VICK SILYVESTA', '674738738', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4292, 'ABDALLAH MOHAMED NAMNYOLI', '783880562', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4293, 'HIDAYA RAMADHAN MKELEMI', '712076523', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4294, 'SALUSTIA SOLA LUKONGE', '713690000', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4295, 'MJEMA CHIKILA', '657501918', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4296, 'DOTO REUBEN HAJI', '683072889', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4297, 'DOTO ALLY SHOMARI', '769054898', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4298, 'JOSEPH MWASENGA', '715376673', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4299, 'MWANAID W. GOGO', '652574640', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4300, 'VERONICA BUNDALA DAUDI', '757627262', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4301, 'ABIUD JUMA JOHN TARIMO', '784462088', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4302, 'PASCHAL DISMAS LWEGO', '659271037', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4303, 'PETER HALIFA KIWANGA', '739033882', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4304, 'JOSEPH PETER NTUNDE', '652111119', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4305, 'MOHAMED ALLY LUMONDO', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4306, 'DICKSON KASHINDE MGASHI', '685084660', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4307, 'RICHARD LULALE', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4308, 'BUGUMBA MATOBOKI', '717217901', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4309, 'SAUDA MASOUD SELEMAN', '715791597', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4310, 'JABIL JUMA', '658024274', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4311, 'MAGRETH MKENGA', '715033649', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4312, 'ABRAHAM PETRO MAYIGE', '787146807', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4313, 'MARIAM SAID MOHAMED', '744049804', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4314, 'REVIVAL JUSTINE FIHAVANGO', '744923087', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4315, 'ANNA ROMAN ANDREA', '684345102', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4316, 'JACKSON PETE', '712176290', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4317, 'FRANSISCA FREDY KIRIBATA', '712803373', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4318, 'MADUKI PETE SALEHE', '656016471', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4319, 'MARIETHA ELIAS', '653111119', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4320, 'ANNA PETE KWIZE', '784265341', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4321, 'DELFINA CYPRIAN MMUHUMPA', '756864317', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4322, 'MOSSES MAURUS AMIR', '682515868', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4323, 'SOFIA JOSEPH PETE', '786929853', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4324, 'MWASI JOSEPH MOSES', '', 4, 3, '0.00', '0.00', '0.00', 4, 0),
(4325, 'AUBI MAULID', '718528679', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4326, 'HAWA ATHUMAN', '719079968', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4327, 'SHABAN AUBI', '788153059', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4328, 'BONIFACE KASORO', '742209368', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4329, 'PAULINA GILBERT', '759584992', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4330, 'LILIAN MDACHI', '655570151', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4331, 'SAID SELEMA HUSSEIN', '713549822', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4332, 'MWANAMVUA RAJAB', '717049529', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4333, 'OMARY RAJAB', '713182413', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4334, 'NURU FIDELIS', '744041583', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4335, 'MOHAMED JUMA', '711864467', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4336, 'ILUMINATA MPANDIKIZI', '719062575', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4337, 'DAUDI MLAMKA', '712530741', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4338, 'GLORIA FRANCIS', '746312893', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4339, 'RAJAB JUMA', '784934713', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4340, 'HALIMA HAMAD', '713803211', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4341, 'MANSARD RAJAB', '710624846', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4342, 'AYUB MTANGO', '714197524', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4343, 'ALICE RUBEN', '714197524', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4344, 'LUTUFYO N MASAWE', '713099399', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4345, 'FANUEL B MWASHINANGA', '712050396', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4346, 'PENDO DICKSON', '746774069', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4347, 'FREDRICK C. MARTIN', '714471846', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4348, 'SARAH H. KISIMBA', '714471846', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4349, 'NKELEBE SAMSON', '683767594', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4350, 'HALIMA HAMIS', '693538734', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4351, 'COSSAN JUMA', '766633695', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4352, 'MAKRINA MOSHI', '766633695', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4353, 'JOHN KITALE', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4354, 'VICTORIA HAMIS', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4355, 'MARIAM SIMBANO', '717035733', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4356, 'MOHAMED SIMBANO ', '657624938', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4357, 'MWAJUMA RAJAB', '659965331', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4358, 'SELEMANI SIMBANO', '713996727', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4359, 'MWAJUMA SIMBANO', '684742587', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4360, 'ZAITUNI ALLY MDEME68', '684999301', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4361, 'VERONICA MASAWE', '652338500', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4362, 'RAMADHAN ALLY MDEME', '693194322', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4363, 'ALLY SIMBANO', '655075003', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4364, 'MARIAM KAMANDO', '764684831', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4365, 'JOHN MONGA', '788556024', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4366, 'RAMADHAN MUSA', '684869602', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4367, 'MOHAMED MAHAMOUD', '783294575', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4368, 'SARAH ZAKARIA', '783294575', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4369, 'MATHEO MSONGA', '714581364', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4370, 'AGNESS NZUMBI', '757941771', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4371, 'ABDUL', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4372, 'YUSTINA ZAKARIA', '766744691', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4373, 'BONIFACE BUNDALA', '757509291', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4374, 'RAMADHAN MKENGA', '659535848', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4375, 'HUSSEIN RAMADHAN', '678957266', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4376, 'JUMA RAMADHAN', '677730684', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4377, 'HAMIS RAMADHAN', '677730684', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4378, 'SIAM RAMADHAN', '678957266', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4379, 'FRANK LEONIDAS', '754711166', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4380, 'MWANAKOMBO RAMADHAN', '763050291', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4381, 'PLASDIA KAIJAGE', '754214590', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4382, 'BAHATI SEIF', '710058110', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4383, 'ABDUL AYOUB', '683616144', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4384, 'PRIVATUS RUBEN', '789960672', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4385, 'MARCEL BANYIKWA', '655283319', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4386, 'DERICK P BANYIKWA', '716003361', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4387, 'JUSTINE M BANYIKWA', '715158827', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4388, 'SARAH J MARCEL', '679586515', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4389, 'IBRAHIM MILASI 657', '657608467', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4390, 'DAVID FRED', '626071884', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4391, 'MARIAM ', '717328808', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4392, 'CHRISTPHER MARTIN', '715177396', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4393, 'NEEMA SAMWEL', '692765284', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4394, 'PAUL KADA', '786356989', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4395, 'DIANA JOHN', '769221313', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4396, 'JULIETH MICHAEL', '716270495', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4397, 'LUCAS ANTONY', '659756111', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4398, 'CHRISTINA STEVEN', '659756111', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4399, 'YOLANDA JOHN', '763086713', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4400, 'FRED ANTONY', '716520560', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4401, 'JOYCE MABULA', '719734487', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4402, 'YOLANDA JOHN', '763086713', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4403, 'MICHAEL GAO', '713252063', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4404, 'MARY MAKENZI', '717257841', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4405, 'HAPPNESS RAYMOND', '757935120', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4406, 'IBRAHIM MDEM', '715199501', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4407, 'ELICE HENRY CHIGUNDU', '655487776', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4408, 'HENRY CHIGUNDU', '655246248', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4409, 'ALEN CHIGUNDU', '683460270', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4410, 'AMOREN CHIGUNDU', '733294585', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4411, 'PETER JAMES MAKUNGA', '715318087', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4412, 'STEVEN MBILINYI', '679972965', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4413, 'ROSEMARY LEONARD', '742185393', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4414, 'YEFTA SAMWEL', '674143392', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4415, 'DEO WILBERT', '713692375', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4416, 'IDIKIEL KALALU', '657097291', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4417, 'ELIZABETH NJAU', '788324579', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4418, 'EMMANUEL MABULA', '685275932', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4419, 'KALISTA MAGWATA', '784487231', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4420, 'CONSOLATA MABULA', '784254624', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4421, 'GODLIVER MABULA', '785941044', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4422, 'ROSEMARY MABULA', '789048174', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4423, 'GETRUDA MABULA', '784487231', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4424, 'JUMANNE GAGESA', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4425, 'ELIZA BERNARD', '782463031', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4426, 'RAJABU MKUDE', '713757165', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4427, 'HAPPY DAMAS', '712261461', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4428, 'MONALISA DONARD', '787856502', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4429, 'ZAWAD ANTON', '714124325', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4430, 'ZAINABU MUSTAFA', '717414830', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4431, 'OTAVINA KIPONDA', '694022818', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4432, 'OTHUMAN ZUBERI', '652511697', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4433, 'MARIAM A. KITANGO', '684302787', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4434, 'DAUSON DAUDI', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4435, 'MUSTAFA MKILIWA', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4436, 'CHAMI CLIFF', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4437, 'ABEL CHARLES KANKILA', '657170022', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4438, 'ANJELINA  KANKILA', '788871724', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4439, 'CHARLES KANKILA', '787625708', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4440, 'WITNESS  KANKILA', '684148957', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4441, 'ABEL SENGA', '713432464', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4442, 'MELANIA KASESE', '713762574', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4443, 'JOYCE FIFI', '759291640', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4444, 'SIMON W. MASOLWA', '713762574', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4445, 'ELIZABETH MAKENZI', '652476151', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4446, 'MARIA W. MASOLWA', '752535284', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4447, 'YUSTINA W. MASOLWA', '652380475', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4448, 'MARIA KABITA', '624507980', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4449, 'EMMANUEL W. MASOLWA', '712081486', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4450, 'SHUKURU A. SOVELA', '755796970', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4451, 'IRINE MGOMBELO', '756934810', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4452, 'NAPOLION MGOMBELO', '629028065', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4453, 'KIBEA G. MAKUTA', '764358516', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4454, 'DAUDI MBOGO KAPAYA', '678551868', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4455, 'BARAKA DAUDI', '683838056', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4456, 'MICHAEL JACOB', '678551868', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4457, 'GOD CLEMENT', '683838056', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4458, 'LITES', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4459, 'WASENGO BAR AND GUEST HOUSE', '710076502', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4460, 'ROBART MWAJA', '658761275', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4461, 'BAHATI ROBART MWAJA', '717605608', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4462, 'ZAINABU ALEX', '656534124', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4463, 'ESTER ROBERT MWAJA', '683488643', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4464, 'MARY SAILEPU LAIZA', '788279364', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4465, 'JACOB CHARLES', '693688234', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4466, 'MALKI PETER OJANI', '789187737', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4467, 'TUNU RAJABU', '654170374', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4468, 'ABDALAH S. KITANGO', '688581984', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4469, 'MWAKA RAMADHANI', '688851984', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4470, 'NUHU ABDALAH KITANGO', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4471, 'EMANUEL KAPILA', '754570335', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4472, 'KAPWETE SABURI', '757170415', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4473, 'VERONIKA KAPILA', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4474, 'BAHATI SELESTINE', '713401557', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4475, 'BONIFASI KAPILA', '713510900', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4476, 'JOHN M. SABURI', '711281686', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4477, 'MARIALAIDA GONGAYI', '754271685', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4478, 'YUSTA D. MWINUKA', '752875750', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4479, 'CATHELINAB YOHANA', '712573362', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4480, 'JUMANNE YOHANO', '786175914', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4481, 'SAID BAKARI', '676303906', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4482, 'ASHURA SAID', '715012513', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4483, 'SOZI MAZIKU ISABUDA', '782654412', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4484, 'JENIPHA BETROD', '782654412', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4485, 'MTILI HAMIS KOMBA', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4486, 'AYUBU MOHAMED OLOTU', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4487, 'FARIDA KOMBO MASSAWE', '', 4, 5, '0.00', '0.00', '0.00', 4, 0),
(4488, 'OTHUMAN AYUBU OLOTU', '255715689067', 4, 4, '0.00', '0.00', '0.00', 4, 0),
(4489, 'ASA  MWAIPOPO', '255767000017', 3, 3, '10000000.00', '1000000.00', '9000000.00', 3, 1),
(4490, 'JOAQUIM SHIRIMA', '0742731298', 3, 3, '2000000.00', '0.00', '2000000.00', 3, 0),
(4491, 'YONATHAN MWAKIBELA', '0754666799', 3, 5, '103000.00', '0.00', '103000.00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_zones`
--

CREATE TABLE `tbl_zones` (
  `zone_id` int(11) NOT NULL,
  `zone_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_zones`
--

INSERT INTO `tbl_zones` (`zone_id`, `zone_name`) VALUES
(1, 'Kaskazini'),
(2, 'Kati'),
(3, 'Magharibi'),
(4, 'DTV');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_dini`
-- (See below for the actual view)
--
CREATE TABLE `view_dini` (
`dini_id` int(11)
,`dini_name` varchar(150)
,`dini_phone` varchar(20)
,`dhehebu_id` int(11)
,`dhehebu_name` varchar(150)
,`dini_ahadi` decimal(16,2)
,`dini_malipo` decimal(16,2)
,`dini_deni` decimal(16,2)
,`payment_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_institutions`
-- (See below for the actual view)
--
CREATE TABLE `view_institutions` (
`institution_id` int(11)
,`institution_name` varchar(150)
,`institution_phone` varchar(20)
,`id` int(11)
,`name` varchar(100)
,`institution_ahadi` decimal(16,2)
,`institution_malipo` decimal(16,2)
,`institution_deni` decimal(16,2)
,`payment_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_mikutano`
-- (See below for the actual view)
--
CREATE TABLE `view_mikutano` (
`mkutano_id` int(11)
,`mkutano_name` varchar(150)
,`mkutano_phone` varchar(20)
,`mkutano_location` varchar(80)
,`type_id` int(11)
,`type_name` varchar(80)
,`mkutano_ahadi` decimal(16,2)
,`mkutano_malipo` decimal(16,2)
,`mkutano_deni` decimal(16,2)
,`payment_status` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_wakazi`
-- (See below for the actual view)
--
CREATE TABLE `view_wakazi` (
`mkazi_id` int(11)
,`mkazi_name` varchar(150)
,`mkazi_phone` varchar(20)
,`zone_id` int(11)
,`zone_name` varchar(100)
,`mkazi_shina` int(11)
,`mkazi_ahadi` decimal(16,2)
,`mkazi_malipo` decimal(16,2)
,`mkazi_deni` decimal(16,2)
,`monitor_id` int(11)
,`monitor_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `view_dini`
--
DROP TABLE IF EXISTS `view_dini`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u552102571_snott`@`127.0.0.1` SQL SECURITY DEFINER VIEW `view_dini`  AS   (select `tbl_dini`.`dini_id` AS `dini_id`,`tbl_dini`.`dini_name` AS `dini_name`,`tbl_dini`.`dini_phone` AS `dini_phone`,`tbl_madhehebu`.`dhehebu_id` AS `dhehebu_id`,`tbl_madhehebu`.`dhehebu_name` AS `dhehebu_name`,`tbl_dini`.`dini_ahadi` AS `dini_ahadi`,`tbl_dini`.`dini_malipo` AS `dini_malipo`,`tbl_dini`.`dini_deni` AS `dini_deni`,`tbl_dini`.`payment_status` AS `payment_status` from (`tbl_dini` join `tbl_madhehebu` on(`tbl_dini`.`dini_dhehebu` = `tbl_madhehebu`.`dhehebu_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_institutions`
--
DROP TABLE IF EXISTS `view_institutions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u552102571_snott`@`127.0.0.1` SQL SECURITY DEFINER VIEW `view_institutions`  AS   (select `tbl_institutions`.`institution_id` AS `institution_id`,`tbl_institutions`.`institution_name` AS `institution_name`,`tbl_institutions`.`institution_phone` AS `institution_phone`,`tbl_institutions_list`.`id` AS `id`,`tbl_institutions_list`.`name` AS `name`,`tbl_institutions`.`institution_ahadi` AS `institution_ahadi`,`tbl_institutions`.`institution_malipo` AS `institution_malipo`,`tbl_institutions`.`institution_deni` AS `institution_deni`,`tbl_institutions`.`payment_status` AS `payment_status` from (`tbl_institutions` join `tbl_institutions_list` on(`tbl_institutions`.`institution_list` = `tbl_institutions_list`.`id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_mikutano`
--
DROP TABLE IF EXISTS `view_mikutano`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u552102571_snott`@`127.0.0.1` SQL SECURITY DEFINER VIEW `view_mikutano`  AS   (select `tbl_mikutano`.`mkutano_id` AS `mkutano_id`,`tbl_mikutano`.`mkutano_name` AS `mkutano_name`,`tbl_mikutano`.`mkutano_phone` AS `mkutano_phone`,`tbl_mikutano`.`mkutano_location` AS `mkutano_location`,`tbl_meeting_types`.`type_id` AS `type_id`,`tbl_meeting_types`.`type_name` AS `type_name`,`tbl_mikutano`.`mkutano_ahadi` AS `mkutano_ahadi`,`tbl_mikutano`.`mkutano_malipo` AS `mkutano_malipo`,`tbl_mikutano`.`mkutano_deni` AS `mkutano_deni`,`tbl_mikutano`.`payment_status` AS `payment_status` from (`tbl_mikutano` join `tbl_meeting_types` on(`tbl_mikutano`.`mkutano_aina` = `tbl_meeting_types`.`type_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `view_wakazi`
--
DROP TABLE IF EXISTS `view_wakazi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u552102571_snott`@`127.0.0.1` SQL SECURITY DEFINER VIEW `view_wakazi`  AS   (select `tbl_wakazi`.`mkazi_id` AS `mkazi_id`,`tbl_wakazi`.`mkazi_name` AS `mkazi_name`,`tbl_wakazi`.`mkazi_phone` AS `mkazi_phone`,`tbl_zones`.`zone_id` AS `zone_id`,`tbl_zones`.`zone_name` AS `zone_name`,`tbl_wakazi`.`mkazi_shina` AS `mkazi_shina`,`tbl_wakazi`.`mkazi_ahadi` AS `mkazi_ahadi`,`tbl_wakazi`.`mkazi_malipo` AS `mkazi_malipo`,`tbl_wakazi`.`mkazi_deni` AS `mkazi_deni`,`tbl_monitors`.`monitor_id` AS `monitor_id`,`tbl_monitors`.`monitor_name` AS `monitor_name` from ((`tbl_wakazi` join `tbl_zones` on(`tbl_wakazi`.`mkazi_zone` = `tbl_zones`.`zone_id`)) join `tbl_monitors` on(`tbl_wakazi`.`mkazi_monitor` = `tbl_monitors`.`monitor_id`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_dini`
--
ALTER TABLE `tbl_dini`
  ADD PRIMARY KEY (`dini_id`);

--
-- Indexes for table `tbl_errors`
--
ALTER TABLE `tbl_errors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_institutions`
--
ALTER TABLE `tbl_institutions`
  ADD PRIMARY KEY (`institution_id`);

--
-- Indexes for table `tbl_institutions_list`
--
ALTER TABLE `tbl_institutions_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_madhehebu`
--
ALTER TABLE `tbl_madhehebu`
  ADD PRIMARY KEY (`dhehebu_id`);

--
-- Indexes for table `tbl_marafiki`
--
ALTER TABLE `tbl_marafiki`
  ADD PRIMARY KEY (`rafiki_id`);

--
-- Indexes for table `tbl_mashina`
--
ALTER TABLE `tbl_mashina`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_meeting_types`
--
ALTER TABLE `tbl_meeting_types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `tbl_mikutano`
--
ALTER TABLE `tbl_mikutano`
  ADD PRIMARY KEY (`mkutano_id`);

--
-- Indexes for table `tbl_monitors`
--
ALTER TABLE `tbl_monitors`
  ADD PRIMARY KEY (`monitor_id`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `tbl_payments_cats`
--
ALTER TABLE `tbl_payments_cats`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `tbl_users_tbl_roles_role_id` (`user_role_id`);

--
-- Indexes for table `tbl_wakazi`
--
ALTER TABLE `tbl_wakazi`
  ADD PRIMARY KEY (`mkazi_id`);

--
-- Indexes for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_dini`
--
ALTER TABLE `tbl_dini`
  MODIFY `dini_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_errors`
--
ALTER TABLE `tbl_errors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_institutions`
--
ALTER TABLE `tbl_institutions`
  MODIFY `institution_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_institutions_list`
--
ALTER TABLE `tbl_institutions_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_madhehebu`
--
ALTER TABLE `tbl_madhehebu`
  MODIFY `dhehebu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_marafiki`
--
ALTER TABLE `tbl_marafiki`
  MODIFY `rafiki_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_mashina`
--
ALTER TABLE `tbl_mashina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbl_meeting_types`
--
ALTER TABLE `tbl_meeting_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_mikutano`
--
ALTER TABLE `tbl_mikutano`
  MODIFY `mkutano_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_monitors`
--
ALTER TABLE `tbl_monitors`
  MODIFY `monitor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_payments_cats`
--
ALTER TABLE `tbl_payments_cats`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_wakazi`
--
ALTER TABLE `tbl_wakazi`
  MODIFY `mkazi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4492;

--
-- AUTO_INCREMENT for table `tbl_zones`
--
ALTER TABLE `tbl_zones`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
