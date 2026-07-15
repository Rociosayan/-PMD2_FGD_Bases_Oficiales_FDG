CREATE TABLE sedes (
  id_sede INTEGER PRIMARY KEY,
  codigo_sede TEXT UNIQUE NOT NULL,
  nombre_sede TEXT NOT NULL,
  distrito_sede TEXT NOT NULL,
  responsable TEXT
);
CREATE TABLE empleados (
  id_empleado INTEGER PRIMARY KEY,
  codigo_empleado TEXT UNIQUE NOT NULL,
  nombres TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  num_documento TEXT NOT NULL,
  cargo TEXT NOT NULL,
  id_sede INTEGER NOT NULL,
  correo TEXT,
  sueldo REAL,
  fecha_ingreso TEXT NOT NULL,
  FOREIGN KEY (id_sede) REFERENCES sedes(id_sede)
);
CREATE TABLE clientes (
  id_cliente INTEGER PRIMARY KEY,
  codigo_cliente TEXT UNIQUE NOT NULL,
  tipo_documento TEXT NOT NULL,
  num_documento TEXT NOT NULL,
  nombres TEXT NOT NULL,
  apellidos TEXT NOT NULL,
  correo TEXT,
  telefono TEXT,
  distrito TEXT,
  segmento TEXT NOT NULL,
  fecha_registro TEXT NOT NULL,
  direccion_delivery TEXT
);
CREATE TABLE productos_servicios (
  id_producto INTEGER PRIMARY KEY,
  codigo_producto TEXT UNIQUE NOT NULL,
  nombre_producto TEXT NOT NULL,
  categoria TEXT NOT NULL,
  precio_base REAL NOT NULL,
  activo INTEGER NOT NULL
);
CREATE TABLE operaciones (
  id_operacion INTEGER PRIMARY KEY,
  codigo_operacion TEXT UNIQUE NOT NULL,
  id_cliente INTEGER NOT NULL,
  id_sede INTEGER NOT NULL,
  id_empleado INTEGER,
  fecha_operacion TEXT NOT NULL,
  canal TEXT NOT NULL,
  estado TEXT NOT NULL,
  monto_total REAL NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_sede) REFERENCES sedes(id_sede),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
CREATE TABLE detalle_operacion (
  id_detalle INTEGER PRIMARY KEY,
  id_operacion INTEGER NOT NULL,
  id_producto INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unitario REAL NOT NULL,
  subtotal REAL NOT NULL,
  FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion),
  FOREIGN KEY (id_producto) REFERENCES productos_servicios(id_producto)
);
CREATE TABLE pagos (
  id_pago INTEGER PRIMARY KEY,
  codigo_pago TEXT UNIQUE NOT NULL,
  id_operacion INTEGER NOT NULL,
  fecha_pago TEXT,
  medio_pago TEXT NOT NULL,
  monto_pagado REAL NOT NULL,
  estado_pago TEXT NOT NULL,
  FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion)
);
CREATE TABLE incidencias (
  id_incidencia INTEGER PRIMARY KEY,
  codigo_incidencia TEXT UNIQUE NOT NULL,
  id_operacion INTEGER NOT NULL,
  tipo_incidencia TEXT NOT NULL,
  severidad TEXT NOT NULL,
  fecha_reporte TEXT NOT NULL,
  estado_incidencia TEXT NOT NULL,
  FOREIGN KEY (id_operacion) REFERENCES operaciones(id_operacion)
);
