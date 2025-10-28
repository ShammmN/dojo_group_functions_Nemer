/*Sham Nemer*/
SELECT * FROM stand_user;

/*Question 1*/ 
SELECT AVG(power) AS "AVG_POWER", MAX(power) AS "MAX_POWER", MIN(power) AS "MIN_POWER" FROM stand_user;

/*Question 2*/
SELECT COUNT(precision) AS "KNOWN_PRECISION", COUNT(user_name) AS "TOTAL_USERS" FROM stand_user;

/*Question 3*/
SELECT ROUND(STDDEV(power), 3) AS "STDDEV_POWER", ROUND(VARIANCE(power), 3) AS "VARIANCE_POWER" FROM stand_user;

/*Question 4*/
SELECT precision, AVG(power) AS "AVG_POWER" FROM stand_user WHERE precision IS NOT NULL GROUP BY precision;

/*Question 5*/
SELECT precision, AVG(power) AS "AVG_POWER" FROM stand_user WHERE precision IS NOT NULL GROUP BY precision HAVING AVG(power) > 80;

/*Question 6*/ 
SELECT user_name, stand_name, (power - (SELECT AVG(power) FROM stand_user)) AS "DIFF_FROM_AVG" from stand_user;

/*Question 7*/ 
SELECT ROUND(AVG(power), 2) AS "ROUNDED_AVG_POWER" FROM stand_user;

/*Question 8*/
SELECT precision, SUM(power) AS "TOTAL_POWER" FROM stand_user GROUP BY ROLLUP(precision);

/*Question 9*/ 
SELECT EXTRACT(YEAR FROM debut_date) AS debut_year,
       precision,
       SUM(power) AS total_power
FROM stand_user
GROUP BY CUBE(EXTRACT(YEAR FROM debut_date), precision)
ORDER BY debut_year, precision;
 
