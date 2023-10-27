import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum STATUS { payment, received }

class TransactionItemData {
  String title;
  int amount;
  STATUS status;
  Widget image;

  TransactionItemData({
    required this.title,
    required this.amount,
    this.status = STATUS.payment,
    this.image = const Icon(
      Icons.shopify,
      size: 40,
      color: Colors.white,
    ),
  });
}

class TransactionItem extends StatelessWidget {
  final TransactionItemData data;
  const TransactionItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  (Color, String, IconData) getTransactionStatus() {
    switch (data.status) {
      case STATUS.payment:
        return (Colors.green, "Payment", Icons.check);
      case STATUS.received:
        return (Colors.blue, "Received", Icons.arrow_downward);
      default:
        return (Colors.green, "Payment", Icons.payment);
    }
  }

  @override
  Widget build(BuildContext context) {
    var (statusColor, statusText, statusIcon) = getTransactionStatus();

    return Container(
      margin: const EdgeInsets.only(top: 18),
      height: 64,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.black,
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: statusColor.withOpacity(0.15),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            statusIcon,
                            size: 14,
                            color: statusColor,
                          ),
                        ),
                        TextSpan(
                          text: statusText,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 1),
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
                      NumberFormat.simpleCurrency(decimalDigits: 0)
                          .format(data.amount)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
