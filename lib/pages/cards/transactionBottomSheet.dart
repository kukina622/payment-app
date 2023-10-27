import 'package:flutter/material.dart';
import 'package:payment_app/pages/cards/transactionItem.dart';

class TransactionBottomSheet extends StatefulWidget {
  final List<TransactionItemData> transactions;
  const TransactionBottomSheet({
    Key? key,
    this.transactions = const [],
  }) : super(key: key);

  @override
  State<TransactionBottomSheet> createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.48,
      maxChildSize: 0.9,
      initialChildSize: 0.48,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Transactions",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Recent",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 18,
                                    weight: 700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ...widget.transactions.map((e) => TransactionItem(data: e)).toList(),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 13, bottom: 16),
                        height: 8,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFe6e6e6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
