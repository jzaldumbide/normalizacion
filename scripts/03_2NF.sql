-- 2) SEGUNDA FORMA NORMAL (2NF)
USE normalizacion_demo;

DROP TABLE IF EXISTS productos_2nf;
CREATE TABLE productos_2nf (
  producto_id   INT PRIMARY KEY,
  nombre        VARCHAR(120) NOT NULL,
  categoria     VARCHAR(80),
  precio_lista  DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO productos_2nf VALUES
(101,'Mouse','Periféricos',12.50),
(102,'Teclado','Periféricos',20.00),
(201,'Monitor','Pantallas',200.00);

DROP TABLE IF EXISTS pedido_detalle_2nf;
CREATE TABLE pedido_detalle_2nf (
  pedido_id       INT NOT NULL,
  producto_id     INT NOT NULL,
  cantidad        INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (pedido_id, producto_id),
  FOREIGN KEY (pedido_id) REFERENCES pedidos_1nf(pedido_id),
  FOREIGN KEY (producto_id) REFERENCES productos_2nf(producto_id)
) ENGINE=InnoDB;

INSERT INTO pedido_detalle_2nf VALUES
(1001,101,2,12.50),
(1001,201,1,200.00),
(1002,102,1,20.00);
