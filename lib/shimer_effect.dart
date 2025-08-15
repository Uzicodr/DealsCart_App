import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 20, width: 200, color: Colors.white), // title
          const SizedBox(height: 10),
          Container(height: 150, width: double.infinity, color: Colors.white), // image
        ],
      ),
    );
  }
}
