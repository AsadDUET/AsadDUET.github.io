import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'models/portfolio_models.dart';
import 'screens/app_detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AsadPortfolioApp());
}

class AsadPortfolioApp extends StatefulWidget {
  const AsadPortfolioApp({super.key});

  @override
  State<AsadPortfolioApp> createState() => _AsadPortfolioAppState();
}

class _AsadPortfolioAppState extends State<AsadPortfolioApp> {
  final ThemeController _themeController = ThemeController();

  @override
  void dispose() {
    _themeController.dispose();
    super.dispose();
  }

  MobileAppProject? _findAppBySlug(String slug) {
    for (final app in PortfolioData.mobileApps) {
      if (app.slug.toLowerCase() == slug.toLowerCase()) {
        return app;
      }
    }
    return null;
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final rawName = settings.name ?? '/';
    final uri = Uri.tryParse(rawName) ?? Uri(path: '/');
    final segments = uri.pathSegments.where((s) => s.isNotEmpty).toList();

    // Route: `/privacy` -> General Developer Privacy Policy
    if (segments.length == 1 && segments.first == 'privacy') {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => PrivacyPolicyScreen(
          themeController: _themeController,
        ),
      );
    }

    // Route: `/app/<slug>` or `/app/<slug>/privacy`
    if (segments.length >= 2 && segments.first == 'app') {
      final slug = segments[1];
      final matchedApp = _findAppBySlug(slug);

      if (segments.length >= 3 && segments[2] == 'privacy') {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => PrivacyPolicyScreen(
            app: matchedApp,
            themeController: _themeController,
          ),
        );
      }

      if (matchedApp != null) {
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AppDetailScreen(
            app: matchedApp,
            themeController: _themeController,
          ),
        );
      }
    }

    // Default Route: `/` -> HomeScreen
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => HomeScreen(
        themeController: _themeController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeController,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'IoTBangla | Mobile Apps & Smart Solutions',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode,
          initialRoute: '/',
          onGenerateRoute: _onGenerateRoute,
        );
      },
    );
  }
}
