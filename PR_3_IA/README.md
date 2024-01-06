 # Práctica 3 de IA
 Paloma Pérez de Madrid Laguna

## Objetivo
Predecir si una persona va a ganar más de 50.000$ al año
- Datos sacados de: https://www.kaggle.com/datasets/ayessa/salary-prediction-classification/
- Columnas: 'age', 'workclass', 'education', 'education-num',
       'marital-status', 'occupation', 'relationship', 'race', 'sex',
       'capital-gain', 'capital-loss', 'hours-per-week', 'native-country',
       'salary' 
- fnlwgt significa: Final Weight (número de personas que representa cada entrada en la base de datos)

### Datos de las columnas
- age: contínua.
- workclass: Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked.
- fnlwgt: continuous.
- education: Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, Assoc-voc, 9th, 7th-8th, 12th, Masters, 1st-4th, 10th, Doctorate, 5th-6th, Preschool.
- education-num: continuous.
- marital-status: Married-civ-spouse, Divorced, Never-married, Separated, Widowed, Married-spouse-absent, Married-AF-spouse.
- occupation: Tech-support, Craft-repair, Other-service, Sales, Exec-managerial, Prof-specialty, Handlers-cleaners, Machine-op-inspct, Adm-clerical,Farming-fishing, Transport-moving, Priv-house-serv, Protective-serv, Armed-Forces
- relationship: Wife, Own-child, Husband, Not-in-family, Other-relative, Unmarried.
- race: White, Asian-Pac-Islander, Amer-Indian-Eskimo, Other, Black.
- sex: Female, Male.
- capital-gain: contínua.
- capital-loss: contínua.
- hours-per-week: contínua.
- native-country: United-States, Cambodia, England, Puerto-Rico, Canada, Germany, Outlying-US(Guam-USVI-etc), India, Japan, Greece, South, China, Cuba, Iran, Honduras, Philippines, Italy, Poland, Jamaica, Vietnam, Mexico, Portugal, Ireland, France, Dominican-Republic, Laos, Ecuador, Taiwan, Haiti, Columbia, Hungary, Guatemala, Nicaragua, Scotland, Thailand, Yugoslavia, El-Salvador, Trinadad&Tobago, Peru, Hong, Holand-Netherlands.
- salary: <=50K o >50K

## Algoritmos Utilizados
**Árboles de Decisión:**\
Los Árboles de Decisión son algoritmos de aprendizaje supervisado que dividen el conjunto de datos en nodos mediante preguntas sobre sus características, buscando clasificar o predecir resultados. Son interpretables y útiles para problemas de clasificación y regresión.

En el contexto de un conjunto de datos que predice si una persona gana más de 50.000$ al año, los Árboles de Decisión son una opción interesante debido a su interpretabilidad. Pueden proporcionar reglas claras sobre cómo las características influyen en la predicción, permitiendo comprender el proceso de toma de decisiones del modelo.

**Redes Neuronales:**\
Las Redes Neuronales podrían ser útiles para capturar patrones complejos en datos no lineales, pero suelen ser más adecuadas para conjuntos de datos grandes y complejos. Dada la naturaleza de la tarea de clasificación de ingresos, donde la relación entre características y resultado podría no ser altamente no lineal, las Redes Neuronales podrían ser una opción más compleja de implementar sin garantizar beneficios significativos.

**Random Forest:**\
Random Forest es un conjunto de Árboles de Decisión, donde múltiples árboles se entrenan en diferentes subconjuntos del conjunto de datos. Luego, se combinan para mejorar la precisión y reducir el sobreajuste, siendo robustos y eficaces en diversas aplicaciones, como clasificación y regresión.

Al ser un conjunto de Árboles de Decisión, proporciona robustez y generalización, siendo una opción atractiva para mejorar la precisión del modelo y mitigar el sobreajuste. Su capacidad para manejar múltiples características y lidiar con datos ruidosos podría ser valiosa en este caso.

**Support Vector Machine:**\
Support Vector Machine (SVM) es un algoritmo que busca encontrar un "límite" (hiperplano de separación) óptimo entre dos clases en un conjunto de datos, maximizando la distancia entre los puntos más cercanos de cada clase. Estos puntos, llamados vectores de soporte, definen el hiperplano que separa las clases, haciendo que SVM sea efectivo en problemas de clasificación.

Es eficaz en problemas de clasificación, especialmente cuando la separación entre clases es crucial. Sin embargo, su interpretabilidad ( capacidad de comprender y explicar cómo el modelo toma decisiones) puede ser limitada en comparación con los Árboles de Decisión. El hiperplano de separación puede ser difícil de visualizar y explicar en términos simples, especialmente en espacios de características de alta dimensión

## Cómo ejecutar la práctica en Google Colab
1. Entre en la carpeta "PR_3_IA"
2. Pinche en el archivo "PracticaIA_3_final.ipynb"
3. Abra el colab clicando en "Open in Colab" 
[!](img_abrir_colab.png)
4. Seleccione el icono de la carpeta
[!](icono_carpeta.png)
5. Suba el archivo "salary.csv"
[!](subir_archivo.png)
6. Proceda a ejecutar cada contenedor de código