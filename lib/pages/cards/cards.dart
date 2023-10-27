import 'package:flutter/material.dart';
import 'package:payment_app/pages/cards/cardsCarousel.dart';
import 'package:payment_app/pages/cards/transactionBottomSheet.dart';
import 'package:payment_app/widgets/creditCard/creditCard.dart';
import 'package:payment_app/widgets/myAppBar/myAppBar.dart';
import 'package:payment_app/widgets/navgatorBar/navgatorBar.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  List<CardData> cardData = [
    CardData(
      creditCardNumber: "1000-2000-3000-4000",
      expiresDate: "12/24",
      balance: 1000000,
      cardType: CARDTYPE.VISA,
      cardColor: const Color(0xFF1c1c1c),
      primaryTextColor: Colors.white,
      secondaryTextColor: const Color(0xFF6a6a6a),
    ),
    CardData(
      creditCardNumber: "5143-8220-3408-9643",
      expiresDate: "10/24",
      balance: 987000,
      cardType: CARDTYPE.MASTERCARD,
      cardColor: Colors.blue,
      primaryTextColor: Colors.white,
      secondaryTextColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          const NavgatorBar(title: "Cards"),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: CardsCarousel(cardData: cardData),
          ),
          const TransactionBottomSheet(),
        ],
      ),
    );
  }
}
