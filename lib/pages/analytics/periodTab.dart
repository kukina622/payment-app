import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class PeriodTab extends StatefulWidget {
  final TabController? tabController;
  final Function(int)? onTap;
  const PeriodTab({Key? key, this.tabController, this.onTap}) : super(key: key);

  @override
  State<PeriodTab> createState() => _PeriodTabState();
}

class _PeriodTabState extends State<PeriodTab> {
  List<String> tab = [
    'Week',
    'Month',
    'Year',
  ];

  Widget _individualTab({String text = "", index = 0}) {
    return Container(
      height: 34 + MediaQuery.of(context).padding.bottom,
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: index == tab.length - 1 ? Colors.transparent : const Color(0xFFc7c7c7),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: Tab(text: text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      alignment: Alignment.center,
      height: 34,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Color(0xFFf1f1f1),
      ),
      child: TabBar(
        controller: widget.tabController,
        tabs: tab.mapIndexed((i, v) => _individualTab(text: v, index: i)).toList(),
        isScrollable: false,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.all(0),
        indicatorPadding: const EdgeInsets.all(0),
        labelColor: Colors.white,
        labelStyle: const TextStyle(fontSize: 16.0, letterSpacing: 0.8),
        indicator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          color: Colors.black,
        ),
        unselectedLabelColor: const Color(0xFFa3a3a3),
        unselectedLabelStyle: const TextStyle(fontSize: 16.0, letterSpacing: 0.8),
        onTap: (index) => widget.onTap?.call(index),
      ),
    );
  }
}
