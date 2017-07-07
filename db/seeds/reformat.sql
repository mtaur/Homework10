#
#
# Sample code for initial reformatting of Kaggle table.
#
#

# use this table
USE `thrones_db`;

# Make column to hold liked characters
ALTER TABLE `thrones_db`.`character-predictions`
ADD COLUMN `like` BOOLEAN DEFAULT NULL AFTER `isAlive`;

# Look at a table
SELECT * FROM `character-deaths`;
SELECT * FROM `character-predictions`;
SELECT * FROM `battles`;

# `actual` and `isAlive` are both 1 when character is still alive.  With one exception of each type.
# This doesn't make sense...  Source error?  They were characters I've never heard of anyway.
DELETE FROM `character-predictions` WHERE `actual` AND NOT `isAlive`;
DELETE FROM `character-predictions` WHERE NOT `actual` AND `isAlive`;
# `actual` (compared to `pred`) plays the role of `isAlive`.
# Delete contradictions, and then remove extra row.
ALTER TABLE `thrones_db`.`character-predictions`
DROP COLUMN `isAlive`;


# Data row consisting of column names accidentally imported from csv
# Error possible due to improper import settings
DELETE FROM `character-deaths` WHERE `id` = 1;
DELETE FROM `battles` WHERE `id` = 1;
