# CatBreeds App

<img src="https://github.com/diegolopezrm/catbreeds_app/assets/63005462/6cef9ec6-87eb-4409-b6d2-1929e65da6bb"  height="400">
<img src="https://github.com/diegolopezrm/catbreeds_app/assets/63005462/cee687ed-3868-4f3d-b10e-8efbbfc973d4"  height="400">
<img src="https://github.com/diegolopezrm/catbreeds_app/assets/63005462/5730d1e4-3d6e-4401-ba0f-2a8c5db9a307"  height="400">

## Descripción

`catbreeds_app` es una aplicación Flutter que permite a los usuarios explorar diferentes razas de gatos, ver detalles específicos de cada raza y buscar razas específicas.

## Estructura del Proyecto

A continuación, se presenta una descripción general de la estructura del proyecto:

![image](https://github.com/diegolopezrm/catbreeds_app/assets/63005462/90324f39-343a-4448-9b29-4882db8754e7)


- **blocs/**: Contiene la lógica de negocio utilizando el patrón BLoC.
  - **catbreed_bloc/**: BLoC relacionado con las operaciones de razas de gatos.
- **models/**: Define los modelos de datos utilizados en la aplicación.
- **repositories/**: Proporciona una capa de abstracción entre la lógica de negocio y las fuentes de datos.
- **services/**: Servicios para interactuar con APIs y otras operaciones externas.
- **utils/**: Contiene constantes y otras utilidades.
- **views/**: Contiene la UI de la aplicación.
  - **screens/**: Pantallas principales de la aplicación.
  - **themes/**: Estilos y temas de la aplicación.
  - **widgets/**: Widgets reutilizables.

## Tecnologías y Dependencias

- **Flutter**: SDK para construir aplicaciones natively compiled.
- **http**: Para realizar solicitudes HTTP.
- **flutter_bloc**: Para implementar el patrón BLoC.
- **metaballs**: Para efectos visuales.

## Cómo ejecutar

1. Asegúrate de tener Flutter y Dart SDK instalados.
2. Clona este repositorio.
3. Navega al directorio del proyecto y ejecuta `flutter pub get` para instalar las dependencias.
4. Ejecuta `flutter run` para iniciar la aplicación en un emulador o dispositivo físico.

## Recursos

- Assets: Contiene imágenes utilizadas en la aplicación.

---
