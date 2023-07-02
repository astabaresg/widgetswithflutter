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
      icon: Icons.car_rental_outlined)
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
