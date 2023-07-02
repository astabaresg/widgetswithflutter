import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

enum Transportation { motorcycle, plane, boat, submarine }

class _UiControlsView extends ConsumerStatefulWidget {
  const _UiControlsView();

  @override
  ConsumerState<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends ConsumerState<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.motorcycle;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Map<Transportation, IconData> iconTransportValue = {
    Transportation.motorcycle: Icons.motorcycle_rounded,
    Transportation.plane: Icons.airplane_ticket_rounded,
    Transportation.boat: Icons.directions_boat_filled_rounded,
    Transportation.submarine: Icons.catching_pokemon_rounded,
  };

  Map<Transportation, String> stringTransportValue = {
    Transportation.motorcycle: 'Motocicleta',
    Transportation.plane: 'Avión',
    Transportation.boat: 'Bote',
    Transportation.submarine: 'Submarino',
  };

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: theme == ThemeMode.dark,
          onChanged: (value) {
            final isDarkTheme = isDeveloper;
            ref.read(themeProvider.notifier).state =
                isDarkTheme ? ThemeMode.dark : ThemeMode.light;
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
          title: const Text('Modo oscuro'),
          subtitle: const Text('Controles adicionales'),
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Row(
            children: [
              Icon(iconTransportValue[selectedTransportation]),
              const SizedBox(
                width: 10,
              ),
              Text('${stringTransportValue[selectedTransportation]}')
            ],
          ),
          children: [
            RadioListTile(
              title: const Text('By motorcycle'),
              subtitle: const Text('Viajar en moto'),
              value: Transportation.motorcycle,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.motorcycle;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar en bote'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Desea incluir desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Desea incluir almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Desea incluir cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
