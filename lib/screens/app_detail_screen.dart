import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../theme/app_theme.dart';
import '../widgets/phone_mockup_frame.dart';
import '../widgets/store_action_buttons.dart';

class AppDetailScreen extends StatelessWidget {
  final MobileAppProject app;
  final ThemeController themeController;

  const AppDetailScreen({
    super.key,
    required this.app,
    required this.themeController,
  });

  String get _shareableAppUrl =>
      'https://asadduet.github.io/#/app/${app.slug}';

  String get _shareablePrivacyUrl =>
      'https://asadduet.github.io/#/app/${app.slug}/privacy';

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          tooltip: 'Back to Portfolio',
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
        ),
        title: Row(
          children: [
            Icon(app.appIcon, color: app.accentColor, size: 22),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                app.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.of(context)
                .pushNamed('/app/${app.slug}/privacy'),
            icon: const Icon(Icons.privacy_tip_outlined, size: 18),
            label: const Text('Privacy Policy'),
          ),
          IconButton(
            tooltip: 'Copy App Showcase Link',
            icon: const Icon(Icons.share_rounded, size: 20),
            onPressed: () => copyTextWithToast(
              context,
              _shareableAppUrl,
              'App showcase URL',
            ),
          ),
          IconButton(
            tooltip: 'Toggle Dark / Light Mode',
            icon: Icon(
              isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
            onPressed: themeController.toggle,
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner for the App
            Container(
              padding: EdgeInsets.all(isMobile ? 22 : 36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    app.accentColor.withValues(alpha: isDark ? 0.16 : 0.10),
                    Theme.of(context).cardTheme.color ??
                        Theme.of(context).colorScheme.surface,
                  ],
                ),
                border: Border.all(
                  color: app.accentColor.withValues(alpha: 0.35),
                ),
              ),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAppHeaderDetails(context),
                        const SizedBox(height: 32),
                        Center(
                          child: PhoneMockupFrame(
                            app: app,
                            width: 265,
                            height: 520,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 6,
                          child: _buildAppHeaderDetails(context),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: PhoneMockupFrame(
                              app: app,
                              width: 280,
                              height: 550,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),

            const SizedBox(height: 36),

            // Key Features & Tech Stack Grid
            isMobile
                ? Column(
                    children: [
                      _buildFeaturesCard(context),
                      const SizedBox(height: 24),
                      _buildTechAndStoreComplianceCard(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildFeaturesCard(context),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 4,
                        child: _buildTechAndStoreComplianceCard(context),
                      ),
                    ],
                  ),

            const SizedBox(height: 40),

            // Other Apps by Asad
            const Text(
              'More Mobile Apps by Asad',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: PortfolioData.mobileApps
                  .where((other) => other.slug != app.slug)
                  .map(
                    (other) => ActionChip(
                      avatar: Icon(
                        other.appIcon,
                        size: 18,
                        color: other.accentColor,
                      ),
                      label: Text(other.name),
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed('/app/${other.slug}'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildAppHeaderDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: app.accentColor.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                app.category,
                style: TextStyle(
                  color: app.accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                ),
              ),
            ),
            ...app.platforms.map(
              (platform) => Chip(
                visualDensity: VisualDensity.compact,
                label: Text(platform, style: const TextStyle(fontSize: 12)),
              ),
            ),
            Chip(
              visualDensity: VisualDensity.compact,
              label: Text(
                '${app.version} • ${app.releaseYear}',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: app.accentColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(app.appIcon, color: app.accentColor, size: 36),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${app.downloadsBadge}  •  ${app.rating ?? 4.8} ★ Rating',
                    style: TextStyle(
                      color: app.accentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Text(
          app.tagline,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          app.fullDescription,
          style: TextStyle(
            fontSize: 15,
            height: 1.65,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 24),
        StoreActionButtons(app: app),
      ],
    );
  }

  Widget _buildFeaturesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome_rounded, color: app.accentColor),
                const SizedBox(width: 10),
                const Text(
                  'Key Highlights & Capabilities',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ...app.keyFeatures.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: app.accentColor,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 14.5, height: 1.45),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechAndStoreComplianceCard(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.layers_rounded, color: app.accentColor),
                    const SizedBox(width: 10),
                    const Text(
                      'Tech Stack & SDKs',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: app.techStack
                      .map(
                        (tech) => Chip(
                          label: Text(
                            tech,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.verified_user_rounded, color: app.accentColor),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Store Privacy Policy & Support URL',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Use this dedicated URL in Google Play Console or App Store Connect for ${app.name}:',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surface
                        .withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: SelectableText(
                    _shareablePrivacyUrl,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilledButton.icon(
                      onPressed: () => Navigator.of(context)
                          .pushNamed('/app/${app.slug}/privacy'),
                      icon: const Icon(Icons.privacy_tip_rounded, size: 17),
                      label: const Text('Open Privacy Policy'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => copyTextWithToast(
                        context,
                        _shareablePrivacyUrl,
                        'Privacy Policy URL',
                      ),
                      icon: const Icon(Icons.copy_rounded, size: 17),
                      label: const Text('Copy URL'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
