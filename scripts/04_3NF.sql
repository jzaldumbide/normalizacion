-- 3) TERCERA FORMA NORMAL (3NF)
USE normalizacion_demo;

DROP TABLE IF EXISTS codigos_postales_3nf;
CREATE TABLE codigos_postales_3nf (
  codigo_postal VARCHAR(10) PRIMARY KEY,
  ciudad        VARCHAR(100) NOT NULL,
  provincia     VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

INSERT INTO codigos_postales_3nf VALUES
('170102','Quito','Pichincha'),
('090202','Guayaquil','Guayas');

DROP TABLE IF EXISTS clientes_3nf;
CREATE TABLE clientes_3nf (
  cliente_id    INT PRIMARY KEY,
  nombre        VARCHAR(100) NOT NULL,
  email         VARCHAR(120) NOT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  FOREIGN KEY (codigo_postal) REFERENCES codigos_postales_3nf(codigo_postal)
) ENGINE=InnoDB;

INSERT INTO clientes_3nf VALUES
(1,'Ana','ana@ejemplo.com','170102'),
(2,'Bruno','bruno@ejemplo.com','090202');

DROP TABLE IF EXISTS pedidos_3nf;
CREATE TABLE pedidos_3nf (
  pedido_id   INT PRIMARY KEY,
  fecha       DATE NOT NULL,
  cliente_id  INT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes_3nf(cliente_id)
) ENGINE=InnoDB;

INSERT INTO pedidos_3nf SELECT * FROM pedidos_1nf;
