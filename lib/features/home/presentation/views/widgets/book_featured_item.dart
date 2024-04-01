import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookFeaturedItem extends StatelessWidget {
  const BookFeaturedItem({super.key, required this.imgUrl});

  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
