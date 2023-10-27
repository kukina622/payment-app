import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum CARDTYPE { VISA, MASTERCARD }

class CardData {
  String creditCardNumber;
  int balance;
  String expiresDate;
  CARDTYPE cardType = CARDTYPE.VISA;
  Color cardColor;
  Color primaryTextColor;
  Color secondaryTextColor;
  CardData({
    required this.creditCardNumber,
    this.balance = 0,
    required this.expiresDate,
    this.cardType = CARDTYPE.VISA,
    this.cardColor = const Color(0xFF1c1c1c),
    this.primaryTextColor = Colors.white,
    this.secondaryTextColor = const Color(0xFF6a6a6a),
  });
}

class CreditCard extends StatelessWidget {
  final String creditCardNumber;
  final int balance;
  final String expiresDate;
  final CARDTYPE cardType;
  final Color cardColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  const CreditCard({
    Key? key,
    required this.creditCardNumber,
    this.balance = 0,
    required this.expiresDate,
    this.cardType = CARDTYPE.VISA,
    this.cardColor = const Color(0xFF1c1c1c),
    this.primaryTextColor = Colors.white,
    this.secondaryTextColor = const Color(0xFF6a6a6a),
  }) : super(key: key);

  Widget cardTypeImage() {
    switch (cardType) {
      case CARDTYPE.VISA:
        return Image.asset(
          "assets/logo/visa.png",
          height: 20,
        );
      case CARDTYPE.MASTERCARD:
        return Image.asset(
          "assets/logo/mastercard.png",
          height: 20,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var formattedCreditCardNumber = creditCardNumber.replaceAll("-", "");
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 221, 221).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: 220,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            alignment: Alignment.centerRight,
            child: cardTypeImage(),
          ),
          const SizedBox(height: 16),
          Text(
            "Balance",
            style: TextStyle(color: secondaryTextColor, fontSize: 12),
          ),
          Text(
            NumberFormat.simpleCurrency(decimalDigits: 0).format(balance),
            style: TextStyle(color: primaryTextColor, fontSize: 28),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                formattedCreditCardNumber.substring(0, 4),
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 18,
                  letterSpacing: 2.5,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "****",
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 16,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "****",
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 16,
                  letterSpacing: 5,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                formattedCreditCardNumber.substring(12, 16),
                style: TextStyle(
                  color: primaryTextColor,
                  fontSize: 18,
                  letterSpacing: 2.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            expiresDate,
            style: TextStyle(
              color: primaryTextColor,
              fontSize: 14,
              letterSpacing: 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
