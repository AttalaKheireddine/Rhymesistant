import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:rhymesistant/side.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.setAlwaysOnTop(true);
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Rhymesistant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontFamily: 'Roboto'),),
        centerTitle: true,
      ),
      body: Center(

        child:Column(
          children: [
            Flexible(child:
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xffc6e2ee),

              child: Row(
                children: [
                  Expanded(child:Rhymeside()),
                  Expanded(child:Rhymeside()),
                ],
              ),
            )),
    Container(
      height: 30,
      color: Color(0xFF143543),
      child: Center(
        child: Text("Created by KH! (The Black Quill)", style:
        TextStyle(
          color: Colors.white70,
    ),),),
    )
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}
