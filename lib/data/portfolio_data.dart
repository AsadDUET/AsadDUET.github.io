import 'package:flutter/material.dart';

import '../models/portfolio_models.dart';

/// ============================================================================
/// SINGLE SOURCE OF TRUTH FOR IOTBANGLA PORTFOLIO
/// ============================================================================
/// Edit this file to update IoTBangla company details, social links, published
/// mobile apps, screenshots, per-app privacy policies, capabilities, and milestones.
///
/// Deep-link URLs automatically generated for each app in [mobileApps]:
/// - App Showcase Page:   `https://asadduet.github.io/#/app/<slug>`
/// - App Privacy Policy:  `https://asadduet.github.io/#/app/<slug>/privacy`
/// ============================================================================

class PortfolioData {
  static const DeveloperProfile profile = DeveloperProfile(
    name: 'IoTBangla',
    handle: 'IoTBangla',
    roleTitle: 'Mobile Apps & Smart Solutions Studio',
    heroTagline: 'Crafting high-performance Android, iOS & smart connected applications with Flutter.',
    bio:
        'IoTBangla is a mobile application and smart technology studio dedicated to designing, building, '
        'and publishing polished cross-platform apps. We focus on clean architecture, smooth 60/120fps interfaces, '
        'offline-first reliability, and intuitive user experiences.',
    aboutExtended:
        'From product concept and UI/UX prototyping to production release on Google Play and the Apple App Store, '
        'IoTBangla delivers scalable Flutter applications backed by Firebase, cloud APIs, local SQLite/Isar databases, '
        'IoT device connectivity, and sustainable AdMob / In-App Purchase monetization.',
    location: 'Dhaka, Bangladesh',
    educationBadge: 'Flutter • Android • iOS • IoT',
    availableForWork: true,
    email: 'support@iotbangla.com', // Update with your official IoTBangla support email
    githubUrl: 'https://github.com/AsadDUET',
    linkedInUrl: 'https://linkedin.com',
    playStoreDevUrl: 'https://play.google.com/store/apps',
    appStoreDevUrl: '',
    stats: [
      StatMetric(
        value: '6+',
        label: 'Mobile Apps Published',
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
        label: 'Crash-Free Sessions',
        icon: Icons.verified_user_rounded,
      ),
    ],
  );

