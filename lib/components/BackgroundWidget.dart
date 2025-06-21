import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget{
  String? link;
  double? opacity;
  double? blurX;
  double? blurY;
  BackgroundWidget({super.key, this.link, this.opacity, this.blurX, this.blurY});

  @override
  Widget build(BuildContext context) {
    String url = "https://lh3.googleusercontent.com/pw/AP1GczNH90sXlK9bhIa6vUynZEcc6SGIBR7XR6Q7EbRy3e2P_iYbnDGDrqIbPbLLuXNxli4qlqpp_wliMyE12GLXwqccLKQEMZJyQJ0oiQ8OBmo53Suo2syj8swbuDEMKZVPegfjJsOxPKn3AyDVGGfXPmlhCA=w1440-h1080-s-no-gm?authuser=0";
    return CachedNetworkImage(
      imageUrl: link ?? url,
      imageBuilder: (context, imageProvider) =>
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurX ?? 15, sigmaY: blurY ?? 15),
              child: Container(
                color: Colors.black.withOpacity(opacity ?? 0.5),
              ),
            ),
          ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(color: Colors.black),
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
    );
  }

}