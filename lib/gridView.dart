import 'package:flutter/material.dart';

class gridView extends StatefulWidget {
  const gridView({super.key});

  @override
  State<gridView> createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  var arrcolor = [
    const Color.fromARGB(255, 234, 153, 180),
    const Color.fromARGB(255, 240, 206, 218)
  ];
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
        backgroundColor: const Color.fromARGB(255, 3, 128, 7),
      ),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
        return Container(color: )
      })
    );
  }
}
