import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int initIndex;
  const MyBottomNavigationBar({Key? key, this.initIndex = 0}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int current = 0;

  List<IconData> icon = [
    Icons.qr_code_scanner,
    Icons.credit_card,
    Icons.signal_cellular_alt,
    Icons.person,
  ];

  List<String> pages = [
    "/scanner",
    "/cards",
    "/analytics",
    "/",
  ];

  @override
  void initState() {
    current = widget.initIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color(0xFFf1f1f1),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          icon.length,
          (index) => GestureDetector(
            onTap: () {
              String page = pages[index];
              Navigator.pushReplacementNamed(context, page);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: current == index ? Colors.black : Colors.transparent,
              ),
              child: Icon(
                icon[index],
                size: 28,
                color: current == index ? Colors.white : const Color(0xFF87888b),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
