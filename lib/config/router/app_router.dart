import 'package:cinegod/presentation/screens/movies/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/', 
      name: HomeScreen.routeName, 
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);