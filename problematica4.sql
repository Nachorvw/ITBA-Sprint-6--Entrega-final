-------------- problematica 4 --------------------
---------------------1----------------------------
SELECT count (customer_id), branch_id from cliente GROUP by branch_id ORDER by count (customer_id) DESC
---------------------2----------------------------
SELECT  count(employee_id),branch_id from empleado GROUP by branch_id 
---------------------3----------------------------
SELECT count(account_id),tipos from cuenta GROUP by tipos
---------------------4----------------------------