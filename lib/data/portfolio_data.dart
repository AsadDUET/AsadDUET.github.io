import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

/// ============================================================================
/// SINGLE SOURCE OF TRUTH FOR YOUR PORTFOLIO
/// ============================================================================
/// Edit this file to update your profile, social links, published mobile apps,
/// screenshots, per-app privacy policies, skills, and experience timeline.
///
/// Deep-link URLs automatically generated for each app in [mobileApps]:
/// - App Showcase Page:   `https://asadduet.github.io/#/app/<slug>`
/// - App Privacy Policy:  `https://asadduet.github.io/#/app/<slug>/privacy`
/// ============================================================================

class PortfolioData {
  static const DeveloperProfile profile = DeveloperProfile(
    name: 'Asad',
    handle: '@AsadDUET',
    roleTitle: 'Flutter & Mobile Application Developer',
    heroTagline: 'Crafting high-performance Android & iOS apps with Flutter.',
    bio:
        'Passionate Mobile Application Developer with a strong engineering background from DUET. '
        'I design, build, and publish polished cross-platform apps focused on clean architecture, '
        'smooth 60/120fps animations, offline-first reliability, and seamless user experiences.',
    aboutExtended:
        'From concept and UI/UX prototyping to production release on Google Play and Apple App Store, '
        'I specialize in building scalable Flutter applications backed by Firebase, REST/GraphQL APIs, '
        'local SQLite/Isar databases, and AdMob/In-App Purchase monetization.',
    location: 'Dhaka, Bangladesh',
    educationBadge: 'DUET (Dhaka University of Engineering & Technology)',
    availableForWork: true,
    email: 'asad.duet.dev@gmail.com', // Replace with your primary contact email
    githubUrl: 'https://github.com/AsadDUET',
    linkedInUrl: 'https://linkedin.com/in/asadduet',
    playStoreDevUrl: 'https://play.google.com/store/apps',
    appStoreDevUrl: '',
    stats: [
      StatMetric(
        value: '6+',
        label: 'Mobile Apps Built',
        icon: Icons.phone_android_rounded,
      ),
      StatMetric(
        value: '50K+',
        label: 'Total Downloads',
        icon: Icons.download_done_rounded,
      ),
      StatMetric(
        value: '4.8★',
        label: 'Avg. User Rating',
        icon: Icons.star_rounded,
      ),
      StatMetric(
        value: '99.6%',
        label: 'Crash-Free Users',
        icon: Icons.verified_user_rounded,
      ),
    ],
  );

