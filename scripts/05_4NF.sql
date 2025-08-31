-- 4) CUARTA FORMA NORMAL (4NF)
USE normalizacion_demo;

DROP TABLE IF EXISTS alumno_habilidad_idioma_violacion_4nf;
CREATE TABLE alumno_habilidad_idioma_violacion_4nf (
  alumno_id INT NOT NULL,
  habilidad VARCHAR(100) NOT NULL,
  idioma    VARCHAR(100) NOT NULL,
  PRIMARY KEY (alumno_id, habilidad, idioma)
) ENGINE=InnoDB;

INSERT INTO alumno_habilidad_idioma_violacion_4nf VALUES
(1,'SQL','Inglés'),
(1,'Python','Inglés'),
(1,'SQL','Francés');

DROP TABLE IF EXISTS alumno_habilidad_4nf;
CREATE TABLE alumno_habilidad_4nf (
  alumno_id INT NOT NULL,
  habilidad VARCHAR(100) NOT NULL,
  PRIMARY KEY (alumno_id, habilidad)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS alumno_idioma_4nf;
CREATE TABLE alumno_idioma_4nf (
  alumno_id INT NOT NULL,
  idioma    VARCHAR(100) NOT NULL,
  PRIMARY KEY (alumno_id, idioma)
) ENGINE=InnoDB;

INSERT INTO alumno_habilidad_4nf VALUES
(1,'SQL'),(1,'Python');

INSERT INTO alumno_idioma_4nf VALUES
(1,'Inglés'),(1,'Francés');
