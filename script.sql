CREATE TABLE conta (
    id SERIAL PRIMARY KEY,
    titular VARCHAR(100) NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL
);

INSERT INTO conta (titular, saldo) VALUES 
('Steve Jobs', 7500.50),
('Bill Gates', 12000.00),
('Ada Lovelace', 4500.75);