# MuniData

**Sector:** Sector p?blico

## Objetivo del caso
Analizar tr?mites, ciudadanos, ?reas y pagos para mejorar atenci?n municipal.

## Archivos
- `08_muni_data.db`: base SQLite oficial del caso.
- `schema.sql`: estructura de tablas y claves.
- `csv/`: tablas exportadas para revisi?n o carga alternativa.

## Tablas principales
- `entidades`: clientes, pacientes, ciudadanos, usuarios u objetos principales del caso.
- `sedes`: puntos de atenci?n, locales o unidades operativas.
- `productos_servicios`: cat?logo de productos o servicios.
- `operaciones`: transacciones o eventos centrales.
- `incidencias`: observaciones, reclamos o problemas asociados.
- `pagos`: pagos o movimientos monetarios.

## Uso en Colab
```python
import requests, sqlite3, pandas as pd
caso = "08_muni_data"
url = f"https://raw.githubusercontent.com/Rociosayan/PMD2_FGD_Bases_Oficiales_FDG/main/casos/{caso}/{caso}.db"
r = requests.get(url)
open("base.sqlite", "wb").write(r.content)
conn = sqlite3.connect("base.sqlite")
tablas = pd.read_sql_query("SELECT name FROM sqlite_schema WHERE type='table' ORDER BY name", conn)
display(tablas)
```
