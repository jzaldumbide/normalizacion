-- 3.5) BOYCE–CODD NORMAL FORM (BCNF)
USE normalizacion_demo;

DROP TABLE IF EXISTS inscripciones_bcnf_viol;
CREATE TABLE inscripciones_bcnf_viol (
  alumno    VARCHAR(50) NOT NULL,
  profesor  VARCHAR(50) NOT NULL,
  curso     VARCHAR(50) NOT NULL,
  PRIMARY KEY (alumno, profesor)
) ENGINE=InnoDB;

INSERT INTO inscripciones_bcnf_viol VALUES
('Ana',   'Pérez', 'BD'),
('Luis',  'Pérez', 'BD'),
('Bruno', 'García','SO'),
('Carla', 'García','SO');

-- Chequeo de FD: profesor -> curso
-- SELECT profesor, COUNT(DISTINCT curso) AS cursos_distintos
-- FROM inscripciones_bcnf_viol GROUP BY profesor;

DROP TABLE IF EXISTS profesor_curso_bcnf;
CREATE TABLE profesor_curso_bcnf (
  profesor VARCHAR(50) PRIMARY KEY,
  curso    VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

DROP TABLE IF EXISTS matriculas_bcnf;
CREATE TABLE matriculas_bcnf (
  alumno   VARCHAR(50) NOT NULL,
  profesor VARCHAR(50) NOT NULL,
  PRIMARY KEY (alumno, profesor),
  FOREIGN KEY (profesor) REFERENCES profesor_curso_bcnf(profesor)
) ENGINE=InnoDB;

INSERT INTO profesor_curso_bcnf (profesor, curso)
SELECT profesor, MIN(curso)
FROM inscripciones_bcnf_viol
GROUP BY profesor;

INSERT INTO matriculas_bcnf (alumno, profesor)
SELECT alumno, profesor
FROM inscripciones_bcnf_viol;

-- Verificación
-- SELECT m.alumno, m.profesor, pc.curso
-- FROM matriculas_bcnf m
-- JOIN profesor_curso_bcnf pc ON pc.profesor = m.profesor
-- ORDER BY alumno, profesor;
