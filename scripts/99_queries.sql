-- CONSULTAS DE PRUEBA
USE normalizacion_demo;

-- Total por pedido (3NF)
SELECT p.pedido_id, p.fecha, c.nombre AS cliente,
       SUM(d.cantidad * d.precio_unitario) AS total
FROM pedidos_3nf p
JOIN clientes_3nf c ON c.cliente_id = p.cliente_id
JOIN pedido_detalle_2nf d ON d.pedido_id = p.pedido_id
GROUP BY p.pedido_id, p.fecha, c.nombre
ORDER BY p.pedido_id;

-- Datos de cliente + ubicación (3NF via código postal)
SELECT c.cliente_id, c.nombre, c.email, cp.ciudad, cp.provincia
FROM clientes_3nf c
JOIN codigos_postales_3nf cp ON cp.codigo_postal = c.codigo_postal
ORDER BY c.cliente_id;

-- Verificación 5NF (reconstrucción de triples)
SELECT DISTINCT pp.proveedor, pa.parte, pj.proyecto
FROM proveedor_parte_5nf pp
JOIN proveedor_proyecto_5nf pj  ON pj.proveedor = pp.proveedor
JOIN parte_proyecto_5nf    pa  ON pa.parte = pp.parte AND pa.proyecto = pj.proyecto
ORDER BY proveedor, parte, proyecto;

-- Comparación con la ternaria original (5NF)
SELECT * FROM contratos_violacion_5nf ORDER BY proveedor, parte, proyecto;
