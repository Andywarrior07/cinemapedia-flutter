import 'package:cinemapedia/presentations/views/views.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentations/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
