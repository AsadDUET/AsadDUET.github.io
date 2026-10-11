import 'package:flutter/material.dart';
import '../models/portfolio_models.dart';

/// Renders a realistic smartphone device frame displaying an [MobileAppProject]'s
/// screens (either real screenshot assets/URLs or an interactive stylized UI preview).
class PhoneMockupFrame extends StatefulWidget {
  final MobileAppProject app;
  final double width;
  final double height;
  final bool interactiveCarousel;

  const PhoneMockupFrame({
    super.key,
    required this.app,
    this.width = 270,
    this.height = 540,
    this.interactiveCarousel = true,
  });

  @override
  State<PhoneMockupFrame> createState() => _PhoneMockupFrameState();
}

class _PhoneMockupFrameState extends State<PhoneMockupFrame> {
  int _selectedIndex = 0;

  @override
  void didUpdateWidget(covariant PhoneMockupFrame oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.app.slug != widget.app.slug) {
      _selectedIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screens = widget.app.screenPreviews;
    final currentScreen = screens.isNotEmpty
        ? screens[_selectedIndex.clamp(0, screens.length - 1)]
        : AppScreenPreview(
            title: widget.app.name,
            subtitle: widget.app.tagline,
            icon: widget.app.appIcon,
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Outer Phone Chassis
        Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF0B0F19),
            borderRadius: BorderRadius.circular(38),
            border: Border.all(
              color: widget.app.accentColor.withValues(alpha: 0.45),
              width: 2.2,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.app.accentColor.withValues(alpha: 0.22),
                blurRadius: 36,
                spreadRadius: 2,
                offset: const Offset(0, 14),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF111827),
                    Color.lerp(
                      const Color(0xFF0F172A),
                      widget.app.accentColor,
                      0.14,
                    )!,
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Top Status Bar & Dynamic Island
                  _buildStatusBar(),

                  // Screen Body
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 280),
                      child: _buildScreenContent(currentScreen),
                    ),
                  ),

                  // Bottom Navigation Pill / Screen Switcher inside Phone
                  if (widget.interactiveCarousel && screens.length > 1)
                    _buildInPhoneBottomTabs(screens),

                  // Home Indicator Bar
                  Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 8),
                    width: 86,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.35),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // External Carousel Dots if interactive
        if (widget.interactiveCarousel && screens.length > 1) ...[
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(screens.length, (index) {
              final isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: isSelected ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? widget.app.accentColor
                          : Colors.grey.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }

  Widget _buildStatusBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '9:41',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            width: 68,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const Row(
            children: [
              Icon(Icons.signal_cellular_alt, color: Colors.white70, size: 12),
              SizedBox(width: 3),
              Icon(Icons.wifi, color: Colors.white70, size: 12),
              SizedBox(width: 3),
              Icon(Icons.battery_full, color: Colors.white70, size: 12),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScreenContent(AppScreenPreview screen) {
    final imagePath = screen.imageUrlOrAsset;
    if (imagePath != null && imagePath.isNotEmpty) {
      final isNetwork = imagePath.startsWith('http');
      return Container(
        key: ValueKey(imagePath),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: isNetwork
              ? Image.network(imagePath, fit: BoxFit.cover)
              : Image.asset(imagePath, fit: BoxFit.cover),
        ),
      );
    }

    // Stylized interactive mobile UI preview when no image file is set
    return Padding(
      key: ValueKey(screen.title),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Simulated App Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: widget.app.accentColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.app.appIcon,
                  color: widget.app.accentColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.app.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.5,
                      ),
                    ),
                    Text(
                      widget.app.version,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.55),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: widget.app.accentColor.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${widget.app.rating ?? 4.8} ★',
                  style: TextStyle(
                    color: widget.app.accentColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Hero Card inside Phone Screen
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.app.accentColor,
                  widget.app.secondaryColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: widget.app.accentColor.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(screen.icon, color: Colors.white, size: 24),
                const SizedBox(height: 8),
                Text(
                  screen.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  screen.subtitle,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 11,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Feature Highlights List inside Phone Screen
          Expanded(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: screen.highlights.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: widget.app.accentColor,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          screen.highlights[index],
                          style: const TextStyle(
                            color: Color(0xFFE2E8F0),
                            fontSize: 10.5,
                            height: 1.25,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInPhoneBottomTabs(List<AppScreenPreview> screens) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(screens.length, (i) {
          final active = i == _selectedIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = i),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: active
                      ? widget.app.accentColor.withValues(alpha: 0.25)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  screens[i].icon,
                  size: 16,
                  color: active ? widget.app.accentColor : Colors.white54,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
