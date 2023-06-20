import 'package:cinemapedia/presentations/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentations/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  final viewRoutes = const <Widget>[HomeView(), FavoritesView(), SizedBox()];
  static const name = 'home-screen';

  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: pageIndex),
    );
  }
}
