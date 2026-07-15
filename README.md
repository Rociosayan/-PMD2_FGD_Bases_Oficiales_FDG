# PMD2_FGD_Bases_Oficiales_FDG

Repositorio oficial de bases SQLite para el PMD2 del curso **Fundamentos de Gestión de Datos**.

Cada carpeta de `casos/` contiene:

- una base SQLite (`.db`) con ocho tablas relacionadas;
- el esquema completo (`schema.sql`);
- un CSV por tabla para carga alternativa;
- el diccionario de datos (`diccionario_datos.csv`);
- un README con el contexto y el código de carga para Google Colab.

Las bases incluyen datos ficticios contextualizados por sector y anomalías controladas para las prácticas de calidad, seguridad y gobierno de datos.

## Carga rápida en Google Colab

```python
import requests
import sqlite3
import pandas as pd

caso = "01_clinica_vitalsalud"  # cada equipo cambia su caso
url = f"https://raw.githubusercontent.com/Rociosayan/-PMD2_FGD_Bases_Oficiales_FDG/main/casos/{caso}/{caso}.db"

r = requests.get(url)
r.raise_for_status()
open("base.sqlite", "wb").write(r.content)

conn = sqlite3.connect("base.sqlite")
tablas = pd.read_sql_query("SELECT name FROM sqlite_schema WHERE type='table' ORDER BY name", conn)
display(tablas)
```

## Modelo común

Cada caso utiliza las tablas `sedes`, `empleados`, `clientes`, `productos_servicios`, `operaciones`, `detalle_operacion`, `pagos` e `incidencias`. Algunos campos de `clientes` cambian según el sector para incorporar el dato específico del caso.

## Clasificación de datos

El campo `sensibilidad` de cada diccionario utiliza cuatro categorías:

- `No sensible`: dato operativo o contextual sin protección especial.
- `Personal`: dato que identifica o puede asociarse con una persona.
- `Confidencial`: dato personal o empresarial que requiere acceso restringido, aunque no sea sensible según la ley.
- `Sensible legal`: dato comprendido en las categorías de protección reforzada, como salud o ingresos económicos.

La última columna de `clientes` es el dato contextual del rubro. Su clasificación depende de su naturaleza y no se considera sensible automáticamente.

## Casos disponibles

| Caso | Nombre |
|---|---|
| `01_clinica_vitalsalud` | Clínica VitalSalud |
| `02_banco_crediandes` | Banco CrediAndes |
| `03_farmacia_medisur` | Farmacia MediSur |
| `04_vet_cuidapatas` | Veterinaria CuidaPatas |
| `05_hotel_andes_stay` | Hotel Andes Stay |
| `06_logiexpress_urbano` | LogiExpress Urbano |
| `07_universidad_aula360` | Universidad Aula360 |
| `08_muni_data` | Municipalidad MuniData |
| `09_retail_online_market` | Retail Online Market |
| `10_agroexport_sol` | AgroExport Sol |
| `11_energyhome_servicios` | EnergyHome Servicios |
| `12_seguros_protege` | Seguros Protege |
| `13_fastfood_norte` | FastFood Norte |
| `14_manufactura_metaltec` | Manufactura MetalTec |
| `15_telconorte_movil` | TelcoNorte Móvil |