  /// Add, remove, or reorder IoTBangla mobile applications here.
  /// TIP: To use real screenshot images, drop them into `assets/apps/` and set
  /// `imageUrlOrAsset: 'assets/apps/my_screen.png'` in [AppScreenPreview].
  static const List<MobileAppProject> mobileApps = [
    MobileAppProject(
      slug: 'geojatra-geometry',
      name: 'GeoJatra (জ্যামিতি যাত্রা)',
      tagline: 'Interactive bilingual geometry learning & dynamic GeoPad drawing sandbox',
      shortDescription: 'Master Class 6–10 geometry theorems, constructions, and concepts in Bangla & English with an interactive constraint-based drawing board, step-by-step visual lessons, and gamified quizzes.',
      fullDescription:
          'GeoJatra (জ্যামিতি যাত্রা) is an interactive, offline-first educational geometry companion by IoTBangla designed for middle and high school students (Classes 6 to 10). '
          'Combining a full-featured geometric construction sandbox (GeoPad) with bilingual (Bangla & English) visual lessons, theorem proofs, and topic-end quizzes, '
          'it transforms abstract textbook geometry into hands-on visual discovery with XP leveling and daily study streaks.',
      category: 'Education & Reference',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFF0D9488),
      secondaryColor: Color(0xFF1E3A8A),
      appIcon: Icons.architecture_rounded,
      version: 'v1.0.0',
      releaseYear: '2026',
      downloadsBadge: '10K+ Downloads',
      rating: 4.9,
      isFeatured: true,
      isOpenSource: false,
      playStoreUrl: 'https://play.google.com/store/apps',
      appStoreUrl: 'https://apps.apple.com',
      apkDownloadUrl: '',
      keyFeatures: [
        'Class-wise (Class 6 to 9–10) & Topic-wise structured geometry curriculum (Lines, Angles, Triangles, Quadrilaterals, Circles)',
        'Interactive GeoPad Sandbox with 20+ geometric tools (Compass, Protractor, Parallel/Perpendicular, Midpoint, Intersection & live constraints)',
        'Seamless one-tap Bilingual switching between Bangla (বাংলা) and English with Noto Sans Bengali typography',
        'Gamified learning progression with XP levels, daily streaks, perfection bonuses, and detailed XP history',
        'Interactive step-by-step animated theorem explanations, drawing verification, and topic-end mastery quizzes',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'CustomPainter (2D Geometry Engine)',
        'SharedPreferences',
        'AudioPlayers',
        'Google Mobile Ads (COPPA Compliant)',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Learning Dashboard & Progress',
          subtitle: 'Level 5 • 450 XP • 7 Streak Days',
          icon: Icons.school_rounded,
          highlights: [
            'Class-wise (Class 6–10) & Topic-wise curriculum switcher',
            'Live XP progress bar, streak tracker & XP breakdown modal',
            'Instant Bangla / English language toggle & adaptive dark mode',
          ],
        ),
        AppScreenPreview(
          title: 'GeoPad Interactive Sandbox',
          subtitle: 'Dynamic 2D Geometry Board & Constraint Solver',
          icon: Icons.architecture_rounded,
          highlights: [
            'Draw points, segments, rays, polygons, circles & angle markers',
            'Apply geometric constraints: parallel, perpendicular, fixed length & angle',
            'Pinch-to-zoom canvas, grid snapping & daily practice XP rewards',
          ],
        ),
        AppScreenPreview(
          title: 'Interactive Lessons & Quizzes',
          subtitle: 'Visual Theorems, Constructions & Topic-End Tests',
          icon: Icons.quiz_rounded,
          highlights: [
            'Step-by-step animated geometric proofs & guided constructions',
            'Hands-on drawing verification with real-time feedback',
            'Topic-end quizzes with +50 XP perfection bonuses',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary: 'GeoJatra by IoTBangla stores all learning progress, XP history, and sandbox creations locally on your device. We are committed to student privacy and configure all ads to be child-safe (COPPA / G-rated compliant).',
        dataCollected: [
          'Local learning progress (XP, levels, daily streaks, completed lessons, and quiz scores) stored strictly on-device via SharedPreferences.',
          'Child-directed, non-personalized ad request metadata used by Google AdMob (configured with tagForChildDirectedTreatment & MaxAdContentRating.g).',
        ],
        permissionsUsed: [
          'Internet & Network State (used solely for loading child-safe educational banner and frequency-capped interstitial ads).',
          'Local storage (for saving offline lesson progress, language preference, and XP transaction logs).',
        ],
        thirdPartyServices: [
          'Google AdMob (COPPA-compliant, G-rated ad serving)',
          'Google Fonts (Noto Sans Bengali typography)',
          'Google Play Services',
        ],
        dataRetentionAndDeletion: 'All local learning progress, XP history, and streaks can be permanently wiped at any time directly inside the app via the Profile Stats sheet → Reset Progress button, or by uninstalling the app.',
        supportEmail: 'support@iotbangla.com',
      ),
    ),
    MobileAppProject(
      slug: 'bachelor-point-mess-manager',
      name: 'Bachelor Point: Mess & To-Let',
      tagline: 'Smart shared-living, real-time mess ledger & bachelor rental companion',
      shortDescription: 'Manage daily mess meal counts, deposits, grocery expenses, and automatic meal rates alongside an interactive map-based To-Let finder and bachelor utility tools.',
      fullDescription:
          'Bachelor Point is an all-in-one shared-living and mess management companion by IoTBangla. '
          'Built with real-time cloud sync, it eliminates end-of-month calculation headaches by automating weighted meal tracking, '
          'grocery ledgers, member deposits, and live meal-rate calculations—while also offering an interactive To-Let housing marketplace, '
          'in-app inquiry chat, QR member invites, and instant bill-splitting tools.',
      category: 'Lifestyle & Finance',
      platforms: ['Android', 'iOS', 'Web'],
      accentColor: Color(0xFF4F46E5),
      secondaryColor: Color(0xFF10B981),
      appIcon: Icons.apartment_rounded,
      version: 'v1.0.0',
      releaseYear: '2026',
      downloadsBadge: '10K+ Downloads',
      rating: 4.8,
      isFeatured: true,
      isOpenSource: false,
      playStoreUrl: 'https://play.google.com/store/apps',
      appStoreUrl: 'https://apps.apple.com',
      apkDownloadUrl: '',
      keyFeatures: [
        'Real-time mess ledger with automated meal rate, grocery expenses & member deposit tracking',
        'Weighted daily meal planner (Breakfast, Lunch, Dinner) with cutoff deadlines & manager controls',
        'QR Code mess invitation & instant scanner for seamless member onboarding',
        'Interactive To-Let & bachelor rental finder with map view, photo uploads & real-time in-app chat',
        'Built-in bachelor utilities: Quick Bill Split calculator & Fair Chore Roster rotation',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'GoRouter',
        'Firebase Auth & Firestore',
        'Flutter Map',
        'Google AdMob',
      ],
      screenPreviews: [
        AppScreenPreview(
          imageUrlOrAsset: 'apps/bachelor1.jpg',
          title: 'Mess Dashboard & Ledger',
          subtitle: 'Mess Balance: ৳4,250 • Meal Rate: ৳62.50',
          icon: Icons.restaurant_menu_rounded,
          highlights: [
            'Total Deposits: ৳18,500  |  Groceries: ৳14,250',
            'Today\'s Cooking Total: 8 Breakfast • 12 Lunch • 12 Dinner',
            'Personal meal count, spent summary & QR invite code',
          ],
        ),
        AppScreenPreview(
          imageUrlOrAsset: 'apps/bachelor2.jpg',
          title: 'To-Let & Rental Finder',
          subtitle: 'Browse Seats, Single Rooms & Sublets on Map',
          icon: Icons.holiday_village_rounded,
          highlights: [
            'Filter by Seat, Single Room, Master Bed, Sublet & Full Flat',
            'Interactive OpenStreetMap view with exact location pins',
            'Direct in-app inquiry chat with property posters',
          ],
        ),
        AppScreenPreview(
          title: 'Bachelor Utility Hub',
          subtitle: 'No-Login Instant Tools for Shared Living',
          icon: Icons.build_circle_rounded,
          highlights: [
            'Quick Split: Split dinner, snacks & utility bills per head',
            'Chore Roster: Automated cooking & cleaning duty rotation',
            'Multi-mess switching & role-based manager permissions',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary: 'Bachelor Point by IoTBangla securely synchronizes your mess ledger and To-Let listings via Google Firebase. You retain full control over your account and personal data at all times.',
        dataCollected: [
          'Account profile details (name, email, optional phone number) via Firebase Authentication.',
          'Mess ledger entries (meal counts, grocery expenses, deposits) and To-Let posts/messages stored in Cloud Firestore & Firebase Storage.',
          'Anonymous crash reports, usage analytics, and Advertising ID via Firebase Crashlytics, Analytics, and Google AdMob.',
        ],
        permissionsUsed: [
          'Camera (optional, for scanning Mess QR invitation codes and capturing To-Let property photos).',
          'Photo Library / Storage (optional, for uploading rental listing images).',
          'Internet access (for real-time mess synchronization, To-Let map tiles, and chat messaging).',
        ],
        thirdPartyServices: [
          'Google Firebase (Authentication, Cloud Firestore, Storage, Analytics, Crashlytics)',
          'Google AdMob (Banner & interstitial ad serving)',
          'OpenStreetMap / Flutter Map (Interactive rental map view)',
        ],
        dataRetentionAndDeletion: 'Users can permanently delete their account and associated personal data anytime directly inside the app via Profile → Delete Account, or by contacting support.',
        supportEmail: 'support@iotbangla.com',
      ),
    ),
    MobileAppProject(
      slug: 'prepaid-meter-bd',
      name: 'Prepaid Meter BD',
      tagline: 'Smart electricity prepaid meter balance checker, usage analytics & power news for Bangladesh',
      shortDescription: 'Check DESCO and NESCO prepaid meter balances with one tap, auto-fill customer IDs, track daily burn rate & remaining days, and read live electricity news in Bangla & English.',
      fullDescription:
          'Prepaid Meter BD is a convenient utility companion by IoTBangla designed for electricity consumers across Bangladesh (supporting DESCO and NESCO regions). '
          'Save your meter/account numbers once for automatic portal injection, extract live balance and recharge history on demand, forecast when your balance will run out with interactive charts, and stay informed with real-time Bangladesh power sector news.',
      category: 'Utilities & Productivity',
      platforms: ['Android', 'iOS'],
      accentColor: Color(0xFF009688),
      secondaryColor: Color(0xFF00796B),
      appIcon: Icons.electric_meter_rounded,
      version: 'v3.0.0',
      releaseYear: '2026',
      downloadsBadge: '10K+ Downloads',
      rating: 4.8,
      isFeatured: true,
      isOpenSource: false,
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.asadduet.prepaid_meter',
      appStoreUrl: 'https://apps.apple.com',
      apkDownloadUrl: '',
      keyFeatures: [
        'One-tap access to DESCO & NESCO prepaid portals with saved Account/Meter IDs',
        'Smart JavaScript auto-fill for instant customer number entry on utility portals',
        'On-demand NESCO analytics: live balance extraction, daily burn rate (৳/day), and estimated depletion date',
        'Interactive 3-tab usage analytics (Daily Balance Trend, Recharge History & Token Copy, Monthly kWh Consumption)',
        'Bilingual (Bangla & English) live Bangladesh electricity news feed with automatic XML/JSON fallback',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Provider',
        'WebView Flutter (JS Injection)',
        'SharedPreferences',
        'HTTP & XML (RSS Parser)',
        'Google AdMob',
        'Firebase Analytics & Crashlytics',
      ],
      screenPreviews: [
        AppScreenPreview(
          title: 'Prepaid Electricity Vendors',
          subtitle: 'DESCO & NESCO Quick Portal Access',
          icon: Icons.flash_on_rounded,
          highlights: [
            'Saved Account IDs for DESCO (Dhaka) & NESCO (Rajshahi/Rangpur)',
            'Auto-injects Customer/Meter No directly into portal input fields',
            'Quick Edit ID dialog & external browser fallback for SSL issues',
          ],
        ),
        AppScreenPreview(
          title: 'NESCO Usage Analytics',
          subtitle: 'Balance: ৳485.50 • ~12 Days Remaining',
          icon: Icons.bar_chart_rounded,
          highlights: [
            'Avg. Daily Burn Rate (৳/day) & Estimated Depletion Date badge',
            'Custom-painted Balance Trend, Recharge History & Monthly kWh charts',
            'One-tap 20-digit Recharge Token copy & manual balance logging',
          ],
        ),
        AppScreenPreview(
          title: 'Electricity News Feed',
          subtitle: 'বিদ্যুৎ খবর • Live Bangla & English Updates',
          icon: Icons.newspaper_rounded,
          highlights: [
            'Instant language toggle between বাংলা (Bangla) and English',
            'Real-time Google News RSS feed on Bangladesh power & utilities',
            'Dual-engine fetcher (RSS2JSON API + direct XML fallback)',
          ],
        ),
      ],
      privacyPolicy: AppPrivacyPolicy(
        lastUpdated: 'October 2026',
        summary: 'Prepaid Meter BD by IoTBangla stores your saved meter/account IDs and extracted balance history strictly on your device. We never transmit or store your utility credentials on external servers.',
        dataCollected: [
          'Saved DESCO/NESCO Account & Meter numbers and local balance/recharge logs stored strictly on-device via SharedPreferences.',
          'Anonymous usage statistics and crash diagnostics via Firebase Analytics and Firebase Crashlytics.',
          'Advertising ID used by Google AdMob to serve banner and interstitial ads.',
        ],
        permissionsUsed: [
          'Internet & Network State (to load official DESCO/NESCO portals, fetch RSS news feeds, and load ads).',
          'Local device storage via SharedPreferences (to remember your meter numbers and offline analytics history).',
        ],
        thirdPartyServices: [
          'Google AdMob (Ad serving & measurement)',
          'Google Play Services',
          'Firebase Analytics & Crashlytics (App stability & diagnostics)',
          'Official DESCO & NESCO Customer Web Portals',
        ],
        dataRetentionAndDeletion: 'All saved meter IDs and daily balance records are stored locally on your device and can be edited or deleted anytime from within the app, or wiped completely by clearing app storage / uninstalling the app.',
        supportEmail: 'support@iotbangla.com',
      ),
    ),
    // MobileAppProject(
    //   slug: 'iotbangla-smart-connect',
    //   name: 'IoTBangla Smart Connect',
    //   tagline:
    //       'Real-time IoT device controller, sensor monitor & automation hub',
    //   shortDescription: 'Monitor smart sensors, control Wi-Fi/BLE switches, schedule automated routines, and receive instant threshold alerts from anywhere.',
    //   fullDescription:
    //       'IoTBangla Smart Connect brings seamless hardware-to-mobile control to Android and iOS. '
    //       'Supporting MQTT, WebSockets, Bluetooth Low Energy (BLE), and REST webhooks, it enables real-time telemetry '
    //       'dashboards, smart relay switching, energy tracking, and custom automation rules.',
    //   category: 'IoT & Smart Devices',
    //   platforms: ['Android', 'iOS'],
    //   accentColor: Color(0xFF6366F1),
    //   secondaryColor: Color(0xFF4F46E5),
    //   appIcon: Icons.memory_rounded,
    //   version: 'v2.1.0',
    //   releaseYear: '2026',
    //   downloadsBadge: '15K+ Downloads',
    //   rating: 4.8,
    //   isFeatured: true,
    //   isOpenSource: false,
    //   playStoreUrl: 'https://play.google.com/store/apps',
    //   appStoreUrl: 'https://apps.apple.com',
    //   keyFeatures: [
    //     'Low-latency MQTT & WebSocket device control with live state sync',
    //     'Bluetooth Low Energy (BLE) one-tap Wi-Fi provisioning for new nodes',
    //     'Live temperature, humidity, voltage, and power consumption telemetry charts',
    //     'Custom IF/THEN automation schedules and push notification alerts',
    //     'Offline local-network fallback control via mDNS / HTTP',
    //   ],
    //   techStack: [
    //     'Flutter',
    //     'Bloc / Cubit',
    //     'MQTT & WebSockets',
    //     'Flutter Blue Plus (BLE)',
    //     'Firebase Cloud Messaging',
    //     'Hive Local Cache',
    //   ],
    //   screenPreviews: [
    //     AppScreenPreview(
    //       title: 'Smart Device Hub',
    //       subtitle: '8 Devices Online • Living Room & Lab',
    //       icon: Icons.router_rounded,
    //       highlights: [
    //         'Smart Relay Node #1: ON (42W Active)',
    //         'Env Sensor: 26.4°C • 58% RH',
    //         'Instant local & cloud toggle switches',
    //       ],
    //     ),
    //     AppScreenPreview(
    //       title: 'Energy & Sensor Telemetry',
    //       subtitle: 'Real-Time kWh & Sensor History',
    //       icon: Icons.bolt_rounded,
    //       highlights: [
    //         'Live streaming sensor graphs (1s interval)',
    //         'Daily & monthly power consumption reports',
    //         'Threshold alert notifications via FCM',
    //       ],
    //     ),
    //     AppScreenPreview(
    //       title: 'Automation & Schedules',
    //       subtitle: 'Smart Timers & Sensor Triggers',
    //       icon: Icons.auto_mode_rounded,
    //       highlights: [
    //         'Auto turn off AC when room < 24°C',
    //         'Sunset / Sunrise outdoor lighting timers',
    //         'One-tap Scene execution from home screen',
    //       ],
    //     ),
    //   ],
    //   privacyPolicy: AppPrivacyPolicy(
    //     lastUpdated: 'October 2026',
    //     summary: 'IoTBangla Smart Connect uses network and Bluetooth permissions strictly to discover, provision, and communicate with your authorized smart devices.',
    //     dataCollected: [
    //       'Device identifiers, sensor telemetry, and automation rules configured by the user.',
    //       'Firebase Cloud Messaging token for delivering real-time sensor alert notifications.',
    //     ],
    //     permissionsUsed: [
    //       'Bluetooth / Nearby Devices (used only during BLE device pairing and local control).',
    //       'Location (required by Android OS solely for Wi-Fi SSID & BLE scanning during setup).',
    //       'Post Notifications (to alert you when sensor thresholds are triggered).',
    //     ],
    //     thirdPartyServices: [
    //       'Firebase Cloud Messaging (Push notifications)',
    //       'Firebase Crashlytics (Stability monitoring)',
    //     ],
    //     dataRetentionAndDeletion: 'Users can unpair devices or delete their account and all associated cloud telemetry data directly from Settings → Account → Delete Data.',
    //     supportEmail: 'support@iotbangla.com',
    //   ),
    // ),
    // MobileAppProject(
    //   slug: 'snapscan-doc-pdf',
    //   name: 'SnapScan OCR & PDF Studio',
    //   tagline: 'AI-powered document scanner, OCR text extractor & PDF toolkit',
    //   shortDescription: 'Scan receipts, notes, and ID cards with automatic edge detection, on-device OCR text recognition, digital signatures, and PDF compression.',
    //   fullDescription:
    //       'SnapScan by IoTBangla turns your phone camera into a portable document studio. Powered by on-device ML Kit edge '
    //       'detection and text recognition, it processes documents privately on your phone without uploading sensitive '
    //       'files to external servers.',
    //   category: 'Tools & Productivity',
    //   platforms: ['Android', 'iOS'],
    //   accentColor: Color(0xFF06B6D4),
    //   secondaryColor: Color(0xFF0891B2),
    //   appIcon: Icons.document_scanner_rounded,
    //   version: 'v3.1.0',
    //   releaseYear: '2026',
    //   downloadsBadge: '15K+ Downloads',
    //   rating: 4.7,
    //   isFeatured: true,
    //   isOpenSource: false,
    //   playStoreUrl: 'https://play.google.com/store/apps',
    //   appStoreUrl: 'https://apps.apple.com',
    //   keyFeatures: [
    //     'Smart auto-shutter with perspective crop and magic color filters',
    //     'On-device OCR text extraction supporting 50+ languages',
    //     'Merge, reorder, password-protect, and compress multi-page PDFs',
    //     'Draw or import digital signatures directly onto PDF pages',
    //     '100% on-device processing for complete document privacy',
    //   ],
    //   techStack: [
    //     'Flutter',
    //     'Google ML Kit',
    //     'Riverpod',
    //     'Custom Painter',
    //     'Native Camera API',
    //     'Google AdMob',
    //   ],
    //   screenPreviews: [
    //     AppScreenPreview(
    //       title: 'Smart Auto-Edge Scanner',
    //       subtitle: 'Real-time perspective correction & glare removal',
    //       icon: Icons.crop_free_rounded,
    //       highlights: [
    //         'Auto-detects document corners in <150ms',
    //         'Magic B&W, Grayscale, and Color Enhance filters',
    //         'Batch scan mode for multi-page booklets',
    //       ],
    //     ),
    //     AppScreenPreview(
    //       title: 'On-Device OCR Studio',
    //       subtitle: 'Extract, edit & copy text from any scan',
    //       icon: Icons.text_fields_rounded,
    //       highlights: [
    //         'Zero internet required — runs on ML Kit',
    //         'One-tap copy, translate, or export as .TXT / .DOCX',
    //         'Searchable PDF generation',
    //       ],
    //     ),
    //   ],
    //   privacyPolicy: AppPrivacyPolicy(
    //     lastUpdated: 'October 2026',
    //     summary: 'SnapScan processes all scanned images, PDFs, and OCR text strictly on your device. Your documents are never uploaded to IoTBangla servers.',
    //     dataCollected: [
    //       'Scanned images and PDFs are stored exclusively in your device\'s local storage.',
    //       'Anonymous crash reports and ad impression metrics via Google AdMob.',
    //     ],
    //     permissionsUsed: [
    //       'Camera (required to capture document scans).',
    //       'Photo Library / Media (optional, to import existing images for PDF conversion).',
    //     ],
    //     thirdPartyServices: [
    //       'Google ML Kit (On-device document & OCR recognition)',
    //       'Google AdMob (Advertising)',
    //     ],
    //     dataRetentionAndDeletion: 'Deleting a document inside the app or uninstalling the app permanently deletes the files from local app storage.',
    //     supportEmail: 'support@iotbangla.com',
    //   ),
    // ),
    // MobileAppProject(
    //   slug: 'nur-prayer-companion',
    //   name: 'Nur — Prayer, Qibla & Dhikr',
    //   tagline: 'Accurate prayer times, Qibla compass & daily adhkar companion',
    //   shortDescription: 'Location-aware salah times with customizable calculation methods, smooth sensor Qibla compass, Ramadan tracker, and daily Hisnul Muslim adhkar.',
    //   fullDescription:
    //       'Nur by IoTBangla is a clean, distraction-free Islamic utility app crafted with Flutter. It calculates accurate '
    //       'prayer timings offline using astronomical coordinates, features a calibrated magnetometer Qibla compass, '
    //       'and provides audio recitations and daily dhikr counters.',
    //   category: 'Lifestyle & Utility',
    //   platforms: ['Android', 'iOS'],
    //   accentColor: Color(0xFFF59E0B),
    //   secondaryColor: Color(0xFFD97706),
    //   appIcon: Icons.explore_rounded,
    //   version: 'v1.5.0',
    //   releaseYear: '2025',
    //   downloadsBadge: '8K+ Downloads',
    //   rating: 4.9,
    //   isFeatured: false,
    //   isOpenSource: true,
    //   playStoreUrl: 'https://play.google.com/store/apps',
    //   keyFeatures: [
    //     'Offline astronomical prayer time calculation (Karachi, ISNA, MWL, Umm al-Qura)',
    //     'Real-time Qibla direction compass with magnetic interference indicator',
    //     'Morning & Evening Adhkar with Arabic typography, transliteration, and translation',
    //     'Interactive Tasbih counter with haptic feedback and daily streak goals',
    //     'Home screen widgets and customizable Adhan notifications',
    //   ],
    //   techStack: [
    //     'Flutter',
    //     'Dart',
    //     'Local Notifications',
    //     'Geolocator & Sensors',
    //     'SharedPreferences',
    //   ],
    //   screenPreviews: [
    //     AppScreenPreview(
    //       title: 'Prayer Timings & Countdown',
    //       subtitle: 'Asr in 01h 18m • Dhaka, Bangladesh',
    //       icon: Icons.access_time_filled_rounded,
    //       highlights: [
    //         'Fajr 04:52 • Dhuhr 11:58 • Asr 15:22 • Maghrib 17:48',
    //         'Custom Adhan audio & pre-prayer reminders',
    //         'Hijri calendar & fasting days indicator',
    //       ],
    //     ),
    //     AppScreenPreview(
    //       title: 'Precision Qibla Compass',
    //       subtitle: '277.6° WNW • Distance to Makkah: 5,172 km',
    //       icon: Icons.compass_calibration_rounded,
    //       highlights: [
    //         'Haptic feedback when aligned with Kaaba',
    //         'Sensor accuracy status & calibration guide',
    //       ],
    //     ),
    //   ],
    //   privacyPolicy: AppPrivacyPolicy(
    //     lastUpdated: 'October 2026',
    //     summary: 'Nur uses location coordinates solely on your device to compute accurate prayer times and Qibla angle.',
    //     dataCollected: [
    //       'Approximate or precise GPS coordinates (stored locally on your device only for prayer calculation).',
    //     ],
    //     permissionsUsed: [
    //       'Location (used only when calculating prayer times or Qibla direction).',
    //       'Notifications & Exact Alarms (to trigger timely Adhan notifications).',
    //     ],
    //     thirdPartyServices: [
    //       'No third-party advertising or personal tracking SDKs are included.',
    //     ],
    //     dataRetentionAndDeletion: 'All data stays on your device and is removed immediately upon uninstalling the app.',
    //     supportEmail: 'support@iotbangla.com',
    //   ),
    // ),
  ];

  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Mobile & Cross-Platform UI',
      subtitle:
          'Pixel-perfect design systems, custom animations & native speed',
      icon: Icons.phone_iphone_rounded,
      accentColor: Color(0xFF6366F1),
      skills: [
        SkillItem(
          name: 'Flutter & Dart Multi-Platform',
          levelLabel: 'Core Focus',
          proficiency: 0.96,
        ),
        SkillItem(
          name: 'Material 3 & Cupertino Adaptive UI',
          levelLabel: 'Expert',
          proficiency: 0.94,
        ),
        SkillItem(
          name: 'Custom Animations & Canvas Painters',
          levelLabel: 'Advanced',
          proficiency: 0.88,
        ),
        SkillItem(
          name: 'Android Native (Kotlin) & Platform Channels',
          levelLabel: 'Proficient',
          proficiency: 0.84,
        ),
      ],
    ),
    SkillCategory(
      title: 'IoT, Connectivity & Hardware',
      subtitle: 'Smart device communication, BLE provisioning & live telemetry',
      icon: Icons.router_rounded,
      accentColor: Color(0xFF06B6D4),
      skills: [
        SkillItem(
          name: 'MQTT, WebSockets & Real-Time Streams',
          levelLabel: 'Expert',
          proficiency: 0.95,
        ),
        SkillItem(
          name: 'Bluetooth Low Energy (BLE) & Wi-Fi Setup',
          levelLabel: 'Advanced',
          proficiency: 0.90,
        ),
        SkillItem(
          name: 'Clean Architecture, Riverpod & BLoC',
          levelLabel: 'Expert',
          proficiency: 0.94,
        ),
        SkillItem(
          name: 'Sensor Visualization & Alert Automation',
          levelLabel: 'Expert',
          proficiency: 0.92,
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
          name: 'Automated Unit, Widget & Integration Tests',
          levelLabel: 'Advanced',
          proficiency: 0.86,
        ),
        SkillItem(
          name: 'Figma to Production Flutter UI',
          levelLabel: 'Expert',
          proficiency: 0.93,
        ),
      ],
    ),
  ];

