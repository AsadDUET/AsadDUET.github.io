import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asad_portfolio/main.dart';
import 'package:asad_portfolio/data/portfolio_data.dart';

void main() {
  testWidgets('Portfolio HomeScreen renders developer profile and mobile apps',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AsadPortfolioApp());
    await tester.pumpAndSettle();

    // Verify Hero & Developer Name
    expect(find.textContaining(PortfolioData.profile.name), findsWidgets);
    expect(find.text('Featured Mobile Applications'), findsOneWidget);

    // Verify showcase apps are displayed
    for (final app in PortfolioData.mobileApps) {
      expect(find.text(app.name), findsWidgets);
    }

    // Verify Dark/Light Theme toggle works
    final lightModeIcon = find.byIcon(Icons.light_mode_rounded);
    expect(lightModeIcon, findsOneWidget);
    await tester.tap(lightModeIcon);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.dark_mode_rounded), findsOneWidget);
  });

  testWidgets('Deep-link navigation to AppDetailScreen and PrivacyPolicyScreen',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AsadPortfolioApp());
    await tester.pumpAndSettle();

    // Navigate to Privacy Policies via top nav bar
    await tester.tap(find.text('Privacy Policies'));
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Developer Privacy Policy'),
      findsOneWidget,
    );

    // Switch to a specific app's privacy policy using the ChoiceChip
    final firstApp = PortfolioData.mobileApps.first;
    await tester.tap(find.text(firstApp.name));
    await tester.pumpAndSettle();

    expect(
      find.text('Privacy Policy for ${firstApp.name}'),
      findsOneWidget,
    );
  });
}
