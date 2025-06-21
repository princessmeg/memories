import 'dart:ffi';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memories/components/VideoWidget.dart';

import 'BackgroundWidget.dart';
import 'EventData.dart';

class MemoriesDetailsPage extends StatefulWidget {

  final Event event;

  const MemoriesDetailsPage({
    super.key,
    required this.event
  });

  @override
  State<MemoriesDetailsPage> createState() => _MemoriesDetailsPageState();
}

class _MemoriesDetailsPageState extends State<MemoriesDetailsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> urls = [];
  List<String> content = [];

  @override
  void initState() {
    super.initState();
    urls = widget.event.links;
    content = widget.event.content;
  }


  void _goToPage(int index) {
    if (index >= 0 && index < urls.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  bool isVideo(String url) {
    return url.contains("drive.google.com");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: urls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    isVideo(urls[index]) ? BackgroundWidget() : BackgroundWidget(link: urls[index]),
                    isVideo(urls[index]) ? CachedVideoPlayerPage(videoUrl: urls[index]) :
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.6,
                        child: CachedNetworkImage(
                          imageUrl: urls[index],
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Container(
                                color: Colors.black,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height,
                              ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          // height: 200,
                          fit: BoxFit.contain,
                          alignment: Alignment.topCenter,
                          fadeInDuration: const Duration(milliseconds: 0),
                          fadeInCurve: Curves.linear,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.bottomLeft,
                        child: SingleChildScrollView(
                          child: Text(
                            content[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Left Arrow
            if (_currentPage > 0)
              Positioned(
                left: 16,
                top: MediaQuery
                    .of(context)
                    .size
                    .height / 2 - 24,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => _goToPage(_currentPage - 1),
                ),
              ),
            // Right Arrow
            if (_currentPage < urls.length - 1)
              Positioned(
                right: 16,
                top: MediaQuery
                    .of(context)
                    .size
                    .height / 2 - 24,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () => _goToPage(_currentPage + 1),
                ),
              ),
            Positioned(
              right: 10,
              top: 30,
              child: IconButton(
                icon: const Icon(Icons.cancel_outlined, color: Colors.white60),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}