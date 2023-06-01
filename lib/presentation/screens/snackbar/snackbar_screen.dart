import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola mundo!'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Está a punto de acceder a una aplicación que requiere su consentimiento. ¿Está seguro de que desea continuar? Al confirmar, acepta los términos y condiciones de la aplicación. Por favor, lea atentamente antes de continuar.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'El software es un producto intelectual que requiere de una protección legal adecuada para garantizar los derechos de sus creadores y usuarios. Las licencias de uso son los instrumentos jurídicos que regulan las condiciones de uso, distribución y modificación del software por parte de terceros. Las licencias de uso pueden ser de diferentes tipos, desde las más restrictivas que limitan el uso del software a un solo usuario o dispositivo, hasta las más permisivas que permiten el uso libre y la modificación del código fuente. La elección de una licencia de uso adecuada es fundamental para el desarrollo y la innovación del software, ya que puede favorecer o dificultar la colaboración entre desarrolladores, la difusión del software y la generación de valor añadido. Aquí encontrarás todas las licencias que usa esta aplicación.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}
