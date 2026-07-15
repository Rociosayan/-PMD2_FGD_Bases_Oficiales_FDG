# Veterinaria CuidaPatas

**Sector:** Servicios veterinarios  |  **Código del caso:** `04_vet_cuidapatas`

## Contexto
Veterinaria CuidaPatas es una clínica veterinaria con sedes en Surco, La Molina y San Borja. Registra a sus clientes, su personal,
su catálogo de servicios veterinarios, las operaciones del negocio, los pagos y las incidencias.
La dirección necesita **ordenar, auditar y gobernar** estos datos (semanas 9 a 15 del curso).

## Archivos
- `04_vet_cuidapatas.db` — base SQLite oficial del caso.
- `schema.sql` — estructura de las 8 tablas y sus claves.
- `csv/` — cada tabla exportada a CSV (carga alternativa).
- `diccionario_datos.csv` — metadatos: tabla, columna, tipo, clave y sensibilidad.

## Tablas
| Tabla | Descripción |
|---|---|
| `sedes` | Locales / puntos de atención. |
| `empleados` | Personal (incluye datos personales y sueldo). |
| `clientes` | Clientes — incluye datos personales y el dato contextual veterinario `motivo_atencion_mascota`. |
| `productos_servicios` | Catálogo de servicios veterinarios. |
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
caso = "04_vet_cuidapatas"
url = "https://raw.githubusercontent.com/Rociosayan/PMD2_FDG_Casos/main/casos/04_vet_cuidapatas/04_vet_cuidapatas.db"
open("base.sqlite","wb").write(requests.get(url).content)
conn = sqlite3.connect("base.sqlite")
display(pd.read_sql_query("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name", conn))
```
