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

INSERT INTO cliente(customer_name,customer_surname,customer_DNI,branch_id,dob)
VALUES ('Lois','Stout','47730534','80','1984-07-07'),
('Hall','Mcconnell','52055464','45','1968-04-30'),
('Hilel','Mclean','43625213','77','1993-03-28'),
('Jin','Cooley','21207908','96','1959-08-24'),
('Gabriel','Harmon','57063950','27','1976-04-01');
/*Inserta los valores del JSON*/

Update cliente 
Set branch_id = 10
Where customer_id >500
/*Actualiza la sucursal de los clientes insertados con el json*/

DELETE FROM cliente 
WHERE customer_name='Noel' AND customer_surname='David'
/*Borra el correspondiente a Noel David*/


SELECT loan_type,max(loan_total)FROM prestamo;
/*Selecciona el prestamo mas alto y su tipo*/