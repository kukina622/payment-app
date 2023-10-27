import 'package:flutter/material.dart';
import 'package:payment_app/pages/analytics/cashFlowRecordItem.dart';

class CashFlowRecordList extends StatefulWidget {
  final List<CashFlowRecordItemData> records;

  const CashFlowRecordList({Key? key, this.records = const []}) : super(key: key);

  @override
  State<CashFlowRecordList> createState() => _CashFlowRecordListState();
}

class _CashFlowRecordListState extends State<CashFlowRecordList> {
  List<Widget> _buildList() {
    List<Widget> list = [];
    for (var i = 0; i < widget.records.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CashFlowRecordItem(data: widget.records[i]),
        ),
      );
      list.add(const Divider(color: Color(0xfff1f1f1)));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildList());
  }
}
