CREATE DATABASE wedding_planner;
CREATE USER planner WITH PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE wedding_planner TO planner;
\c planner

CREATE TABLE guests (
	guest_id SERIAL,
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
	table_number SERIAL,
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
	