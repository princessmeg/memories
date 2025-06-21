import 'dart:convert';
import 'package:flutter/services.dart';

class Event {
  final String eventName;
  final List<String> thumbnailImages;
  final List<String> links;
  final List<String> content;
  final List<String> extraLinks;

  Event({
    required this.eventName,
    required this.thumbnailImages,
    required this.links,
    required this.content,
    required this.extraLinks,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'] ?? '',
      thumbnailImages: List<String>.from(json['thumbnailImages'] ?? []),
      links: List<String>.from(json['links'] ?? []),
      content: List<String>.from(json['content'] ?? []),
      extraLinks: List<String>.from(json['extraLinks'] ?? []),
    );
  }
}

class EventDataService {
  static final EventDataService _instance = EventDataService._internal();
  factory EventDataService() => _instance;

  EventDataService._internal();

  List<Event> events = [];

  Future<void> loadData() async {
    final jsonString = await rootBundle.loadString('assets/content.json');
    final jsonMap = jsonDecode(jsonString);
    events = (jsonMap['events'] as List)
        .map((e) => Event.fromJson(e))
        .toList();
  }
}
