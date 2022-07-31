CREATE VIEW vista AS 
SELECT customer_name,customer_surname,customer_id,customer_DNI,branch_id,dob
FROM cliente
/*Aca se crea la vista*/
/*No calcula la edad*/

SELECT * FROM vista
WHERE dob > 1972-07-31
GROUP BY customer_DNI;
/*hay que arreglar tema de la edad */

SELECT * FROM vista
WHERE customer_name='Anne' or customer_name='Tyler'
/*esto anda bien*/

