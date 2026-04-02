import 'package:flutter/material.dart';
import 'dart:math';

class CustomLoader extends StatefulWidget {
  final double size;
  final Color color;
  final String? message;
  final double borderWidth;

  const CustomLoader({
    super.key,
    this.size = 60,
    this.color = Colors.blue,
    this.message,
    this.borderWidth=60
  });

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: SizedBox(
              height: widget.size,
              width: widget.size,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: widget.size,
                    width: widget.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          widget.color.withOpacity(0.1),
                          widget.color,
                          widget.color.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: widget.borderWidth * 0.6,
                    width: widget.borderWidth * 0.6,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (widget.message != null) ...[
            const SizedBox(height: 12),
            Text(
              widget.message!,
              style: const TextStyle(fontSize: 14),
            ),
          ]
        ],
      ),
    );
  }
}