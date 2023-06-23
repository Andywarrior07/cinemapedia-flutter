import 'package:cinemapedia/presentations/screens/screens.dart';

import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    // ShellRoute(
    //   builder: (context, state, child) => HomeScreen(childView: child),
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       builder: (context, state) => const HomeView(),
    //       routes: [
    //         GoRoute(
    //           path: 'movie/:id',
    //           name: MovieScreen.name,
    //           builder: (context, state) => MovieScreen(
    //             movieId: state.pathParameters["id"] ?? 'not-found',
    //           ),
    //         ),
    //       ],
    //     ),
    //     GoRoute(
    //       path: '/favorites',
    //       builder: (context, state) => const FavoritesView(),
    //     ),
    //   ],
    // ),
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters["id"] ?? 'not-found',
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    ),
  ],
);
