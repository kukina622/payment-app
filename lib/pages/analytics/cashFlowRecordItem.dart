import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashFlowRecordItemData {
  String title;
  String subtitle;
  int amount;
  Widget image;

  CashFlowRecordItemData({
    required this.title,
    required this.amount,
    this.subtitle = "",
    this.image = const Icon(
      Icons.shopify,
      size: 38,
      color: Color(0xFFa6a499),
    ),
  });
}

class CashFlowRecordItem extends StatelessWidget {
  final CashFlowRecordItemData data;
  const CashFlowRecordItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color(0xfff1f1f1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: data.image,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Text(
                        data.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      NumberFormat.simpleCurrency(decimalDigits: 0).format(data.amount).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  data.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9b9b9b),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
