import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

double slide=11.0;
double slideSecond=11.0;
RangeValues _currentRangeValues = const RangeValues(40, 80);

bool check=true;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar:  AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.safety_check)),
              Tab(icon: Icon(Icons.satellite)),
            ],
          ),
        ),

        body: Column(

          children: [

            Slider(
               max: 50,
                min: 10,
                divisions: 80,
                value: slide,
                secondaryTrackValue: slideSecond,

                onChanged: (e){
              slide=e;
              setState(() {

              });
            }),
          RangeSlider(
            values: _currentRangeValues,
            max: 100,
            divisions: 5,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
            Text("$slide")

            ],
        ),

                   ),
    );
  }
}
