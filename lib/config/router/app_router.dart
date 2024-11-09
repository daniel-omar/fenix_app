import 'package:fenix_app/presentation/pages/home_page.dart';
import 'package:fenix_app/presentation/pages/pages.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  )
]);
