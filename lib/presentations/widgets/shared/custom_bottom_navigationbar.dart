import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;

    switch (location) {
      case '/':
        return 0;
      case '/favorites':
        return 1;
      case '/categories':
        return 2;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_important_outline),
          label: 'Categorias',
        ),
      ],
    );
  }
}
