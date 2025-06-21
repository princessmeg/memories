import 'package:flutter/material.dart';
import 'package:memories/components/BackgroundWidget.dart';

import 'EventData.dart';
import 'ImageStack.dart';

class MemoriesScreen extends StatelessWidget {
  MemoriesScreen({super.key});

  final List<Event> events = EventDataService().events;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          BackgroundWidget(),
          Container(
          // color: Colors.black87,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=0;i<events.length;i++)
                      Column(
                        children: [
                          const SizedBox(height: 50,),
                          if(i % 2 == 0)
                            Row(
                            children: [
                              const SizedBox(width: 50,),
                              ImageStack(event : events[i]),
                            ],
                          ),
                          if(i % 2 != 0)
                            Row(
                              children: [
                                ImageStack(event : events[i]),
                                const SizedBox(width: 50,),
                              ],
                            )
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
      ),
    );
  }

}