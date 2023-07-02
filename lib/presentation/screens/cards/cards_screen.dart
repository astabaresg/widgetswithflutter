import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});
  static const String name = 'cards_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _BasicCard(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) =>
              _OutlineCard(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) =>
              _FilledCard(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) =>
              _ImageCard(label: card['label'], elevation: card['elevation'])),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}

class _BasicCard extends StatelessWidget {
  final String label;
  final double elevation;
  const _BasicCard({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _OutlineCard extends StatelessWidget {
  final String label;
  final double elevation;
  const _OutlineCard({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(color: colors.outline)),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outlined'),
            )
          ],
        ),
      ),
    );
  }
}

class _FilledCard extends StatelessWidget {
  final String label;
  final double elevation;
  const _FilledCard({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  onPressed: () {},
                )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final String label;
  final double elevation;
  const _ImageCard({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Center(
            child: Image.network(
              'https://cdn.leonardo.ai/users/3aecbe47-5904-4162-ab5b-e11aa7fad5f9/generations/38c457e5-4c00-4370-b780-e5d76c156dbb/variations/Default_A_detailed_illustration_of_clouds_quilled_paper_intric_0_38c457e5-4c00-4370-b780-e5d76c156dbb_1.jpg',
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: IconButton(
                  icon: const Icon(Icons.more_horiz_outlined),
                  onPressed: () {},
                ),
              )),
        ],
      ),
    );
  }
}
