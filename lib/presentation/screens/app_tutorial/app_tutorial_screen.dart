import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/domain/slide_info.dart';

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Descubre una amplia variedad de opciones gastronómicas, encuentra tus restaurantes favoritos al alcance de tu mano y explora un mundo de sabores y deliciosas opciones',
      'assets/images/1.png'),
  SlideInfo('Entrega rápida', 'Recibe tu comida en tiempo récord, sin esperas',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Satisface tus antojos y déjate llevar por el sabor, experimentando momentos de placer culinario',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(slide: slide)).toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Salir'),
                onPressed: () => context.pop(),
              )),
          Visibility(
            visible: endReached,
            child: Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    child: const Text('Comenzar'),
                    onPressed: () => context.pop(),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slide.imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text(
              slide.title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              slide.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
