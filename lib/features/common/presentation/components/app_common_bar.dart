import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppBarItemType { icon, svg, image, text }

class AppBarItem {
  final AppBarItemType type;
  final String? asset;
  final IconData? icon;
  final String? text;
  final VoidCallback? onTap;

  const AppBarItem.icon(this.icon, {this.onTap})
      : type = AppBarItemType.icon,
        asset = null,
        text = null;

  const AppBarItem.svg(this.asset, {this.onTap})
      : type = AppBarItemType.svg,
        icon = null,
        text = null;

  const AppBarItem.image(this.asset, {this.onTap})
      : type = AppBarItemType.image,
        icon = null,
        text = null;

  const AppBarItem.text(this.text, {this.onTap})
      : type = AppBarItemType.text,
        icon = null,
        asset = null;
}

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;

  final bool showLeading;
  final bool showTitle;
  final bool showAction;

  final AppBarItem? leadingItem;
  final AppBarItem? actionItem;

  // 🔥 Spacing controls
  final double leadingWidth;
  final double leadingTitleSpacing;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.showLeading = true,
    this.showTitle = true,
    this.showAction = true,
    this.leadingItem,
    this.actionItem,
    this.leadingWidth = 40, // 🔥 FIXED WIDTH
    this.leadingTitleSpacing = 6, // 🔥 CONTROL GAP
  });

  Widget _buildItem(AppBarItem? item) {
    if (item == null) return const SizedBox();

    switch (item.type) {
      case AppBarItemType.icon:
        return IconButton(
          padding: EdgeInsets.zero, // 🔥 REMOVE EXTRA SPACE
          constraints: const BoxConstraints(),
          icon: Icon(item.icon, size: 22),
          onPressed: item.onTap,
        );

      case AppBarItemType.svg:
        return GestureDetector(
          onTap: item.onTap,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(item.asset!, height: 22),
          ),
        );

      case AppBarItemType.image:
        return GestureDetector(
          onTap: item.onTap,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Image.asset(item.asset!, height: 22),
          ),
        );

      case AppBarItemType.text:
        return TextButton(
          onPressed: item.onTap,
          child: Text(item.text!),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,

      // 🔥 REMOVE DEFAULT SPACING
      titleSpacing: 0,
      leadingWidth: showLeading ? leadingWidth : 0,

      // 🔹 Leading
      leading: showLeading
          ? _buildItem(
        leadingItem ??
            AppBarItem.icon(Icons.arrow_back, onTap: () {
              Navigator.pop(context);
            }),
      )
          : null,

      // 🔹 Title (FIXED spacing control)
      title: showTitle
          ? Row(
        children: [
          if (!centerTitle && showLeading)
            SizedBox(width: leadingTitleSpacing),

          Expanded(
            child: Text(
              title ?? '',
              overflow: TextOverflow.ellipsis,
              textAlign:
              centerTitle ? TextAlign.center : TextAlign.start,
            ),
          ),
        ],
      )
          : null,

      // 🔹 Right Side
      actions: showAction
          ? [
        _buildItem(actionItem),
        const SizedBox(width: 8),
      ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}