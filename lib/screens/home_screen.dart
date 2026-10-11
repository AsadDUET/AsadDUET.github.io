import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../models/portfolio_models.dart';
import '../theme/app_theme.dart';
import '../widgets/phone_mockup_frame.dart';
import '../widgets/store_action_buttons.dart';

class HomeScreen extends StatefulWidget {
  final ThemeController themeController;

  const HomeScreen({
    super.key,
    required this.themeController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _appsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _timelineKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  int _heroPreviewAppIndex = 0;
  String _selectedFilter = 'All Apps';

  static const List<String> _filters = [
    'All Apps',
    'Featured',
    'Android',
    'iOS',
    'Open Source',
  ];

  List<MobileAppProject> get _filteredApps {
    final all = PortfolioData.mobileApps;
    switch (_selectedFilter) {
      case 'Featured':
        return all.where((a) => a.isFeatured).toList();
      case 'Android':
        return all.where((a) => a.platforms.contains('Android')).toList();
      case 'iOS':
        return all.where((a) => a.platforms.contains('iOS')).toList();
      case 'Open Source':
        return all.where((a) => a.isOpenSource).toList();
      default:
        return all;
    }
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCompactNav = MediaQuery.sizeOf(context).width < 980;

    return Scaffold(
      endDrawer: isCompactNav ? _buildMobileDrawer(context) : null,
      body: Column(
        children: [
          _buildTopNavBar(context, isCompactNav),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildHeroSection(context),
                  _buildStatsBar(context),
                  _buildAppsShowcaseSection(context),
                  _buildSkillsSection(context),
                  _buildTimelineSection(context),
                  _buildContactAndFooterSection(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavBar(BuildContext context, bool isCompactNav) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final profile = PortfolioData.profile;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 14),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .scaffoldBackgroundColor
            .withValues(alpha: 0.92),
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        children: [
          // Brand Logo
          InkWell(
            onTap: () => _scrollToSection(_heroKey),
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.primaryIndigo, AppTheme.accentCyan],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.flutter_dash_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Mobile Apps & IoT Studio',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppTheme.accentCyan
                            : AppTheme.primaryIndigo,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isCompactNav)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _NavBarButton(
                        label: 'Home',
                        onTap: () => _scrollToSection(_heroKey),
                      ),
                      _NavBarButton(
                        label: 'Mobile Apps',
                        onTap: () => _scrollToSection(_appsKey),
                      ),
                      _NavBarButton(
                        label: 'Capabilities',
                        onTap: () => _scrollToSection(_skillsKey),
                      ),
                      _NavBarButton(
                        label: 'Solutions',
                        onTap: () => _scrollToSection(_timelineKey),
                      ),
                      _NavBarButton(
                        label: 'Privacy Policies',
                        onTap: () =>
                            Navigator.of(context).pushNamed('/privacy'),
                      ),
                      const SizedBox(width: 8),
                      FilledButton.icon(
                        onPressed: () => _scrollToSection(_contactKey),
                        icon: const Icon(Icons.mail_outline_rounded, size: 17),
                        label: const Text('Contact'),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            )
          else
            const Spacer(),
          IconButton(
            tooltip: isDark
                ? 'Switch to Light Mode'
                : 'Switch to Dark Mode',
            onPressed: widget.themeController.toggle,
            icon: Icon(
              isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
            ),
          ),
          if (isCompactNav)
            Builder(
              builder: (ctx) => IconButton(
                tooltip: 'Open Menu',
                icon: const Icon(Icons.menu_rounded),
                onPressed: () => Scaffold.of(ctx).openEndDrawer(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'IoTBangla',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const Divider(height: 28),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Home & About'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_heroKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone_iphone_rounded),
              title: const Text('Mobile Apps'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_appsKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.code_rounded),
              title: const Text('Capabilities & Tech Stack'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.timeline_rounded),
              title: const Text('What We Build'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_timelineKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip_rounded),
              title: const Text('App Privacy Policies'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/privacy');
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail_rounded),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final profile = PortfolioData.profile;
    final apps = PortfolioData.mobileApps;
    final previewApp = apps[_heroPreviewAppIndex % apps.length];

    return Container(
      key: _heroKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: hPad,
        vertical: isMobile ? 36 : 64,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroLeftColumn(context, profile),
                const SizedBox(height: 40),
                Center(
                  child: _buildHeroPhoneShowcase(context, apps, previewApp),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _buildHeroLeftColumn(context, profile),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: _buildHeroPhoneShowcase(context, apps, previewApp),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildHeroLeftColumn(BuildContext context, DeveloperProfile profile) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status & Education Badges
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            if (profile.availableForWork)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentEmerald.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppTheme.accentEmerald.withValues(alpha: 0.45),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: AppTheme.accentEmerald, size: 9),
                    SizedBox(width: 7),
                    Flexible(
                      child: Text(
                        'Official Mobile App Publisher & Studio',
                        style: TextStyle(
                          color: AppTheme.accentEmerald,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.primaryIndigo.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppTheme.primaryIndigo.withValues(alpha: 0.4),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.memory_rounded,
                    color: AppTheme.primaryIndigo,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      profile.educationBadge,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),

        // Main Headline
        Text(
          '${profile.name} —\n${profile.roleTitle}',
          style: TextStyle(
            fontSize: isMobile ? 32 : 46,
            fontWeight: FontWeight.w900,
            height: 1.12,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(height: 16),

        Text(
          profile.heroTagline,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: AppTheme.accentCyan,
          ),
        ),
        const SizedBox(height: 14),

        Text(
          profile.bio,
          style: TextStyle(
            fontSize: 15.5,
            height: 1.65,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          profile.aboutExtended,
          style: TextStyle(
            fontSize: 14.5,
            height: 1.6,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.68),
          ),
        ),
        const SizedBox(height: 28),

        // Primary CTAs
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
              ),
              onPressed: () => _scrollToSection(_appsKey),
              icon: const Icon(Icons.phone_android_rounded, size: 19),
              label: const Text(
                'Explore Our Mobile Apps',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              onPressed: () => launchExternalLink(profile.playStoreDevUrl),
              icon: const Icon(Icons.shop_rounded, size: 19),
              label: const Text('Google Play Store'),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              onPressed: () => _scrollToSection(_contactKey),
              icon: const Icon(Icons.mail_outline_rounded, size: 19),
              label: const Text('Contact IoTBangla'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroPhoneShowcase(
    BuildContext context,
    List<MobileAppProject> apps,
    MobileAppProject previewApp,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PhoneMockupFrame(
          app: previewApp,
          width: 275,
          height: 535,
        ),
        const SizedBox(height: 16),
        // Interactive Switcher to preview any app right in the Hero phone!
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: List.generate(apps.length, (i) {
            final app = apps[i];
            final selected = i == _heroPreviewAppIndex;
            return ChoiceChip(
              avatar: Icon(
                app.appIcon,
                size: 16,
                color: selected ? Colors.white : app.accentColor,
              ),
              label: Text(
                app.name.split(' ').first,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : null,
                ),
              ),
              selected: selected,
              selectedColor: app.accentColor,
              onSelected: (_) => setState(() => _heroPreviewAppIndex = i),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStatsBar(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final stats = PortfolioData.profile.stats;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 700;
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: stats.map((stat) {
              final cardWidth = isNarrow
                  ? (constraints.maxWidth - 16) / 2
                  : (constraints.maxWidth - 48) / 4;
              return SizedBox(
                width: cardWidth.clamp(140.0, 400.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color:
                                AppTheme.primaryIndigo.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            stat.icon,
                            color: AppTheme.primaryIndigo,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stat.value,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                stat.label,
                                style: TextStyle(
                                  fontSize: 12.5,
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
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildAppsShowcaseSection(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final apps = _filteredApps;

    return Container(
      key: _appsKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.accentCyan.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'MOBILE APP PORTFOLIO',
                  style: TextStyle(
                    color: AppTheme.accentCyan,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Featured Mobile Applications',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Interactive previews, architecture breakdowns, store links, and dedicated Privacy Policy pages for every app.',
            style: TextStyle(
              fontSize: 15.5,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: 24),

          // Filter Chips
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _filters.map((filter) {
              final isSelected = _selectedFilter == filter;
              return FilterChip(
                selected: isSelected,
                label: Text(
                  filter,
                  style: TextStyle(
                    fontWeight:
                        isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
                onSelected: (_) => setState(() => _selectedFilter = filter),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),

          // App Showcase Cards
          Column(
            children: apps
                .map(
                  (app) => Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: _AppShowcaseCard(app: app),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final categories = PortfolioData.skillCategories;

    return Container(
      key: _skillsKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryIndigo.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'TECHNICAL EXPERTISE',
              style: TextStyle(
                color: AppTheme.primaryIndigo,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Flutter Ecosystem & Engineering Stack',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoCols = constraints.maxWidth >= 820;
              final cardWidth = twoCols
                  ? (constraints.maxWidth - 24) / 2
                  : constraints.maxWidth;
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: categories.map((cat) {
                  return SizedBox(
                    width: cardWidth,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color:
                                        cat.accentColor.withValues(alpha: 0.16),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Icon(
                                    cat.icon,
                                    color: cat.accentColor,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cat.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        cat.subtitle,
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                              .withValues(alpha: 0.68),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 22),
                            ...cat.skills.map(
                              (skill) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            skill.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.5,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          skill.levelLabel,
                                          style: TextStyle(
                                            color: cat.accentColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: LinearProgressIndicator(
                                        value: skill.proficiency,
                                        minHeight: 7,
                                        backgroundColor: cat.accentColor
                                            .withValues(alpha: 0.14),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          cat.accentColor,
                                        ),
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
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineSection(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final entries = PortfolioData.timeline;

    return Container(
      key: _timelineKey,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.accentEmerald.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'SOLUTIONS & FOCUS AREAS',
              style: TextStyle(
                color: AppTheme.accentEmerald,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'What IoTBangla Builds & Delivers',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 28),
          ...entries.map(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (entry.isEducation
                                      ? AppTheme.accentCyan
                                      : AppTheme.primaryIndigo)
                                  .withValues(alpha: 0.16),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              entry.icon,
                              color: entry.isEducation
                                  ? AppTheme.accentCyan
                                  : AppTheme.primaryIndigo,
                              size: 22,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              entry.period,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            entry.location,
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withValues(alpha: 0.65),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        entry.roleOrDegree,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entry.organization,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.accentCyan,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        entry.description,
                        style: TextStyle(
                          fontSize: 14.5,
                          height: 1.55,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...entry.highlights.map(
                        (bullet) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_right_rounded,
                                color: AppTheme.accentEmerald,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  bullet,
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    height: 1.45,
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactAndFooterSection(BuildContext context) {
    final hPad = ResponsiveBreakpoints.horizontalPadding(context);
    final profile = PortfolioData.profile;

    return Container(
      key: _contactKey,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(hPad, 40, hPad, 48),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.primaryIndigo.withValues(alpha: 0.2),
                  AppTheme.accentCyan.withValues(alpha: 0.12),
                ],
              ),
              border: Border.all(
                color: AppTheme.primaryIndigo.withValues(alpha: 0.35),
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.handshake_rounded,
                  size: 42,
                  color: AppTheme.accentCyan,
                ),
                const SizedBox(height: 14),
                const Text(
                  'Partner with IoTBangla',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 620),
                  child: Text(
                    'Need app support, custom Flutter mobile development, or smart IoT solutions? Reach out to the IoTBangla team.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.55,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.78),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () =>
                          launchExternalLink('mailto:${profile.email}'),
                      icon: const Icon(Icons.email_rounded, size: 18),
                      label: Text(profile.email),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () => copyTextWithToast(
                        context,
                        profile.email,
                        'Email address',
                      ),
                      icon: const Icon(Icons.copy_rounded, size: 17),
                      label: const Text('Copy Email'),
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () =>
                          launchExternalLink(profile.playStoreDevUrl),
                      icon: const Icon(Icons.shop_rounded, size: 18),
                      label: const Text('Google Play'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 36),
          const Divider(),
          const SizedBox(height: 18),
          Wrap(
            spacing: 20,
            runSpacing: 12,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '© ${DateTime.now().year} ${profile.name} • Mobile Apps & Smart Solutions',
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.65),
                ),
              ),
              Wrap(
                spacing: 12,
                children: [
                  TextButton.icon(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/privacy'),
                    icon: const Icon(Icons.privacy_tip_outlined, size: 16),
                    label: const Text('Official Privacy Policy'),
                  ),
                  TextButton.icon(
                    onPressed: () => launchExternalLink('/app-ads.txt'),
                    icon: const Icon(Icons.verified_outlined, size: 16),
                    label: const Text('app-ads.txt'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavBarButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _AppShowcaseCard extends StatelessWidget {
  final MobileAppProject app;

  const _AppShowcaseCard({required this.app});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.isMobile(context);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20 : 30),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLeftDetails(context),
                  const SizedBox(height: 28),
                  Center(
                    child: PhoneMockupFrame(
                      app: app,
                      width: 255,
                      height: 495,
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: _buildLeftDetails(context),
                  ),
                  const SizedBox(width: 36),
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: PhoneMockupFrame(
                        app: app,
                        width: 260,
                        height: 500,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildLeftDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Badges Row
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
              decoration: BoxDecoration(
                color: app.accentColor.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                app.category,
                style: TextStyle(
                  color: app.accentColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            ...app.platforms.map(
              (p) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                child: Text(
                  p,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            if (app.isOpenSource)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFA855F7).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Open Source',
                  style: TextStyle(
                    color: Color(0xFFA855F7),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // App Icon + Name + Stats
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: app.accentColor.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(app.appIcon, color: app.accentColor, size: 30),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    app.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${app.downloadsBadge}  •  ${app.version}  •  ${app.rating ?? 4.8} ★',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: app.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),

        Text(
          app.shortDescription,
          style: TextStyle(
            fontSize: 15,
            height: 1.55,
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.82),
          ),
        ),
        const SizedBox(height: 16),

        // Top 3 Feature Bullets
        ...app.keyFeatures.take(3).map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 17,
                      color: app.accentColor,
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(fontSize: 13.5, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        const SizedBox(height: 14),

        // Tech Stack Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: app.techStack
              .map(
                (t) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surface
                        .withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).dividerColor),
                  ),
                  child: Text(
                    t,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),

        // Store Buttons + Deep Link Actions
        StoreActionButtons(app: app, compact: true),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton.tonalIcon(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/app/${app.slug}'),
              icon: const Icon(Icons.open_in_new_rounded, size: 17),
              label: const Text('App Details & Screens'),
            ),
            TextButton.icon(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/app/${app.slug}/privacy'),
              icon: const Icon(Icons.privacy_tip_outlined, size: 17),
              label: const Text('Privacy Policy URL'),
            ),
          ],
        ),
      ],
    );
  }
}