  /// Add, remove, or reorder your mobile applications here.
  /// TIP: To use real screenshot images, drop them into `assets/apps/` and set
  /// `imageUrlOrAsset: 'assets/apps/my_screen.png'` in [AppScreenPreview].
  static const List<MobileAppProject> mobileApps = [
    MobileAppProject(
      slug: 'fintrack-wallet',
      name: 'FinTrack Expense & Budget',
      tagline: 'Smart offline-first personal finance & daily expense manager',
      shortDescription:
          'Track daily expenses, set monthly category budgets, export PDF/CSV reports, and visualize spending habits with interactive charts.',
      fullDescription:
          'FinTrack Expense & Budget is a fast, privacy-first personal finance companion built with Flutter. '
          'Designed to work 100% offline with optional encrypted cloud backup, it helps users stay on top of '
          'multi-wallet balances, recurring bills, and monthly savings goals without lag or clutter.',
      category: 'Finance & Productivity',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFF10B981),
      secondaryColor: Color(0xFF059669),
      appIcon: Icons.account_balance_wallet_rounded,
      version: 'v2.4.0',
      releaseYear: '2026',
      downloadsBadge: '25K+ Downloads',
      rating: 4.9,
      isFeatured: true,
      isOpenSource: false,
      playStoreUrl: 'https://play.google.com/store/apps',
      appStoreUrl: 'https://apps.apple.com',
      apkDownloadUrl: 'https://github.com/AsadDUET',
      keyFeatures: [
        'Multi-wallet & multi-currency tracking with instant balance updates',
        'Interactive monthly cash-flow, category pie, and trend bar charts',
        'Smart budget alerts when spending reaches 80% or 100% of limits',
        'One-tap PDF & Excel/CSV financial statement export',
        'Biometric App Lock (Fingerprint / Face ID) & dark mode support',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Drift (SQLite)',
        'fl_chart',
        'Google AdMob',
        'Firebase Backup',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Dashboard Overview',
          subtitle: 'Total Balance: \$4,820.50 • +14% vs last month',
          icon: Icons.pie_chart_rounded,
          highlights: [
            'Income: \$3,200.00  |  Spent: \$1,140.20',
            'Food & Dining (28%) • Bills & Utilities (35%)',
            'Quick + Add Transaction floating action',
          ],
        ),
        AppScreenPreview(
          title: 'Analytics & Insights',
          subtitle: '6-Month Spending & Savings Breakdown',
          icon: Icons.insights_rounded,
          highlights: [
            'Interactive bar & spline charts by category',
            'Recurring subscription detector',
            'Export custom date range to PDF / CSV',
          ],
        ),
        AppScreenPreview(
          title: 'Smart Budget Planner',
          subtitle: 'Monthly Category Limits & Alerts',
          icon: Icons.savings_rounded,
          highlights: [
            'Groceries: \$240 / \$300 (80% used)',
            'Transport: \$85 / \$150 (On track)',
            'Automated rollover for unused budget',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary:
            'FinTrack stores all financial records locally on your device by default. We do not sell or share your personal financial data with third parties.',
        dataCollected: [
          'Local database entries (transactions, categories, budgets) stored strictly on-device.',
          'Anonymous crash logs and performance diagnostics via Firebase Crashlytics.',
          'Advertising ID used by Google AdMob to display non-intrusive banner ads in the free tier.',
        ],
        permissionsUsed: [
          'Biometric / Fingerprint hardware (optional, for App Lock security).',
          'Local storage read/write (only when exporting or importing CSV/PDF backups).',
          'Notifications (optional, for daily expense logging reminders).',
        ],
        thirdPartyServices: [
          'Google AdMob (Ad serving & measurement)',
          'Google Play Services',
          'Firebase Crashlytics (Crash reporting)',
        ],
        dataRetentionAndDeletion:
            'All local data can be wiped anytime via Settings → Reset Data or by uninstalling the app. Optional cloud backups can be permanently deleted from the Cloud Sync screen.',
        supportEmail: 'asad.duet.dev@gmail.com',
      ),
    ),
    MobileAppProject(
      slug: 'duet-campus-companion',
      name: 'CampusMate DUET',
      tagline: 'All-in-one academic schedule, CGPA calculator & campus utility',
      shortDescription:
          'Built for engineering students with class routines, lab schedules, CGPA/SGPA calculator, faculty directory, and real-time notice alerts.',
      fullDescription:
          'CampusMate DUET streamlines daily academic life for students by bringing class routines, exam countdowns, '
          'automated CGPA calculations, bus schedules, and department notices into a single fast mobile experience.',
      category: 'Education & Utility',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFF6366F1),
      secondaryColor: Color(0xFF4F46E5),
      appIcon: Icons.school_rounded,
      version: 'v1.8.2',
      releaseYear: '2026',
      downloadsBadge: '12K+ Downloads',
      rating: 4.8,
      isFeatured: true,
      isOpenSource: true,
      playStoreUrl: 'https://play.google.com/store/apps',
      githubUrl: 'https://github.com/AsadDUET',
      apkDownloadUrl: 'https://github.com/AsadDUET',
      keyFeatures: [
        'Department & semester-wise automated class & lab routine with countdown',
        'Accurate credit-weighted SGPA & CGPA calculator with semester history',
        'Instant push notifications for academic notices and exam schedules',
        'Offline faculty & emergency contact directory with 1-tap call/email',
        'Campus transport schedule and academic calendar viewer',
      ],
      techStack: [
        'Flutter',
        'Bloc / Cubit',
        'Firebase Cloud Messaging',
        'Cloud Firestore',
        'Hive Local Cache',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Today\'s Class Routine',
          subtitle: 'CSE-4103 • Software Engineering (Room 304)',
          icon: Icons.schedule_rounded,
          highlights: [
            'Next Class in 25 mins • Lab 2 at 02:30 PM',
            'Automatic silent-mode reminder before class',
            'Works 100% offline with cached timetable',
          ],
        ),
        AppScreenPreview(
          title: 'CGPA & SGPA Calculator',
          subtitle: 'Cumulative GPA: 3.78 / 4.00',
          icon: Icons.calculate_rounded,
          highlights: [
            'Pre-loaded course credit hours by department',
            'Target GPA simulator for upcoming semesters',
            'Save and compare semester wise grade sheets',
          ],
        ),
        AppScreenPreview(
          title: 'Live Notice Board',
          subtitle: 'Academic, Exam & Hall Announcements',
          icon: Icons.campaign_rounded,
          highlights: [
            'Built-in PDF notice viewer & offline download',
            'Filter by Department, Hall, or Controller',
            'Instant push alerts for urgent updates',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary:
            'CampusMate DUET only stores your selected department, semester, and saved GPA calculations on your device to personalize your schedule.',
        dataCollected: [
          'Selected department and semester preference (stored locally).',
          'Firebase Cloud Messaging token for delivering academic notice notifications.',
        ],
        permissionsUsed: [
          'Internet Access (to sync latest notices and routine updates).',
          'Post Notifications (to alert you before classes and new notices).',
        ],
        thirdPartyServices: [
          'Firebase Cloud Messaging (Push notifications)',
          'Firebase Firestore (Public academic routines & notices)',
        ],
        dataRetentionAndDeletion:
            'No personal account is required. Clearing app storage or uninstalling the application immediately removes all locally saved GPA records and preferences.',
        supportEmail: 'asad.duet.dev@gmail.com',
      ),
    ),
    MobileAppProject(
      slug: 'snapscan-doc-pdf',
      name: 'SnapScan OCR & PDF Studio',
      tagline: 'AI-powered document scanner, OCR text extractor & PDF toolkit',
      shortDescription:
          'Scan receipts, notes, and ID cards with automatic edge detection, on-device OCR text recognition, digital signatures, and PDF compression.',
      fullDescription:
          'SnapScan turns your phone camera into a portable document studio. Powered by on-device ML Kit edge '
          'detection and text recognition, it processes documents privately on your phone without uploading sensitive '
          'files to external servers.',
      category: 'Tools & Productivity',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFF06B6D4),
      secondaryColor: Color(0xFF0891B2),
      appIcon: Icons.document_scanner_rounded,
      version: 'v3.1.0',
      releaseYear: '2026',
      downloadsBadge: '15K+ Downloads',
      rating: 4.7,
      isFeatured: true,
      isOpenSource: false,
      playStoreUrl: 'https://play.google.com/store/apps',
      appStoreUrl: 'https://apps.apple.com',
      keyFeatures: [
        'Smart auto-shutter with perspective crop and magic color filters',
        'On-device OCR text extraction supporting 50+ languages',
        'Merge, reorder, password-protect, and compress multi-page PDFs',
        'Draw or import digital signatures directly onto PDF pages',
        '100% on-device processing for complete document privacy',
      ],
      techStack: [
        'Flutter',
        'Google ML Kit',
        'Riverpod',
        'Custom Painter',
        'Native Camera API',
        'Google AdMob',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Smart Auto-Edge Scanner',
          subtitle: 'Real-time perspective correction & glare removal',
          icon: Icons.crop_free_rounded,
          highlights: [
            'Auto-detects document corners in <150ms',
            'Magic B&W, Grayscale, and Color Enhance filters',
            'Batch scan mode for multi-page booklets',
          ],
        ),
        AppScreenPreview(
          title: 'On-Device OCR Studio',
          subtitle: 'Extract, edit & copy text from any scan',
          icon: Icons.text_fields_rounded,
          highlights: [
            'Zero internet required — runs on ML Kit',
            'One-tap copy, translate, or export as .TXT / .DOCX',
            'Searchable PDF generation',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary:
            'SnapScan processes all scanned images, PDFs, and OCR text strictly on your device. Your documents are never uploaded to our servers.',
        dataCollected: [
          'Scanned images and PDFs are stored exclusively in your device\'s local storage.',
          'Anonymous crash reports and ad impression metrics via Google AdMob.',
        ],
        permissionsUsed: [
          'Camera (required to capture document scans).',
          'Photo Library / Media (optional, to import existing images for PDF conversion).',
        ],
        thirdPartyServices: [
          'Google ML Kit (On-device document & OCR recognition)',
          'Google AdMob (Advertising)',
        ],
        dataRetentionAndDeletion:
            'Deleting a document inside the app or uninstalling the app permanently deletes the files from local app storage.',
        supportEmail: 'asad.duet.dev@gmail.com',
      ),
    ),
    MobileAppProject(
      slug: 'nur-prayer-companion',
      name: 'Nur — Prayer, Qibla & Dhikr',
      tagline: 'Ad-free accurate prayer times, Qibla compass & daily adhkar',
      shortDescription:
          'Location-aware salah times with customizable calculation methods, smooth sensor Qibla compass, Ramadan tracker, and daily Hisnul Muslim adhkar.',
      fullDescription:
          'Nur is a clean, distraction-free Islamic utility app crafted with Flutter. It calculates accurate '
          'prayer timings offline using astronomical coordinates, features a calibrated magnetometer Qibla compass, '
          'and provides audio recitations and daily dhikr counters.',
      category: 'Lifestyle & Utility',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFFF59E0B),
      secondaryColor: Color(0xFFD97706),
      appIcon: Icons.explore_rounded,
      version: 'v1.5.0',
      releaseYear: '2025',
      downloadsBadge: '8K+ Downloads',
      rating: 4.9,
      isFeatured: false,
      isOpenSource: true,
      playStoreUrl: 'https://play.google.com/store/apps',
      githubUrl: 'https://github.com/AsadDUET',
      keyFeatures: [
        'Offline astronomical prayer time calculation (Karachi, ISNA, MWL, Umm al-Qura)',
        'Real-time Qibla direction compass with magnetic interference indicator',
        'Morning & Evening Adhkar with Arabic typography, transliteration, and translation',
        'Interactive Tasbih counter with haptic feedback and daily streak goals',
        'Home screen widgets and customizable Adhan notifications',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Local Notifications',
        'Geolocator & Sensors',
        'SharedPreferences',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Prayer Timings & Countdown',
          subtitle: 'Asr in 01h 18m • Dhaka, Bangladesh',
          icon: Icons.access_time_filled_rounded,
          highlights: [
            'Fajr 04:52 • Dhuhr 11:58 • Asr 15:22 • Maghrib 17:48',
            'Custom Adhan audio & pre-prayer reminders',
            'Hijri calendar & fasting days indicator',
          ],
        ),
        AppScreenPreview(
          title: 'Precision Qibla Compass',
          subtitle: '277.6° WNW • Distance to Makkah: 5,172 km',
          icon: Icons.compass_calibration_rounded,
          highlights: [
            'Haptic feedback when aligned with Kaaba',
            'Sensor accuracy status & calibration guide',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary:
            'Nur is 100% free and contains no advertisements or trackers. Location coordinates are used solely on your device to compute accurate prayer times and Qibla angle.',
        dataCollected: [
          'Approximate or precise GPS coordinates (stored locally on your device only for prayer calculation).',
        ],
        permissionsUsed: [
          'Location (used only when calculating prayer times or Qibla direction).',
          'Notifications & Exact Alarms (to trigger timely Adhan notifications).',
        ],
        thirdPartyServices: [
          'No third-party advertising or analytics SDKs are included.',
        ],
        dataRetentionAndDeletion:
            'All data stays on your device and is removed immediately upon uninstalling the app.',
        supportEmail: 'asad.duet.dev@gmail.com',
      ),
    ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Mobile & Cross-Platform',
      subtitle: 'Pixel-perfect UI, custom animations & native performance',
      icon: Icons.phone_iphone_rounded,
      accentColor: Color(0xFF6366F1),
      skills: [
        SkillItem(
          name: 'Flutter & Dart',
          levelLabel: 'Expert',
          proficiency: 0.96,
        ),
        SkillItem(
          name: 'Material 3 & Cupertino UI',
          levelLabel: 'Expert',
          proficiency: 0.94,
        ),
        SkillItem(
          name: 'Custom Animations & Painters',
          levelLabel: 'Advanced',
          proficiency: 0.88,
        ),
        SkillItem(
          name: 'Android Native (Kotlin) & Platform Channels',
          levelLabel: 'Proficient',
          proficiency: 0.80,
        ),
      ],
    ),
    SkillCategory(
      title: 'Architecture & State Management',
      subtitle: 'Scalable, testable & maintainable app foundations',
      icon: Icons.account_tree_rounded,
      accentColor: Color(0xFF06B6D4),
      skills: [
        SkillItem(
          name: 'Riverpod & Provider',
          levelLabel: 'Expert',
          proficiency: 0.95,
        ),
        SkillItem(
          name: 'BLoC / Cubit Architecture',
          levelLabel: 'Advanced',
          proficiency: 0.90,
        ),
        SkillItem(
          name: 'Clean Architecture & MVVM',
          levelLabel: 'Expert',
          proficiency: 0.92,
        ),
        SkillItem(
          name: 'GoRouter & Deep Linking',
          levelLabel: 'Advanced',
          proficiency: 0.89,
        ),
      ],
    ),
    SkillCategory(
      title: 'Backend, Data & Monetization',
      subtitle: 'Cloud sync, offline databases & sustainable app revenue',
      icon: Icons.cloud_done_rounded,
      accentColor: Color(0xFF10B981),
      skills: [
        SkillItem(
          name: 'Firebase (Auth, Firestore, FCM, Crashlytics)',
          levelLabel: 'Expert',
          proficiency: 0.94,
        ),
        SkillItem(
          name: 'REST APIs, Dio & GraphQL',
          levelLabel: 'Expert',
          proficiency: 0.93,
        ),
        SkillItem(
          name: 'SQLite (Drift), Hive & Isar Offline DB',
          levelLabel: 'Advanced',
          proficiency: 0.91,
        ),
        SkillItem(
          name: 'Google AdMob & In-App Purchases',
          levelLabel: 'Expert',
          proficiency: 0.92,
        ),
      ],
    ),
    SkillCategory(
      title: 'Release, Testing & DevOps',
      subtitle: 'Store publishing, CI/CD pipelines & quality assurance',
      icon: Icons.rocket_launch_rounded,
      accentColor: Color(0xFFF59E0B),
      skills: [
        SkillItem(
          name: 'Google Play Console & App Store Connect',
          levelLabel: 'Expert',
          proficiency: 0.95,
        ),
        SkillItem(
          name: 'Git, GitHub Actions & Fastlane CI/CD',
          levelLabel: 'Advanced',
          proficiency: 0.88,
        ),
        SkillItem(
          name: 'Unit, Widget & Integration Testing',
          levelLabel: 'Advanced',
          proficiency: 0.85,
        ),
        SkillItem(
          name: 'Figma to Flutter UI Implementation',
          levelLabel: 'Expert',
          proficiency: 0.93,
        ),
      ],
    ),
  ];

