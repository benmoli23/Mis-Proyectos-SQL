Proyecto de Ingeniería de Datos | Benjamín - Estudiante de Ingeniería Química
"Transformando la observación de campo en modelos de decisión económica mediante SQL."

📝 Descripción del Proyecto
Este repositorio presenta un modelo lógico desarrollado en SQL (PostgreSQL) para el cálculo de márgenes y rentabilidad. El proyecto surge de mi experiencia directa en el sector retail, aplicando el pensamiento sistémico de la ingeniería para transformar datos operativos en indicadores clave (KPIs) de negocio.

⚙️ Pipeline de Datos (Proceso ETL)
Para la construcción de este modelo, seguí un flujo de trabajo estructurado de integración de datos:

Captura y Estructuración (Excel): Utilicé Excel para consolidar las observaciones de campo (precios y productos) en una tabla provisoria, normalizando los registros para su posterior migración.

Transformación: Definición de tipos de datos y limpieza de variables para asegurar la integridad referencial de los 11 productos analizados.

Carga y Procesamiento (PostgreSQL): Migración de la estructura a pgAdmin 4, donde se ejecutó la lógica de rentabilidad mediante un script de 57 líneas de código SQL.

🛡️ Nota sobre la Integridad de Datos
Para garantizar la ética profesional y la confidencialidad de la empresa donde me desempeño, este análisis utiliza un dataset sintético:

Los precios y volúmenes son referenciales (basados en observaciones reales de mercado).

La lógica de cálculo y la arquitectura de la base de datos son 100% funcionales y escalables a entornos de producción reales.

💻 Stack Técnico
Motor de Base de Datos: PostgreSQL (pgAdmin 4).

Lenguaje: SQL (Consultas de agregación, cálculos de margen y clasificación de productos).

Herramientas de Soporte: Microsoft Excel (Gestión de datos inicial).

📈 Análisis Realizado
El script sistema_gestion_retail.sql automatiza:

El cálculo del Margen de Contribución por producto.

El análisis de la Eficiencia Económica (Rentabilidad %).

La identificación de productos líderes en generación de valor.

Proyecto desarrollado por Benjamín | 2026
### 📸 Evidencia del Sistema
Aquí se puede observar el resultado de las consultas generadas por el script:

#### 1. Reporte de Caja Final
![Reporte de Caja](reporte_caja.png)

#### 2. Análisis de Rentabilidad y Márgenes
![Análisis de Rentabilidad](rentabilidad.png)
