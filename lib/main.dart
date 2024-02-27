import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      // 1
                      builder: (context) => const AboutDialog(
                            applicationIcon: FlutterLogo(),
                            applicationLegalese: 'Legalese',
                            applicationName: 'Flutter widgets',
                            applicationVersion: 'version 1.0.0',
                            children: [
                              Text('This is a first widget in this app')
                            ],
                          ));
                },
                child: const Text("Show about dialog")),
            // 2
            const AboutListTile(
              icon: Icon(Icons.info),
              applicationIcon: FlutterLogo(),
              applicationLegalese: 'Legalese',
              applicationName: 'Flutter widgets',
              applicationVersion: '1.0.0',
              aboutBoxChildren: [Text('About list tile text')],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: ElevatedButton(onPressed: () {}, child: null),
                ),
                SizedBox(
                  width: 100.0,
                  height: 200.0,
                  // 3
                  child: AbsorbPointer(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: null,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade200),
                  )),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    // 4
                    builder: (context) => AlertDialog(
                      icon: const FlutterLogo(),
                      iconPadding: const EdgeInsets.all(20.0),
                      iconColor: Colors.blue.shade200,
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'))
                      ],
                      actionsPadding: const EdgeInsets.all(20.0),
                      actionsAlignment: MainAxisAlignment.center,
                      actionsOverflowAlignment: OverflowBarAlignment.center,
                      actionsOverflowButtonSpacing: 20.0,
                      actionsOverflowDirection: VerticalDirection.up,
                      alignment: Alignment.topRight,
                      elevation: 20.0,
                      backgroundColor: Colors.deepOrangeAccent,
                      buttonPadding: const EdgeInsets.all(20.0),
                      scrollable: true,
                      semanticLabel: 'Alert',
                      shadowColor: Colors.cyanAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      title: const Text('Alert dialog'),
                      titlePadding: const EdgeInsets.all(20.0),
                      titleTextStyle: const TextStyle(color: Colors.amber),
                      content: const Text('This is the Alert Dialog'),
                      contentPadding: const EdgeInsets.all(20.0),
                      contentTextStyle: const TextStyle(color: Colors.brown),
                      clipBehavior: Clip.antiAlias,
                      insetPadding: const EdgeInsets.all(20.0),
                    ),
                  );
                },
                child: const Text('Show alert dialog')),
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.amber,
              //alignment: Alignment.topLeft,
              // 5
              child: const Align(
                alignment: Alignment.bottomRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                  child: Container(
                width: double.infinity,
                height: 250.0,
                color: Colors.blueGrey,
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(
                    size: 50.0,
                  ),
                ),
              )),
            )
          ],
        )));
  }
}
