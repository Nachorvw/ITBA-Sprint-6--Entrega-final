/*punto 1 problematica 4*/

SELECT customer_name || ' '|| customer_surname as Clientes ,branch_name as Sucursal
FROM cliente 
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id 
ORDER BY branch_name DESC;

/*punto 1 problematica 3*/

SELECT account_id as cuentas FROM cuenta
where balance < 0

/*punto 2 problematica 3*/

SELECT customer_name ,customer_surname,dob FROM cliente
WHERE customer_surname like '%z%'

/*punto 3 problematica 3*/

SELECT customer_name, customer_surname,dob,branch_name as Sucursal
FROM cliente 
INNER JOIN sucursal ON cliente.branch_id = sucursal.branch_id 
WHERE customer_name like 'Brendan'

/*punto 4 problematica 3*/

SELECT loan_id,loan_type,loan_date,loan_total
FROM prestamo
WHERE loan_type LIKE 'PRENDARIO'
UNION 
SELECT loan_id,loan_type,loan_date,loan_total
FROM prestamo
WHERE loan_total > 8000000

/*punto 5 problematica 3*/

SELECT *
FROM prestamo
WHERE loan_total>(SELECT avg(loan_total)FROM prestamo)

/*punto 6 problematica 3*/

SELECT *
FROM cliente
WHERE dob> 1972-07-31

/*punto 7 problematica 3*/
SELECT *
FROM cuenta
WHERE balance >800000
LIMIT 0,5

/*punto 8 problematica 3*/
SELECT *
FROM prestamo
WHERE (loan_date like '%-04-%' )or (loan_date like '%-06-%' )or (loan_date like '%-08-%')

/*punto 9 problematica 3*/
SELECT REPLACE(loan_total,loan_total,sum(loan_total)) as loan_total_accu
FROM prestamo 
WHERE loan_type like 'PRENDARIO'

/*Falta terminar el punto 9 de la problematica 3*/
