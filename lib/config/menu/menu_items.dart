import 'package:flutter/material.dart';

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en flutter',
      url: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      url: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicator',
      subtitle: 'Generales y controles',
      url: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y diálogos',
      subtitle: 'Indicadores en pantalla',
      url: '/snackbars',
      icon: Icons.info_outline_rounded),
  MenuItem(
      title: 'Animated container',
      subtitle: 'Stateful widget animado',
      url: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItem(
      title: 'UI Controls + Tiles',
      subtitle: 'Una serie de controles en flutter',
      url: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introducción a la aplicación',
      subtitle: 'Pequeño tutorial introductorio',
      url: '/tutorial',
      icon: Icons.accessibility_new_rounded),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subtitle: 'Listas infinitas y pull to refresh',
      url: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Counter Screen',
      subtitle: 'Implementación de riverpod',
      url: '/counter',
      icon: Icons.add_circle_outline_rounded),
  MenuItem(
      title: 'Theme Changer Screen',
      subtitle: 'Función para cambiar el tema de la aplicacion',
      url: '/theme_changer',
      icon: Icons.color_lens_outlined),
];

class MenuItem {
  final String title;
  final String subtitle;
  final String url;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.url,
      required this.icon});
}
