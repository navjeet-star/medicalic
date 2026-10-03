import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';

class StripedBarData {
  final double heightRatio;
  final bool isStriped;
  final Color? barColor;

  const StripedBarData({
    required this.heightRatio,
    this.isStriped = false,
    this.barColor,
  });
}

class StripedBarPainter extends CustomPainter {
  final bool isStriped;
  final Color primaryColor;
  final Color stripeColor;
  final double borderRadius;

  StripedBarPainter({
    required this.isStriped,
    required this.primaryColor,
    this.stripeColor = const Color(0x38FFFFFF),
    this.borderRadius = 6.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, 0, size.width, size.height),
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: const Radius.circular(2),
      bottomRight: const Radius.circular(2),
    );

    // Fill the background of the bar
    final fillPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rrect, fillPaint);

    // If striped, draw diagonal 45-degree lines clipped to the bar's rounded shape
    if (isStriped) {
      canvas.save();
      canvas.clipRRect(rrect);

      final stripePaint = Paint()
        ..color = stripeColor
        ..strokeWidth = 2.0
        ..style = PaintingStyle.stroke;

      const double step = 6.0;
      final double total = size.width + size.height;

      for (double i = -size.height; i < total; i += step) {
        canvas.drawLine(
          Offset(i, size.height),
          Offset(i + size.height, 0),
          stripePaint,
        );
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant StripedBarPainter oldDelegate) {
    return oldDelegate.isStriped != isStriped ||
        oldDelegate.primaryColor != primaryColor ||
        oldDelegate.stripeColor != stripeColor;
  }
}

class StripedBarChartWidget extends StatelessWidget {
  final List<StripedBarData> bars;
  final double chartHeight;
  final double barWidth;
  final double barSpacing;

  const StripedBarChartWidget({
    super.key,
    this.bars = const [
      StripedBarData(heightRatio: 0.60, isStriped: true),
      StripedBarData(heightRatio: 0.38, isStriped: true),
      StripedBarData(heightRatio: 1.00, isStriped: true),
      StripedBarData(heightRatio: 0.76, isStriped: true),
      StripedBarData(heightRatio: 0.52, isStriped: false),
      StripedBarData(heightRatio: 0.68, isStriped: false),
    ],
    this.chartHeight = 85.0,
    this.barWidth = 14.0,
    this.barSpacing = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: chartHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: bars.map((bar) {
          final barActualHeight = (chartHeight * bar.heightRatio).clamp(12.0, chartHeight);
          final color = bar.barColor ??
              (bar.isStriped
                  ? AppColors.primary
                  : const Color(0xFFD6E4FC));

          return Container(
            margin: EdgeInsets.only(right: barSpacing),
            width: barWidth,
            height: barActualHeight,
            child: CustomPaint(
              painter: StripedBarPainter(
                isStriped: bar.isStriped,
                primaryColor: color,
                stripeColor: const Color(0x55FFFFFF),
                borderRadius: 5.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
