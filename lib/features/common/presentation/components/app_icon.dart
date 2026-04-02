import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIconType { icon, svg, image }

class AppIcon extends StatelessWidget {
  final AppIconType type;

  final IconData? icon;
  final String? asset;

  final double size;
  final Color? color;
  final BoxFit fit;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  const AppIcon.icon(
      this.icon, {
        super.key,
        this.size = 24,
        this.color,
        this.onTap,
        this.padding = EdgeInsets.zero,
      })  : type = AppIconType.icon,
        asset = null,
        fit = BoxFit.contain;

  const AppIcon.svg(
      this.asset, {
        super.key,
        this.size = 24,
        this.color,
        this.onTap,
        this.padding = EdgeInsets.zero,
      })  : type = AppIconType.svg,
        icon = null,
        fit = BoxFit.contain;

  const AppIcon.image(
      this.asset, {
        super.key,
        this.size = 24,
        this.onTap,
        this.padding = EdgeInsets.zero,
        this.fit = BoxFit.cover,
        this.color,
      })  : type = AppIconType.image,
        icon = null;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (type) {
      case AppIconType.icon:
        child = Icon(icon, size: size, color: color);
        break;

      case AppIconType.svg:
        child = SvgPicture.asset(
          asset!,
          height: size,
          width: size,
          colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
        break;

      case AppIconType.image:
        child = Image.asset(
          asset!,
          height: size,
          width: size,
          fit: fit,
        );
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}