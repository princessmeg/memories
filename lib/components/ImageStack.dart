import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memories/components/MemoriesDetailsPage.dart';

import 'EventData.dart';

class ImageStack extends StatefulWidget {
  final Event event;
  const ImageStack({
    super.key,
    required this.event,
  });

  @override
  State<ImageStack> createState() => _ImageStackState();
}

class _ImageStackState extends State<ImageStack> {

  List<String> images = [];

  @override
  void initState() {
    super.initState();
    images = widget.event.thumbnailImages;
  }

  Widget buildImage(String imageLink, double angle, double opacity) {
    return Transform.rotate(
      angle: angle,
      child: Opacity(
        opacity: opacity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imageLink,
            progressIndicatorBuilder: (context, url, downloadProgress) => Container(
              color: Colors.black,
              width: 300,
              height: 200,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 300,
            height: 200,
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            fadeInDuration: const Duration(milliseconds: 0),
            fadeInCurve: Curves.linear,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemoriesDetailsPage(event: widget.event,),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (images.length > 2)
            buildImage(images[2], -0.2, 0.8),
          if (images.length > 1)
            buildImage(images[1], -0.1, 0.9),
          if (images.isNotEmpty)
            buildImage(images[0], 0.1, 1.0),
          Positioned(
            bottom: 50,
            child: Container(
              width: 250,
              child: Text(
                widget.event.eventName,
                style: const TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      offset: Offset(1, 1),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
