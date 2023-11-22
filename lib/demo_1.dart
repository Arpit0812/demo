import 'dart:math' as math;

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    setList(10);
  }

  List numm = [];
  setList(int n) {
    List a = List.generate(n % 2 == 0 ? n : n + 1, (index) => 0);
    print("List 1 ==> ${a.length}");

    while (a.any((element) => element == 0)) {
      final number = math.Random().nextInt(a.length * 10) + 1;
      if (!a.contains(number)) {
        int iA = math.Random().nextInt(10).clamp(0, a.length);
        if (a[iA] == 0) {
          a[iA] = number;
          a[a.indexWhere((element) => element == 0)] = number;
        }
      }
      // print("List 1 ==> ${a}");
      a.shuffle();
      // print("List 1 ==> ${a}");
      a.shuffle();
    }
    a.shuffle();
    numm = a;
    numm.shuffle();
    setState(() {});
  }

  selectItem(int i) {
    if (i1 == -1) {
      i1 = i;
    } else {
      i2 = i;
    }
    setState(() {});
    if (i1 != -1 && i2 != -1) {
      if (numm[i1] == numm[i2]) {
        matchedIndex.add(i1);
        matchedIndex.add(i2);
        i1 = -1;
        i2 = -1;
        setState(() {});
        return;
      }
    }

    setState(() {});
    if (i1 != -1 && i2 != -1)
      Future.delayed(Duration(seconds: 3), () {
        i1 = -1;
        i2 = -1;
        setState(() {});
      });
  }

  List matchedIndex = [];
  int i1 = -1;
  int i2 = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: numm.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: i1 == -1 || i2 == -1
                ? () {
                    selectItem(index);
                  }
                : null,
            child: Container(
              color: Colors.red,
              child: matchedIndex.contains(index) || index == i1 || index == i2
                  ? Center(
                      child: Text("${numm[index]}"),
                    )
                  : SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
