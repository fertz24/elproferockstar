import 'package:cinegod/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:cinegod/presentation/views/movies/home_view.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example of accessing another environment variable
    return const Scaffold(body: SafeArea(child: HomeView()), 
    bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}