// ignore_for_file: must_be_immutable

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:payment_app/widgets/creditCard/creditCard.dart';

enum CodeType { barcode, qrCode }

class CardPayment extends StatefulWidget {
  CardData? cardData;
  DraggableScrollableController? controller;
  CardPayment({Key? key, this.cardData, this.controller}) : super(key: key);

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  bool pointStatus = true;
  bool couponStatus = false;
  CodeType codeType = CodeType.barcode;

  Map<bool, Color> statusColor = {
    true: const Color(0xFFd5a4d9),
    false: const Color(0xFFd8d8d8),
  };

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0,
      maxChildSize: 1,
      initialChildSize: 0,
      controller: widget.controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => widget.controller?.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 25,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CreditCard(
                                creditCardNumber:
                                    widget.cardData?.creditCardNumber ?? "0000-0000-0000-0000",
                                expiresDate: widget.cardData?.expiresDate ?? "99/99",
                                balance: widget.cardData?.balance ?? 0,
                                cardType: widget.cardData?.cardType ?? CARDTYPE.VISA,
                                cardColor: widget.cardData?.cardColor ?? const Color(0xFF1c1c1c),
                                primaryTextColor: widget.cardData?.primaryTextColor ?? Colors.white,
                                secondaryTextColor:
                                    widget.cardData?.secondaryTextColor ?? Colors.white,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 26,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.monetization_on,
                                          color: statusColor[pointStatus],
                                          size: 22,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          NumberFormat.currency(decimalDigits: 0, symbol: "")
                                              .format(10000)
                                              .toString(),
                                          style: TextStyle(
                                            color: statusColor[pointStatus],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 26,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pointStatus = !pointStatus;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "使用回饋",
                                            style: TextStyle(
                                              color: statusColor[pointStatus],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 18,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(
                                                width: 1,
                                                color: statusColor[pointStatus]!,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.done,
                                              color: statusColor[pointStatus],
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Color(0xFFf5f5f5),
                                height: 20,
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 26,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.confirmation_number,
                                          color: statusColor[couponStatus],
                                          size: 22,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          NumberFormat.currency(decimalDigits: 0, symbol: "")
                                              .format(0)
                                              .toString(),
                                          style: TextStyle(
                                            color: statusColor[couponStatus],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 26,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          couponStatus = !couponStatus;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "選擇優惠券",
                                            style: TextStyle(
                                              color: statusColor[couponStatus],
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 18,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(
                                                width: 1,
                                                color: statusColor[couponStatus]!,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward,
                                              color: statusColor[couponStatus],
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Color(0xFFf5f5f5),
                                height: 20,
                                thickness: 2,
                              ),
                              Row(
                                children: [
                                  CodeTypeSelector(
                                    codeType: CodeType.barcode,
                                    color: statusColor[codeType == CodeType.barcode]!,
                                    icon: MdiIcons.barcode,
                                    text: "條碼",
                                    onTap: (CodeType type) {
                                      setState(() {
                                        codeType = type;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CodeTypeSelector(
                                    codeType: CodeType.qrCode,
                                    color: statusColor[codeType == CodeType.qrCode]!,
                                    icon: MdiIcons.qrcode,
                                    text: "QR Code",
                                    onTap: (CodeType type) {
                                      setState(() {
                                        codeType = type;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              BarcodeWidget(
                                height: codeType == CodeType.barcode ? 100 : 200,
                                barcode: codeType == CodeType.barcode
                                    ? Barcode.code128()
                                    : Barcode.qrCode(),
                                textPadding: 10,
                                data: '1203127398137',
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CodeTypeSelector extends StatefulWidget {
  Color color;
  IconData icon;
  String text;
  CodeType codeType;
  Function(CodeType)? onTap;
  CodeTypeSelector({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.codeType,
    this.onTap,
  }) : super(key: key);

  @override
  State<CodeTypeSelector> createState() => _CodeTypeSelectorState();
}

class _CodeTypeSelectorState extends State<CodeTypeSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call(widget.codeType);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: widget.color,
            size: 24,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
