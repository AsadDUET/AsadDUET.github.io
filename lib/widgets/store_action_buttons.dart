import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_models.dart';

Future<void> launchExternalLink(String url) async {
  if (url.trim().isEmpty) return;
  final uri = Uri.tryParse(url);
  if (uri != null) {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}

void copyTextWithToast(BuildContext context, String text, String label) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      width: 360,
      content: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Expanded(child: Text('$label copied to clipboard!')),
        ],
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

/// Renders store download and repository badges for an [MobileAppProject].
class StoreActionButtons extends StatelessWidget {
  final MobileAppProject app;
  final bool compact;

  const StoreActionButtons({
    super.key,
    required this.app,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        if (app.playStoreUrl != null && app.playStoreUrl!.isNotEmpty)
          _StoreBadgeButton(
            icon: Icons.shop_rounded,
            label: compact ? 'Google Play' : 'Get on Google Play',
            accentColor: const Color(0xFF10B981),
            onTap: () => launchExternalLink(app.playStoreUrl!),
          ),
        if (app.appStoreUrl != null && app.appStoreUrl!.isNotEmpty)
          _StoreBadgeButton(
            icon: Icons.apple_rounded,
            label: compact ? 'App Store' : 'Download on App Store',
            accentColor: const Color(0xFF38BDF8),
            onTap: () => launchExternalLink(app.appStoreUrl!),
          ),
        if (app.apkDownloadUrl != null && app.apkDownloadUrl!.isNotEmpty)
          _StoreBadgeButton(
            icon: Icons.android_rounded,
            label: compact ? 'APK' : 'Direct APK',
            accentColor: app.accentColor,
            onTap: () => launchExternalLink(app.apkDownloadUrl!),
          ),
        if (app.githubUrl != null && app.githubUrl!.isNotEmpty)
          _StoreBadgeButton(
            icon: Icons.code_rounded,
            label: compact ? 'Source' : 'GitHub Repo',
            accentColor: const Color(0xFFA855F7),
            onTap: () => launchExternalLink(app.githubUrl!),
          ),
      ],
    );
  }
}

class _StoreBadgeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color accentColor;
  final VoidCallback onTap;

  const _StoreBadgeButton({
    required this.icon,
    required this.label,
    required this.accentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: isDark ? 0.14 : 0.10),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: accentColor.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 17, color: accentColor),
              const SizedBox(width: 7),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
