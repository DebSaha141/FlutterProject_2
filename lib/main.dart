import 'package:flutter/material.dart';
import 'package:krs_grid_project/gridView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/gridView': (context) => gridView(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List _makeList() {
  var list = [];

  for (var i = 1; i < 25; i++) {
    list.add(i);
  }

  return list;
}

class _HomeState extends State<Home> {
  var arrcolor = [
    const Color.fromARGB(255, 234, 153, 180),
    const Color.fromARGB(255, 240, 206, 218)
  ];
  var i = 0;
  var j = 0;
  List list = _makeList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List View"),
          backgroundColor: const Color.fromARGB(255, 3, 128, 7),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/gridView');
          },
          child: Icon(Icons.grid_view),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            String itemTitle = "List Item ${list[index]}";
            return InkWell(
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 8),
                color: arrcolor[(i++) % 2],
                height: 60,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      itemTitle,
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    Icon(Icons.keyboard_arrow_right, size: 35)
                  ],
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                          insetPadding: const EdgeInsets.only(
                              top: 240, bottom: 250, left: 80, right: 80),
                          backgroundColor:
                              const Color.fromARGB(255, 192, 167, 197),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Icon(
                                Icons.verified,
                                size: 50,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "You Clicked on:",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                itemTitle,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "OK",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ]);
                    }));
              },
            );
          },
          itemCount: 25,
        ));
  }
}
