import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NatiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool showBackArrow;
  final double elevation;
  final bool centerTitle;
  final double height;
  final TextStyle? titleTextStyle;
  final IconThemeData? iconTheme;

  const NatiAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.onBack,
    this.actions,
    this.backgroundColor = kcPrimaryColor,
    this.foregroundColor = kcWhite,
    this.showBackArrow = true,
    this.elevation = 0,
    this.centerTitle = true,
    this.height = kToolbarHeight,
    this.titleTextStyle,
    this.iconTheme,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: height,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: foregroundColor),
              onPressed: onBack ?? () => Navigator.maybePop(context),
            )
          : null,
      iconTheme: iconTheme ?? IconThemeData(color: foregroundColor),
      title:
          titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style:
                      titleTextStyle ??
                      TextStyle(
                        color: foregroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                )
              : null),
      actions: actions,
    );
  }
}
