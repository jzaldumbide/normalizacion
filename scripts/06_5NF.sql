-- 5) QUINTA FORMA NORMAL (5NF) — script autocontenible
CREATE DATABASE IF NOT EXISTS normalizacion_demo;
USE normalizacion_demo;

-- Limpieza por si ya existían
DROP TABLE IF EXISTS contratos_violacion_5nf;
DROP TABLE IF EXISTS proveedor_parte_5nf;
DROP TABLE IF EXISTS proveedor_proyecto_5nf;
DROP TABLE IF EXISTS parte_proyecto_5nf;

-- Ternaria original (solo para comparar luego)
CREATE TABLE contratos_violacion_5nf (
  proveedor VARCHAR(20) NOT NULL,
  parte     VARCHAR(20) NOT NULL,
  proyecto  VARCHAR(20) NOT NULL,
  PRIMARY KEY (proveedor, parte, proyecto)
) ENGINE=InnoDB;

INSERT INTO contratos_violacion_5nf VALUES
('P1','X','A'),
('P1','Y','A'),
('P2','X','B');

-- Descomposición 5NF en binarias
CREATE TABLE proveedor_parte_5nf (
  proveedor VARCHAR(20) NOT NULL,
  parte     VARCHAR(20) NOT NULL,
  PRIMARY KEY (proveedor, parte)
) ENGINE=InnoDB;

CREATE TABLE proveedor_proyecto_5nf (
  proveedor VARCHAR(20) NOT NULL,
  proyecto  VARCHAR(20) NOT NULL,
  PRIMARY KEY (proveedor, proyecto)
) ENGINE=InnoDB;

CREATE TABLE parte_proyecto_5nf (
  parte    VARCHAR(20) NOT NULL,
  proyecto VARCHAR(20) NOT NULL,
  PRIMARY KEY (parte, proyecto)
) ENGINE=InnoDB;

INSERT INTO proveedor_parte_5nf VALUES
('P1','X'),('P1','Y'),('P2','X');

INSERT INTO proveedor_proyecto_5nf VALUES
('P1','A'),('P2','B');

INSERT INTO parte_proyecto_5nf VALUES
('X','A'),('X','B'),('Y','A');

-- Verificación: reconstrucción de triples mediante JOIN (5NF)
SELECT DISTINCT pp.proveedor, pa.parte, pj.proyecto
FROM proveedor_parte_5nf pp
JOIN proveedor_proyecto_5nf pj ON pj.proveedor = pp.proveedor
JOIN parte_proyecto_5nf pa ON pa.parte = pp.parte AND pa.proyecto = pj.proyecto
ORDER BY proveedor, parte, proyecto;

-- Comparación con la ternaria original
SELECT * FROM contratos_violacion_5nf ORDER BY proveedor, parte, proyecto;

-- (Opcional) Chequeo rápido de que las tablas existen en el esquema activo
SHOW FULL TABLES FROM normalizacion_demo LIKE '%5nf%';