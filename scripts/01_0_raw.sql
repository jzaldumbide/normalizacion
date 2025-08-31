-- 0) TABLA DESNORMALIZADA (RAW)
DROP DATABASE IF EXISTS normalizacion_demo;
CREATE DATABASE normalizacion_demo;
USE normalizacion_demo;

DROP TABLE IF EXISTS pedidos_raw;
CREATE TABLE pedidos_raw (
  pedido_id      INT PRIMARY KEY,
  fecha          DATE,
  cliente_id     INT,
  cliente_nombre VARCHAR(100),
  cliente_email  VARCHAR(120),
  cliente_ciudad VARCHAR(100),
  cliente_prov   VARCHAR(100),
  items_text     TEXT -- "Prod|Cat|Cant|Precio;Prod|Cat|Cant|Precio"
) ENGINE=InnoDB;

INSERT INTO pedidos_raw VALUES
(1001,'2025-08-29',1,'Ana','ana@ejemplo.com','Quito','Pichincha',
 'Mouse|Periféricos|2|12.50;Monitor|Pantallas|1|200.00'),
(1002,'2025-08-30',2,'Bruno','bruno@ejemplo.com','Guayaquil','Guayas',
 'Teclado|Periféricos|1|20.00');
