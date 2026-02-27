-- 1. LIMPIEZA TOTAL CON CASCADE (Esto rompe cualquier dependencia)
DROP TABLE IF EXISTS ventas CASCADE;
DROP TABLE IF EXISTS productos CASCADE;

-- 2. CREACIÓN DE ESTRUCTURA
CREATE TABLE productos (
    id_producto INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    precio_venta_unitario DECIMAL(10,2),
    costo_unitario DECIMAL(10,2)
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    ticket_nro INTEGER,
    id_producto INTEGER REFERENCES productos(id_producto),
    cantidad INTEGER,
    total_cobrado DECIMAL(10,2)
);

-- 3. CARGA DE PRODUCTOS (DATOS EXACTOS DEL EXCEL)
INSERT INTO productos (id_producto, nombre, categoria, precio_venta_unitario, costo_unitario) VALUES
(1, 'Coca-Cola 1.5L Zero', 'Gaseosa', 135.00, 95.00),
(2, 'Agua Salus 2.25L', 'Agua', 85.00, 45.00),
(3, 'Sprite 1.5L Zero', 'Gaseosa', 130.00, 90.00),
(4, 'Pepsi 2L Zero', 'Gaseosa', 145.00, 100.00),
(5, 'Coca-Cola 1.5L Común', 'Gaseosa', 140.00, 100.00),
(6, 'Stella Artois Sin Alc 330ml', 'Cerveza', 95.00, 65.00),
(7, 'Patricia 1L', 'Cerveza', 160.00, 110.00),
(8, 'Brahma Lata', 'Cerveza', 81.00, 50.00),
(9, 'Zillertal 1L', 'Cerveza', 185.00, 130.00),
(10, 'Norteña Lata', 'Cerveza', 70.00, 45.00),
(11, 'Hielo Bolsa 3kg', 'Complemento', 110.00, 40.00);

-- 4. CARGA DE VENTAS
INSERT INTO ventas (ticket_nro, id_producto, cantidad, total_cobrado) VALUES
(1, 1, 2, 270.00), (2, 4, 3, 395.00), (3, 7, 2, 320.00), (3, 11, 1, 55.00),
(4, 2, 6, 510.00), (5, 8, 7, 513.00), (6, 1, 1, 135.00), (7, 10, 12, 840.00),
(8, 4, 2, 250.00), (9, 9, 3, 555.00), (10, 2, 1, 85.00), (11, 8, 6, 432.00),
(12, 11, 2, 220.00), (13, 5, 2, 280.00), (14, 6, 4, 380.00), (15, 4, 5, 645.00);

-- 5. RE-CREAR LA VISTA (Para que vuelva a existir después del CASCADE)
CREATE OR REPLACE VIEW reporte_bachino AS
(SELECT 
    v.ticket_nro::TEXT AS "Nro Ticket", 
    p.nombre AS "Descripción", 
    v.cantidad::TEXT AS "Cant", 
    v.total_cobrado AS "Subtotal"
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
ORDER BY v.ticket_nro)
UNION ALL
SELECT '---', 'TOTAL CAJA', '---', SUM(total_cobrado) FROM ventas;

-- 6. RESULTADO FINAL
SELECT * FROM reporte_bachino;
