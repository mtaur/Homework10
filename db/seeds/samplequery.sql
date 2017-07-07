#CREATE DATABASE `thrones_db`;

USE `thrones_db`;

#DELETE FROM `battles` WHERE `id` = 1;

SELECT * FROM `character-deaths`;
SELECT * FROM `character-predictions`;
SELECT * FROM `battles`;
	#dead
SELECT * FROM `character-deaths` WHERE `Death Year`;
	#alive
SELECT * FROM `character-deaths` WHERE NOT `Death Year`;
	#prominent survivors
SELECT * FROM `character-predictions` WHERE `actual` ORDER BY `popularity` DESC LIMIT 50;
	#prominent dead
SELECT * FROM `character-predictions` WHERE NOT `actual` ORDER BY `popularity` DESC LIMIT 50;

	#lucky bastards, popular
SELECT * FROM `character-predictions` WHERE `pred`<.5 AND `actual` ORDER BY `popularity` DESC LIMIT 50;
	#unlucky bastards, popular
SELECT * FROM `character-predictions` WHERE `pred`>.5 AND NOT `actual` ORDER BY `popularity` DESC LIMIT 50;

# SELECT * FROM `character-deaths` WHERE ...


#  Tommen died. I liked him ok, even if he was sheltered/naive/dumb...
UPDATE `thrones_db`.`character-predictions`
SET `like` = true,
  `tv_alive` = false
WHERE `S.No` = 6;