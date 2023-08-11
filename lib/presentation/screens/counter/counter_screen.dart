import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static const String name = 'counter_screen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int clickCounter = ref.watch(counterProvider);
    final theme = ref.watch(themeProvider);
    bool isDarkMode = theme == ThemeMode.dark;

    IconData icon =
        isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter screen"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(themeProvider.notifier).state =
                    isDarkMode ? ThemeMode.light : ThemeMode.dark;
              },
              icon: Icon(icon))
        ],
      ),
      body: _CounterScreenView(
        countValue: clickCounter,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;

          // ref.read(counterProvider.notifier).update((state) => state + 1); // otra forma de hacerlo
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CounterScreenView extends StatelessWidget {
  final int countValue;
  const _CounterScreenView({
    required this.countValue,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displaySmall;
    return Center(
      child: Text(
        "Valor: $countValue",
        style: titleStyle,
      ),
    );
  }
}
