CREATE TABLE entidades (
      id_entidad INTEGER PRIMARY KEY,
      codigo_entidad TEXT UNIQUE NOT NULL,
      nombre_entidad TEXT NOT NULL,
      segmento TEXT NOT NULL,
      distrito TEXT NOT NULL,
      fecha_registro TEXT NOT NULL
    )
CREATE TABLE incidencias (
      id_incidencia INTEGER PRIMARY KEY,
      codigo_incidencia TEXT UNIQUE NOT NULL,
      id_operacion INTEGER NOT NULL,
      tipo_incidencia TEXT NOT NULL,
      severidad TEXT NOT NULL,
      fecha_reporte TEXT NOT NULL,
      estado_incidencia TEXT NOT NULL,
      FOREIGN KEY(id_operacion) REFERENCES operaciones(id_operacion)
    )
CREATE TABLE operaciones (
      id_operacion INTEGER PRIMARY KEY,
      codigo_operacion TEXT UNIQUE NOT NULL,
      id_entidad INTEGER NOT NULL,
      id_sede INTEGER NOT NULL,
      id_producto INTEGER NOT NULL,
      fecha_operacion TEXT NOT NULL,
      cantidad INTEGER NOT NULL,
      monto_total REAL NOT NULL,
      estado TEXT NOT NULL,
      canal TEXT NOT NULL,
      FOREIGN KEY(id_entidad) REFERENCES entidades(id_entidad),
      FOREIGN KEY(id_sede) REFERENCES sedes(id_sede),
      FOREIGN KEY(id_producto) REFERENCES productos_servicios(id_producto)
    )
CREATE TABLE pagos (
      id_pago INTEGER PRIMARY KEY,
      codigo_pago TEXT UNIQUE NOT NULL,
      id_operacion INTEGER NOT NULL,
      fecha_pago TEXT NOT NULL,
      medio_pago TEXT NOT NULL,
      monto_pagado REAL NOT NULL,
      estado_pago TEXT NOT NULL,
      FOREIGN KEY(id_operacion) REFERENCES operaciones(id_operacion)
    )
CREATE TABLE productos_servicios (
      id_producto INTEGER PRIMARY KEY,
      codigo_producto TEXT UNIQUE NOT NULL,
      nombre_producto TEXT NOT NULL,
      categoria TEXT NOT NULL,
      precio_base REAL NOT NULL,
      activo INTEGER NOT NULL
    )
CREATE TABLE sedes (
      id_sede INTEGER PRIMARY KEY,
      codigo_sede TEXT UNIQUE NOT NULL,
      nombre_sede TEXT NOT NULL,
      distrito_sede TEXT NOT NULL,
      responsable TEXT NOT NULL
    )
