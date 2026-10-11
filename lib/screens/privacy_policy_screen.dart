import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../theme/app_theme.dart';
import '../widgets/store_action_buttons.dart';

/// Store-ready Privacy Policy & Support page.
/// Supports both a specific [app] (`/#/app/<slug>/privacy`) and a general
/// developer privacy policy (`/#/privacy`).
class PrivacyPolicyScreen extends StatelessWidget {
  final MobileAppProject? app;
  final ThemeController themeController;

  const PrivacyPolicyScreen({
    super.key,
    this.app,
    required this.themeController,
  });

  String get _policyUrl => app != null
      ? 'https://asadduet.github.io/#/app/${app!.slug}/privacy'
      : 'https://asadduet.github.io/#/privacy';

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final profile = PortfolioData.profile;
    final policy = app?.privacyPolicy;
    final accent = app?.accentColor ?? AppTheme.primaryIndigo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacementNamed('/');
            }
          },
        ),
        title: Text(
          app != null
              ? '${app!.name} — Privacy Policy & Support'
              : '${profile.name} Apps — Privacy Policy',
          style: const TextStyle(fontSize: 16.5, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton.icon(
            onPressed: () =>
                copyTextWithToast(context, _policyUrl, 'Privacy Policy URL'),
            icon: const Icon(Icons.link_rounded, size: 18),
            label: const Text('Copy Store URL'),
          ),
          IconButton(
            tooltip: 'Toggle Dark / Light Mode',
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
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
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Banner
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: accent.withValues(alpha: 0.12),
                    border: Border.all(color: accent.withValues(alpha: 0.35)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            app?.appIcon ?? Icons.shield_rounded,
                            color: accent,
                            size: 32,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  app != null
                                      ? 'Privacy Policy for ${app!.name}'
                                      : 'Official Privacy Policy (${profile.name})',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Last Updated: ${policy?.lastUpdated ?? "October 2026"}  •  Publisher: ${profile.name}',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        policy?.summary ??
                            'This Privacy Policy describes how mobile applications developed and published by ${profile.name} handle user data, device permissions, and third-party services.',
                        style: const TextStyle(fontSize: 15, height: 1.6),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Quick App Selector if viewing general policy or switching apps
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: const Text('General Policy'),
                        selected: app == null,
                        onSelected: (_) => Navigator.of(context)
                            .pushReplacementNamed('/privacy'),
                      ),
                      const SizedBox(width: 8),
                      ...PortfolioData.mobileApps.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(item.name),
                            selected: app?.slug == item.slug,
                            onSelected: (_) => Navigator.of(context)
                                .pushReplacementNamed(
                                    '/app/${item.slug}/privacy'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                _buildPolicySection(
                  context,
                  title: '1. Information Collection & Usage',
                  icon: Icons.storage_rounded,
                  accent: accent,
                  items: policy?.dataCollected ??
                      const [
                        'Most user-created content and preferences are stored locally on your device.',
                        'Anonymous diagnostic and crash reporting data may be collected to improve stability.',
                        'Ad-supported free apps may use your device Advertising ID to serve relevant ads via Google AdMob.',
                      ],
                ),

                _buildPolicySection(
                  context,
                  title: '2. Device Permissions Requested',
                  icon: Icons.security_rounded,
                  accent: accent,
                  items: policy?.permissionsUsed ??
                      const [
                        'Permissions (such as Camera, Location, Storage, or Notifications) are requested only when required for a specific user-initiated feature.',
                        'You can revoke any optional permission at any time from your device system settings.',
                      ],
                ),

                _buildPolicySection(
                  context,
                  title: '3. Third-Party Services & SDKs',
                  icon: Icons.hub_rounded,
                  accent: accent,
                  items: policy?.thirdPartyServices ??
                      const [
                        'Google Play Services',
                        'Google AdMob (verified via asadduet.github.io/app-ads.txt)',
                        'Firebase Crashlytics & Firebase Cloud Messaging',
                      ],
                ),

                _buildTextSection(
                  context,
                  title: '4. Data Retention & Deletion Policy',
                  icon: Icons.delete_sweep_rounded,
                  accent: accent,
                  body: policy?.dataRetentionAndDeletion ??
                      'Local application data remains on your device and can be erased at any time by clearing the app storage or uninstalling the application. If an application offers cloud synchronization, users may request complete account and data deletion inside the app or by emailing developer support.',
                ),

                _buildTextSection(
                  context,
                  title: '5. Children\'s Privacy',
                  icon: Icons.child_care_rounded,
                  accent: accent,
                  body: policy?.childrenPrivacy ??
                      'Our applications do not knowingly collect personally identifiable information from children under the age of 13.',
                ),

                // Support & Contact Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.support_agent_rounded, color: accent),
                            const SizedBox(width: 10),
                            const Text(
                              '6. App Support & Contact Us',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'If you have any questions, bug reports, data deletion requests, or feedback regarding ${app?.name ?? "our mobile apps"}, please contact:',
                          style: const TextStyle(fontSize: 14.5, height: 1.5),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            FilledButton.icon(
                              onPressed: () => launchExternalLink(
                                'mailto:${policy?.supportEmail ?? profile.email}?subject=${Uri.encodeComponent("${app?.name ?? "App"} Support Inquiry")}',
                              ),
                              icon: const Icon(Icons.email_rounded, size: 18),
                              label: Text(
                                  policy?.supportEmail ?? profile.email),
                            ),
                            OutlinedButton.icon(
                              onPressed: () => copyTextWithToast(
                                context,
                                policy?.supportEmail ?? profile.email,
                                'Support email',
                              ),
                              icon: const Icon(Icons.copy_rounded, size: 17),
                              label: const Text('Copy Email'),
                            ),
                            if (app != null)
                              OutlinedButton.icon(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed('/app/${app!.slug}'),
                                icon: const Icon(
                                    Icons.phone_android_rounded,
                                    size: 17),
                                label: Text('View ${app!.name} Showcase'),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPolicySection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color accent,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: accent, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ...items.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_circle_outline_rounded,
                          color: accent, size: 18),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 14.5, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color accent,
    required String body,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: accent, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                body,
                style: const TextStyle(fontSize: 14.5, height: 1.55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
