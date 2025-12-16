import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveLayout extends StatelessWidget {
  Widget mobileBody;
  Widget desktopBody;
  ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
