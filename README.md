# Ejemplo de Normalización en MySQL (0NF → 5NF + BCNF)

Este repositorio contiene un **ejemplo completo y paso a paso** de cómo aplicar las formas normales a un conjunto de datos, usando MySQL 8+.  
Se incluyen scripts `.sql` separados por cada forma normal y un archivo maestro (`00_MASTER.sql`) que los ejecuta en orden.

---

## 📂 Archivos incluidos
- **00_MASTER.sql** → ejecuta todos los pasos en orden.
- **01_0_raw.sql** → tabla desnormalizada (0NF / Raw).
- **02_1NF.sql** → Primera Forma Normal (1NF).
- **03_2NF.sql** → Segunda Forma Normal (2NF).
- **04_3NF.sql** → Tercera Forma Normal (3NF).
- **04b_BCNF.sql** → Forma Normal de Boyce–Codd (BCNF).
- **05_4NF.sql** → Cuarta Forma Normal (4NF).
- **06_5NF.sql** → Quinta Forma Normal (5NF).
- **99_queries.sql** → consultas de validación y ejemplos.

---

## 🧩 Explicación paso a paso

### 🔴 0NF (Desnormalizada / Raw)
- Todos los datos están en una sola tabla (`pedidos_raw`).
- Ítems de los pedidos guardados en un campo de texto (listas dentro de una celda).
- Problema: redundancia, dificultad de consulta y actualización.

### 1️⃣ 1NF (Primera Forma Normal)
- Se eliminan grupos repetidos y listas.
- Se crean tablas separadas:
  - `clientes_1nf`
  - `pedidos_1nf`
  - `pedido_items_1nf`
- Cada atributo es atómico (un valor por celda).

### 2️⃣ 2NF (Segunda Forma Normal)
- Elimina dependencias parciales en claves compuestas.
- Atributos de productos no dependen del par `(pedido_id, item_no)`, sino del producto.
- Se separa:
  - `productos_2nf` (catálogo)
  - `pedido_detalle_2nf` (detalle del pedido).

### 3️⃣ 3NF (Tercera Forma Normal)
- Elimina dependencias **transitivas**.
- Ciudad y provincia dependen de **código postal**, no directamente de cliente.
- Se crea:
  - `codigos_postales_3nf`
  - `clientes_3nf` referencia por código postal.

### 🟡 BCNF (Boyce–Codd)
- Caso: Inscripciones `(alumno, profesor, curso)`.
- Dependencia funcional: `profesor → curso`, pero `profesor` **no es superclave**.
- Es 3NF pero NO BCNF.
- Se descompone en:
  - `profesor_curso_bcnf`
  - `matriculas_bcnf`

### 4️⃣ 4NF (Cuarta Forma Normal)
- Evita **dependencias multivaluadas** independientes.
- Caso: un alumno puede tener múltiples habilidades y múltiples idiomas (sin relación entre sí).
- Se evita la tabla ternaria redundante separando en:
  - `alumno_habilidad_4nf`
  - `alumno_idioma_4nf`

### 5️⃣ 5NF (Quinta Forma Normal)
- Elimina **dependencias de unión** (join dependencies).
- Caso: relación ternaria `(proveedor, parte, proyecto)`.
- Se demuestra que puede reconstruirse a partir de tres relaciones binarias:
  - `proveedor_parte_5nf`
  - `proveedor_proyecto_5nf`
  - `parte_proyecto_5nf`

---

## 📊 Consultas de Validación
En `99_queries.sql` se incluyen ejemplos como:
- Total por pedido (3NF).
- Datos de clientes con ciudad/provincia (3NF).
- Verificación de reconstrucción en 5NF.

---

## 🚀 Cómo usar
1. Abrir MySQL Workbench o CLI.  
2. Ejecutar:
   ```sql
   SOURCE 00_MASTER.sql;
   ```
3. Revisar las tablas creadas en cada paso.  
4. Ejecutar `99_queries.sql` para comprobar resultados.

---

✍️ Autor: *Ejemplo generado automáticamente*  
📅 Fecha: Agosto 2025  
