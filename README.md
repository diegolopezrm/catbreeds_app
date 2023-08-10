# CatBreeds App

## Descripción

`catbreeds_app` es una aplicación Flutter que permite a los usuarios explorar diferentes razas de gatos, ver detalles específicos de cada raza y buscar razas específicas.

## Estructura del Proyecto

A continuación, se presenta una descripción general de la estructura del proyecto:

![Diagrama de estructura del proyecto]() [Puedes ver este diagrama en una nueva pestaña.]()

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