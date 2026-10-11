import 'package:flutter/material.dart';

/// Profile details for the developer portfolio hero, about, and contact sections.
class DeveloperProfile {
  final String name;
  final String handle;
  final String roleTitle;
  final String heroTagline;
  final String bio;
  final String aboutExtended;
  final String location;
  final String educationBadge;
  final bool availableForWork;
  final String email;
  final String githubUrl;
  final String linkedInUrl;
  final String playStoreDevUrl;
  final String appStoreDevUrl;
  final String resumeUrl;
  final List<StatMetric> stats;

  const DeveloperProfile({
    required this.name,
    required this.handle,
    required this.roleTitle,
    required this.heroTagline,
    required this.bio,
    required this.aboutExtended,
    required this.location,
    required this.educationBadge,
    this.availableForWork = true,
    required this.email,
    required this.githubUrl,
    required this.linkedInUrl,
    required this.playStoreDevUrl,
    this.appStoreDevUrl = '',
    this.resumeUrl = '',
    required this.stats,
  });
}

class StatMetric {
  final String value;
  final String label;
  final IconData icon;

  const StatMetric({
    required this.value,
    required this.label,
    required this.icon,
  });
}

/// Represents a screen preview inside the interactive mobile device frame.
/// If [imageUrlOrAsset] is provided, the frame renders that image.
/// Otherwise, it renders a rich stylized preview using [title], [subtitle], and [icon].
class AppScreenPreview {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> highlights;
  final String? imageUrlOrAsset;

  const AppScreenPreview({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.highlights = const [],
    this.imageUrlOrAsset,
  });
}

/// Store-ready privacy policy and support details for an individual mobile app.
class AppPrivacyPolicy {
  final String lastUpdated;
  final String summary;
  final List<String> dataCollected;
  final List<String> permissionsUsed;
  final List<String> thirdPartyServices;
  final String dataRetentionAndDeletion;
  final String childrenPrivacy;
  final String supportEmail;

  const AppPrivacyPolicy({
    required this.lastUpdated,
    required this.summary,
    required this.dataCollected,
    required this.permissionsUsed,
    required this.thirdPartyServices,
    required this.dataRetentionAndDeletion,
    this.childrenPrivacy =
        'This application does not knowingly collect personal identifiable information from children under 13.',
    required this.supportEmail,
  });
}

/// Represents a mobile app showcased in the portfolio.
class MobileAppProject {
  /// URL-friendly slug used for deep-linking:
  /// - `/#/app/<slug>`
  /// - `/#/app/<slug>/privacy`
  final String slug;
  final String name;
  final String tagline;
  final String shortDescription;
  final String fullDescription;
  final String category;
  final List<String> platforms; // e.g. ['Android', 'iOS']
  final Color accentColor;
  final Color secondaryColor;
  final IconData appIcon;
  final String? iconAssetPath;
  final String version;
  final String releaseYear;
  final String downloadsBadge;
  final double? rating;
  final bool isFeatured;
  final bool isOpenSource;

  // Store & repository links (leave null/empty if not applicable)
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? apkDownloadUrl;
  final String? githubUrl;
  final String? webDemoUrl;

  final List<String> keyFeatures;
  final List<String> techStack;
  final List<AppScreenPreview> screenPreviews;
  final AppPrivacyPolicy privacyPolicy;

  const MobileAppProject({
    required this.slug,
    required this.name,
    required this.tagline,
    required this.shortDescription,
    required this.fullDescription,
    required this.category,
    required this.platforms,
    required this.accentColor,
    required this.secondaryColor,
    required this.appIcon,
    this.iconAssetPath,
    required this.version,
    required this.releaseYear,
    required this.downloadsBadge,
    this.rating,
    this.isFeatured = false,
    this.isOpenSource = false,
    this.playStoreUrl,
    this.appStoreUrl,
    this.apkDownloadUrl,
    this.githubUrl,
    this.webDemoUrl,
    required this.keyFeatures,
    required this.techStack,
    required this.screenPreviews,
    required this.privacyPolicy,
  });
}

class SkillCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final List<SkillItem> skills;

  const SkillCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.skills,
  });
}

class SkillItem {
  final String name;
  final String levelLabel;
  final double proficiency; // 0.0 to 1.0

  const SkillItem({
    required this.name,
    required this.levelLabel,
    required this.proficiency,
  });
}

class TimelineEntry {
  final String period;
  final String roleOrDegree;
  final String organization;
  final String location;
  final String description;
  final List<String> highlights;
  final IconData icon;
  final bool isEducation;

  const TimelineEntry({
    required this.period,
    required this.roleOrDegree,
    required this.organization,
    required this.location,
    required this.description,
    required this.highlights,
    required this.icon,
    this.isEducation = false,
  });
}
