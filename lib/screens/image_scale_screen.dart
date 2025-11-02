import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageScaleScreen extends StatelessWidget {
  final String imageUrl = 'https://picsum.photos/800/1200';

  const ImageScaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Scale')),
      body: Container(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 4,
          enableRotation: false,
          backgroundDecoration: BoxDecoration(color: Colors.black),
          loadingBuilder: (context, event) =>
              Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