  static const List<TimelineEntry> timeline = [
    TimelineEntry(
      period: '2024 — Present',
      roleOrDegree: 'Independent Mobile App Developer & Publisher',
      organization: 'Google Play & Cross-Platform Ecosystem',
      location: 'Dhaka, Bangladesh',
      description:
          'Architecting, shipping, and maintaining consumer mobile applications with Flutter, focusing on offline-first reliability, modern Material 3 interfaces, and AdMob monetization.',
      highlights: [
        'Published multiple production apps serving thousands of active monthly users.',
        'Engineered reusable modular kits for onboarding, local database sync, and in-app analytics.',
        'Maintained >99.5% crash-free session rates via proactive Crashlytics monitoring and automated testing.',
      ],
      icon: Icons.developer_mode_rounded,
    ),
    TimelineEntry(
      period: '2022 — Present',
      roleOrDegree: 'Flutter Software Engineer (Projects & Freelance)',
      organization: 'Client & Open-Source Mobile Solutions',
      location: 'Remote',
      description:
          'Collaborated with startups and academic teams to deliver end-to-end Android, iOS, and Web applications from Figma designs to store deployment.',
      highlights: [
        'Built real-time notification, OCR scanning, and financial charting modules.',
        'Reduced app startup times and frame rasterization jank across budget Android devices.',
      ],
      icon: Icons.code_rounded,
    ),
    TimelineEntry(
      period: 'Engineering Studies',
      roleOrDegree: 'B.Sc. in Engineering',
      organization: 'Dhaka University of Engineering & Technology (DUET)',
      location: 'Gazipur, Bangladesh',
      description:
          'Strong foundation in algorithms, data structures, software engineering, database systems, and problem-solving.',
      highlights: [
        'Developed campus utility tools and technical projects for fellow DUETians.',
        'Active participant in software engineering projects, mobile app development, and competitive programming.',
      ],
      icon: Icons.school_rounded,
      isEducation: true,
    ),
  ];
}