  static const List<TimelineEntry> timeline = [
    TimelineEntry(
      period: 'Consumer & Utility Apps',
      roleOrDegree: 'Mobile Application Publishing & Monetization',
      organization: 'IoTBangla Mobile Studio',
      location: 'Google Play & App Store',
      description: 'Architecting, shipping, and maintaining consumer mobile applications with Flutter, focusing on offline-first reliability, modern Material 3 interfaces, and AdMob monetization.',
      highlights: [
        'Published multiple production apps serving thousands of active monthly users.',
        'Engineered reusable modular kits for onboarding, local database sync, and in-app analytics.',
        'Maintained >99.5% crash-free session rates via proactive Crashlytics monitoring and automated testing.',
      ],
      icon: Icons.phone_android_rounded,
    ),
    TimelineEntry(
      period: 'Smart Connected Solutions',
      roleOrDegree: 'IoT & Companion Mobile Apps',
      organization: 'IoTBangla Hardware & Cloud Integration',
      location: 'Dhaka, Bangladesh',
      description: 'Building low-latency mobile dashboards and device controllers that bridge embedded IoT hardware with intuitive Android and iOS experiences.',
      highlights: [
        'Integrated MQTT, WebSockets, and BLE provisioning workflows into cross-platform Flutter apps.',
        'Delivered real-time sensor telemetry charting, push alerts, and smart automation scheduling.',
      ],
      icon: Icons.router_rounded,
    ),
    TimelineEntry(
      period: 'Custom Engineering',
      roleOrDegree: 'End-to-End Product Development',
      organization: 'IoTBangla Engineering Team',
      location: 'Global & Remote',
      description: 'Partnering with businesses and startups to take mobile products from UI/UX wireframes to production store releases.',
      highlights: [
        'Full lifecycle coverage: architecture design, API integration, store compliance, and long-term maintenance.',
        'Optimized app startup times and smooth rendering across both flagship and entry-level mobile devices.',
      ],
      icon: Icons.rocket_launch_rounded,
    ),
  ];
}
