CREATE TABLE Tclien (
customer_id INTEGER PRIMARY KEY,
type_des TEXT NOT NULL
);

INSERT INTO Tclien (type_des)
VALUES ("BLACK"),("GOLD"),("CLASSIC");

CREATE TABLE m_tarjetas (
credit_id INTEGER PRIMARY KEY,
nombre_credito TEXT NOT NULL
);

insert INTO m_tarjetas (nombre_credito)
VALUES ("Visa"),("Master Card"),("American Express");

CREATE table T_cuenta 
(cuenta_id INTEGER PRIMARY KEY,
    descipcion TEXT not null);

INSERT INTO T_cuenta (descipcion)
VALUES 	("ahorro en Pesos"),
	("ahorro en dolares"),
	("corriente en Pesos"),
	("corriente en dolares"),
	("inversion");

CREATE TABLE tarjeta 
(	numero char not null CHECK(length(numero)<= 20),
	CVV INTEGER,
	Fecha_Otorgamiento date no null,
	fecha_Expiracion date no null,
    tipo_tarjeta TEXT not null,

    );

CREATE TABLE tarjeta 
(	numero char not null CHECK(length(numero)<= 20),
	CVV INTEGER not null,
	Fecha_Otorgamiento date no null,
	fecha_Expiracion date no null,
    tipo_tarjeta TEXT not null,
	marca INTEGER NOT NULL,
	Cliente_cuenta INTEGER NOT NULL,
	CONSTRAINT fk_marcas FOREIGN KEY (marca)REFERENCES m_tarjetas(credit_id),
	CONSTRAINT fk_cliente FOREIGN key (Cliente_cuenta) REFERENCES cliente (customer_id)
    );

CREATE TABLE direcciones (
	calle TEXT not NULL,
	numero INTEGER not NULL,
	ciudad TEXT not null,
	provincia TEXT not null,
	pais TEXT not null,
	emple INTEGER not null,
	clien INTEGER not null,
	sucur INTEGER not null,
	CONSTRAINT fk_empleados FOREIGN key (emple) REFERENCES empleado(employee_id)
	CONSTRAINT fk_cliente FOREIGN key (clien) REFERENCES cliente(customer_id)
	CONSTRAINT fk_sucur FOREIGN key (sucur) REFERENCES sucursal(branch_id)
);

ALTER TABLE cuenta add tipo_de_cuenta;

alter TABLE cuenta RENAME to cuenta2

drop TABLE cuenta

CREATE TABLE cuenta (
	account_id INTEGER not NULL PRIMARY key,
	customer_id INTEGER not NULL,
	balance INTEGER not null,
	iban TEXT not NULL,
	tipo_de_cuenta INTEGER,
	CONSTRAINT fk_tipos FOREIGN key (tipo_de_cuenta) REFERENCES T_cuenta(cuenta_id)

);

CREATE TABLE indi (
	indi INTEGER
);

------------------- inserto tipos en la tabla indi -----------------


INSERT into cuenta (account_id,customer_id,balance,iban,tipo_de_cuenta)
SELECT cuenta2.account_id,cuenta2.customer_id,cuenta2.balance,cuenta2.iban,indi2.indi from cuenta2, indi2







