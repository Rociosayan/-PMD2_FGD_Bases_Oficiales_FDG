# Municipalidad MuniData

**Sector:** Sector público  |  **Código del caso:** `08_muni_data`

## Contexto
Municipalidad MuniData es una gobierno local que atiende trámites y servicios al ciudadano. Registra a sus ciudadanos, su personal,
su catálogo de trámites y servicios, las operaciones del negocio, los pagos y las incidencias.
La dirección necesita **ordenar, auditar y gobernar** estos datos (semanas 9 a 15 del curso).

## Archivos
- `08_muni_data.db` — base SQLite oficial del caso.
- `schema.sql` — estructura de las 8 tablas y sus claves.
- `csv/` — cada tabla exportada a CSV (carga alternativa).
- `diccionario_datos.csv` — metadatos: tabla, columna, tipo, clave y sensibilidad.

## Tablas
| Tabla | Descripción |
|---|---|
| `sedes` | Locales / puntos de atención. |
| `empleados` | Personal (incluye datos personales y sueldo). |
| `clientes` | Ciudadanos — incluye PII y el dato sensible `tipo_tramite`. |
| `productos_servicios` | Catálogo de trámites y servicios. |
| `operaciones` | Transacciones (tabla de hechos). |
| `detalle_operacion` | Líneas por operación (N:M con productos). |
| `pagos` | Pagos por operación. |
| `incidencias` | Reclamos / observaciones. |

> ⚠️ **Aviso:** la base contiene, de forma intencional, problemas de calidad
> (nulos, duplicados, inconsistencias, valores inválidos, huérfanos y formatos mezclados)
> y **datos personales/sensibles** para que el equipo los audite y proponga gobierno de datos.
> Los datos son ficticios.

## Carga en Google Colab
```python
import requests, sqlite3, pandas as pd
caso = "08_muni_data"
url = "https://raw.githubusercontent.com/Rociosayan/-PMD2_FGD_Bases_Oficiales_FDG/main/casos/08_muni_data/08_muni_data.db"
open("base.sqlite","wb").write(requests.get(url).content)
conn = sqlite3.connect("base.sqlite")
display(pd.read_sql_query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name", conn))
```
