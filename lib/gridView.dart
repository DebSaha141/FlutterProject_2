import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
  const gridView({super.key});

  @override
  State<gridView> createState() => _gridViewState();
}

List _makeList() {
  var list = [];

  for (var i = 1; i < 25; i++) {
    list.add(i);
  }

  return list;
}

class _gridViewState extends State<gridView> {
  var arrcolor = [
    const Color.fromARGB(255, 240, 206, 218),
    const Color.fromARGB(255, 234, 153, 180),
    const Color.fromARGB(255, 224, 87, 133)
  ];
  var i = 0;
  List list = _makeList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        backgroundColor: const Color.fromARGB(255, 3, 128, 7),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemBuilder: (context, index) {
          String itemTitle = "Grid Item ${list[index]}";
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: arrcolor[(i++) % 3],
                ),
                child: Center(
                  child: Text(
                    itemTitle,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                        insetPadding: const EdgeInsets.only(
                            top: 240, bottom: 250, left: 65, right: 65),
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
        itemCount: 24,
      ),
    );
  }
}
