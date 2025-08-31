-- 1) PRIMERA FORMA NORMAL (1NF)
USE normalizacion_demo;

DROP TABLE IF EXISTS clientes_1nf;
CREATE TABLE clientes_1nf (
  cliente_id    INT PRIMARY KEY,
  nombre        VARCHAR(100) NOT NULL,
  email         VARCHAR(120) NOT NULL,
  ciudad        VARCHAR(100),
  provincia     VARCHAR(100)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS pedidos_1nf;
CREATE TABLE pedidos_1nf (
  pedido_id   INT PRIMARY KEY,
  fecha       DATE NOT NULL,
  cliente_id  INT NOT NULL,
  FOREIGN KEY (cliente_id) REFERENCES clientes_1nf(cliente_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS pedido_items_1nf;
CREATE TABLE pedido_items_1nf (
  pedido_id        INT NOT NULL,
  item_no          INT NOT NULL,
  producto_nombre  VARCHAR(120) NOT NULL,
  categoria        VARCHAR(80),
  cantidad         INT NOT NULL,
  precio_unitario  DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (pedido_id, item_no),
  FOREIGN KEY (pedido_id) REFERENCES pedidos_1nf(pedido_id)
) ENGINE=InnoDB;

INSERT INTO clientes_1nf VALUES
(1,'Ana','ana@ejemplo.com','Quito','Pichincha'),
(2,'Bruno','bruno@ejemplo.com','Guayaquil','Guayas');

INSERT INTO pedidos_1nf VALUES
(1001,'2025-08-29',1),
(1002,'2025-08-30',2);

INSERT INTO pedido_items_1nf VALUES
(1001,1,'Mouse','Periféricos',2,12.50),
(1001,2,'Monitor','Pantallas',1,200.00),
(1002,1,'Teclado','Periféricos',1,20.00);
