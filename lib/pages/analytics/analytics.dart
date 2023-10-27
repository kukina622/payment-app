import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payment_app/pages/analytics/analysisChart.dart';
import 'package:payment_app/pages/analytics/dayTab.dart';
import 'package:payment_app/pages/analytics/periodTab.dart';
import 'package:payment_app/pages/analytics/cashFlowRecordList.dart';
import 'package:payment_app/pages/analytics/cashFlowRecordItem.dart';
import 'package:payment_app/widgets/myAppBar/myAppBar.dart';
import 'package:payment_app/widgets/myBottomNavigationBar/myBottomNavigationBar.dart';
import 'package:payment_app/widgets/myNavigationBar/myNavigationBar.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> with TickerProviderStateMixin {
  late TabController tabController;
  late TabController dayTabController;
  int amount = 1083274;

  List<CashFlowRecordItemData> cashFlowRecords = [
    CashFlowRecordItemData(
      title: "生活費",
      subtitle: "Saving goal 10K",
      amount: 10000,
      image: const Icon(Icons.home, size: 38, color: Color(0xFFa6a499)),
    ),
    CashFlowRecordItemData(
      title: "存款",
      subtitle: "Saving goal \$16K",
      amount: 1400,
      image: const Icon(Icons.account_balance, size: 38, color: Color(0xFFa6a499)),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    dayTabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 75),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyNavigationBar(title: "Analytics"),
              const SizedBox(height: 15),
              PeriodTab(tabController: tabController),
              const SizedBox(height: 13),
              Text(
                NumberFormat.simpleCurrency(decimalDigits: 0).format(amount).toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "Spending ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                  TextSpan(
                    text: "+12%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.2,
                    ),
                  ),
                ]),
              ),
              const AnalysisChart(),
              DayTab(tabController: dayTabController),
              CashFlowRecordList(
                records: cashFlowRecords,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const MyBottomNavigationBar(initIndex: 2),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
