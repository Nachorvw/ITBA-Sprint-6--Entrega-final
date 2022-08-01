-------------- problematica 4 --------------------
---------------------1----------------------------
SELECT count (customer_id), branch_id from cliente GROUP by branch_id ORDER by count (customer_id) DESC
---------------------2----------------------------
SELECT  count(employee_id),branch_id from empleado GROUP by branch_id 
---------------------3----------------------------
SELECT count(account_id),tipos from cuenta GROUP by tipos
---------------------4----------------------------
SELECT avg(loan_total), branch_id from prestamo
INNER join cliente on cliente.customer_id=prestamo.customer_id GROUP by branch_id
---------------------5----------------------------
CREATE TABLE auditorias_cuenta (
	old_id INTEGER not null,
    new_id INTEGER not null,
    old_balance INTEGER not null,
    new_balance INTEGER not null,
    old_iban INTEGER not null,
    new_iban INTEGER not null,
    old_type INTEGER not null,
    new_type INTEGER not null,
    user_action INTEGER not null,
    created_at INTEGER not null,
);

DROP TRIGGER "main"."actualizador";
CREATE TRIGGER actualizador
   AFTER UPDATE ON cuenta
   WHEN old.balance <> new.balance
        OR old.iban <> new.iban
BEGIN
	INSERT INTO auditorias_cuenta(
		old_id,
		new_id,
		old_balance,
		new_balance,
		old_iban,
		 new_iban,
		 old_type,
		 new_type,
		user_action,
		created_at
	)
VALUES
	(
		old.account_id,
		new.account_id,
		old.balance,
		new.balance,
		old.iban,
		 new.iban,
		 1,
		 1,
		'UPDATE',
		datetime('NOW')
	) ;
END

UPDATE cuenta 
set balance ='15424485'
WHERE account_id=1

UPDATE cuenta 
set balance =balance-100
WHERE account_id BETWEEN 10 and 14
----------------6------------------
CREATE UNIQUE INDEX idx_dni 
ON cliente(customer_DNI);
----------------7------------------
CREATE TABLE moviminetos (
identificacion INTEGER not NULL,
nro_cuenta INTEGER not null,
monto INTEGER not null,
tipo_operacion INTEGER not null,
hora date
)

BEGIN TRANSACTION;

UPDATE cuenta
   SET balance = balance - 1000
 WHERE account_id = 200;

UPDATE cuenta
   SET balance = balance + 1000
 WHERE account_id = 400;
 
INSERT INTO moviminetos(identificacion,nro_cuenta,monto,tipo_operacion,hora) 
VALUES(1,200,1000,'-',datetime('now'));

INSERT INTO moviminetos(identificacion,nro_cuenta,monto,tipo_operacion,hora) 
VALUES(1,400,1000,'+',datetime('now'));

COMMIT;

rollback;