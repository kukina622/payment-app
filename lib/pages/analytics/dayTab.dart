import 'package:flutter/material.dart';

class DayTab extends StatefulWidget {
  final TabController? tabController;
  final Function(int)? onTap;

  const DayTab({Key? key, this.tabController, this.onTap}) : super(key: key);

  @override
  State<DayTab> createState() => _DayTabState();
}

class _DayTabState extends State<DayTab> {
  List<String> tab = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      tabs: tab.map((x) => Tab(text: x)).toList(),
      isScrollable: false,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.all(0),
      indicatorPadding: const EdgeInsets.all(0),
      labelColor: Colors.black,
      labelStyle: const TextStyle(
        fontSize: 16.0,
        letterSpacing: 0.8,
        fontWeight: FontWeight.w500,
      ),
      indicator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      unselectedLabelColor: const Color(0xFFa3a3a3),
      unselectedLabelStyle: const TextStyle(fontSize: 16.0, letterSpacing: 0.8),
      onTap: (index) => widget.onTap?.call(index),
    );
  }
}
