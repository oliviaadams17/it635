CREATE DATABASE wedding_planner;
CREATE USER planner WITH PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE wedding_planner TO planner;
\c wedding_planner

CREATE TABLE guests (
	guest_id INTEGER NOT NULL UNIQUE,
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	bride_groom VARCHAR(1) NOT NULL CHECK (bride_groom IN ('b', 'B', 'g', 'G')),
	email VARCHAR(256) NOT NULL,
	phone_number VARCHAR(16) NOT NULL,
	w_party BOOLEAN,
	table_number INTEGER,
	PRIMARY KEY (guest_id)
);

CREATE TABLE wedding_party (
	first_name VARCHAR(128) NOT NULL,
	last_name VARCHAR(128) NOT NULL,
	role VARCHAR(12) NOT NULL CHECK (role IN ('bride', 'groom', 'hmaid', 'bman', 'bmaid', 'gman')),
	guest_id INTEGER NOT NULL,
	PRIMARY KEY (first_name, guest_id),
	CONSTRAINT g_id FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);

CREATE TABLE seating (
	table_number INTEGER,
	seat1 INTEGER,
	seat2 INTEGER,
	seat3 INTEGER,
	seat4 INTEGER,
	seat5 INTEGER,
	seat6 INTEGER,
	seat7 INTEGER,
	seat8 INTEGER,
	seat9 INTEGER,
	seat10 INTEGER,
	PRIMARY KEY (table_number),
	CONSTRAINT guest1 FOREIGN KEY (seat1) REFERENCES guests(guest_id),
	CONSTRAINT guest2 FOREIGN KEY (seat2) REFERENCES guests(guest_id),
	CONSTRAINT guest3 FOREIGN KEY (seat3) REFERENCES guests(guest_id),
	CONSTRAINT guest4 FOREIGN KEY (seat4) REFERENCES guests(guest_id),
	CONSTRAINT guest5 FOREIGN KEY (seat5) REFERENCES guests(guest_id),
	CONSTRAINT guest6 FOREIGN KEY (seat6) REFERENCES guests(guest_id),
	CONSTRAINT guest7 FOREIGN KEY (seat7) REFERENCES guests(guest_id),
	CONSTRAINT guest8 FOREIGN KEY (seat8) REFERENCES guests(guest_id),
	CONSTRAINT guest9 FOREIGN KEY (seat9) REFERENCES guests(guest_id),
	CONSTRAINT guest10 FOREIGN KEY (seat10) REFERENCES guests(guest_id)
);

GRANT ALL PRIVILEGES ON guests, wedding_party, seating TO planner;

INSERT INTO guests VALUES ('Olivia', 'Adams', 'b', 'olivia@gmail.com', '1111111111', TRUE);
INSERT INTO guests VALUES ('Michael', 'Flinn', 'g', 'michael@gmail.com', '2222222222', TRUE);
INSERT INTO guests VALUES ('Alice', 'Adams', 'b', 'alice@gmail.com', '3333333333', TRUE);
INSERT INTO guests VALUES ('Owen', 'Flinn', 'g', 'owen@gmail.com', '4444444444', TRUE);
INSERT INTO guests VALUES ('Diana', 'Adams', 'b', 'diana@gmail.com', '5555555555', TRUE);
INSERT INTO guests VALUES ('Daniel', 'Flinn', 'g', 'daniel@gmail.com', '6666666666', TRUE);
INSERT INTO guests VALUES ('Jade', 'Flinn', 'g', 'jade@gmail.com', '7777777777', FALSE);
INSERT INTO guests VALUES ('Jenny', 'Flinn', 'g', 'jenny@gmail.com', '8888888888', TRUE);
INSERT INTO guests VALUES ('Oliver', 'Adams', 'b', 'oliver@gmail.com', '9999999999', FALSE);
INSERT INTO guests VALUES ('Sue', 'Adams', 'b', 'sue@gmail.com', '1212121212', FALSE);
INSERT INTO guests VALUES ('Dave', 'Adams', 'b', 'dave@gmail.com', '1313131313', FALSE);
INSERT INTO guests VALUES ('Ian', 'Adams', 'b', 'ian@gmail.com', '1414141414', FALSE);
INSERT INTO guests VALUES ('Hunter', 'Smith', 'g', 'hunter@gmail.com', '1515151515', TRUE);
INSERT INTO guests VALUES ('Amanda', 'Allen', 'g', 'amanda@gmail.com', '1616161616', FALSE);
INSERT INTO guests VALUES ('Christopher', 'Scott', 'g', 'chris@gmail.com', '1717171717', FALSE);
INSERT INTO guests VALUES ('Sarah', 'Scott', 'g', 'sarah@gmail.com', '1818181818', FALSE);
INSERT INTO guests VALUES ('Emily', 'Adams', 'b', 'emily@gmail.com', '1919191919', FALSE);
INSERT INTO guests VALUES ('Kat', 'Adams', 'b', 'kat@gmail.com', '1122112211', TRUE);
INSERT INTO guests VALUES ('Tim', 'Flinn', 'g', 'tim@gmail.com', '1133113311', TRUE);
INSERT INTO guests VALUES ('Matt', 'Jones', 'g', 'olivia@gmail.com', '1144114411', False);

INSERT INTO wedding_party VALUES ('Olivia', 'Adams', 'bride', 1);
INSERT INTO wedding_party VALUES ('Michael', 'Flinn', 'groom', 2);
INSERT INTO wedding_party VALUES ('Alice', 'Adams', 'hmaid', 3);
INSERT INTO wedding_party VALUES ('Daniel', 'Flinn', 'bman', 6);
INSERT INTO wedding_party VALUES ('Diana', 'Adams', 'bmaid', 5);
INSERT INTO wedding_party VALUES ('Owen', 'Flinn', 'gman', 4);
INSERT INTO wedding_party VALUES ('Jenny', 'Flinn', 'bmaid', 8);
INSERT INTO wedding_party VALUES ('Hunter', 'Smith', 'gman', 13);
INSERT INTO wedding_party VALUES ('Kat', 'Adams', 'bmaid', 18);
INSERT INTO wedding_party VALUES ('Tim', 'Flinn', 'gman', 19);

INSERT INTO seating VALUES (1, 1, 2, 3, 6, 5, 4, 8, 13,18,19);
	
