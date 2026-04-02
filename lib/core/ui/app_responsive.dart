import 'package:flutter/material.dart';

class AppResponsive {
  AppResponsive._(); // private constructor
  static final AppResponsive _instance = AppResponsive._();
  static AppResponsive get instance => _instance;

  static late double _width;
  static late double _height;

  /// 📌 Ek baar MaterialApp ya root widget mein init karo
  static void init(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }

  // 📱 Screen Size
  static double get width => _width;
  static double get height => _height;

  // 📏 Percentage based
  static double wp(double percent) => _width * percent / 100;
  static double hp(double percent) => _height * percent / 100;

  // 🔤 Text Scale
  static double sp(double size) => size * (_width / 375);

  // 📐 Padding
  static EdgeInsets paddingAll(double value) => EdgeInsets.all(value);

  static EdgeInsets paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static EdgeInsets paddingOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);

  // 🔵 Border Radius
  static BorderRadius radius(double value) => BorderRadius.circular(value);

  static BorderRadius radiusOnly({
    double tl = 0,
    double tr = 0,
    double bl = 0,
    double br = 0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
        bottomLeft: Radius.circular(bl),
        bottomRight: Radius.circular(br),
      );

  // 📦 SizedBox helpers
  static SizedBox h(double value) => SizedBox(height: value);
  static SizedBox w(double value) => SizedBox(width: value);

  // 📱 Device Type
  static bool get isMobile => _width < 600;
  static bool get isTablet => _width >= 600 && _width < 1024;
  static bool get isDesktop => _width >= 1024;
}