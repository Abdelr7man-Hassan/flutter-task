import 'package:flutter/material.dart';
import 'Pages/Event_page.dart';
import 'Pages/loading.dart';
void main() => runApp(MaterialApp(
    initialRoute:'/',
    routes: {
      '/' : (context) => Loading(),
      '/event':(context) => Directionality(
                textDirection:TextDirection.rtl,
                  child: EventPage(),
      ),
    },
));
