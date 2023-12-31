import 'dart:async';

import 'package:flutter/material.dart';
import 'package:payment_app/pages/cards/cardPayment.dart';
import 'package:payment_app/pages/cards/cardsCarousel.dart';
import 'package:payment_app/pages/cards/transactionBottomSheet.dart';
import 'package:payment_app/widgets/creditCard/creditCard.dart';
import 'package:payment_app/widgets/myAppBar/myAppBar.dart';
import 'package:payment_app/widgets/myBottomNavigationBar/myBottomNavigationBar.dart';
import 'package:payment_app/widgets/myNavigationBar/myNavigationBar.dart';
import 'package:payment_app/pages/cards/transactionItem.dart';

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
  List<TransactionItemData> transactions = [
    TransactionItemData(
      title: "Apple Store",
      amount: 100000,
      status: STATUS.payment,
      image: Container(
        padding: const EdgeInsets.all(16),
        child: Image.network(
          "https://help.apple.com/assets/6491EB2FBC8EFD312D732C43/6491EB31BC8EFD312D732C4B/zh_TW/cfef5ce601689564e0a39b4773f20815.png",
          height: 40,
          width: 40,
          color: Colors.white,
        ),
      ),
    ),
    TransactionItemData(
      title: "Sydney",
      amount: 130,
      status: STATUS.received,
      image: Image.network(
        "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw3NjA4Mjc3NHx8ZW58MHx8fHx8",
        height: 64,
        width: 64,
      ),
    ),
    TransactionItemData(
      title: "Google Play",
      amount: 1300,
      status: STATUS.payment,
      image: Container(
        padding: const EdgeInsets.all(16),
        child: Image.network(
          "https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Logo_Play_512px_clr_nGVTgYY.width-500.format-webp.webp",
          height: 40,
          width: 40,
        ),
      ),
    ),
    TransactionItemData(
      title: "Anong0u0",
      amount: 100,
      status: STATUS.payment,
      image: Image.network(
        "https://cdn.discordapp.com/avatars/304583413502050313/a_69cbd5456c39abaf373c2b40196dfcd9.webp?size=160",
        height: 40,
        width: 40,
      ),
    )
  ];

  bool isShowBottomNavigationBar = true;

  late Function showBottomNavigationBar;
  late Function noShowBottomNavigationBar;
  List<Timer> timers = [];

  DraggableScrollableController cardPaymentController = DraggableScrollableController();
  CardData? selectedCardData;

  Function debounce(Function fn, Duration duration) {
    Timer? t;
    return () {
      t?.cancel();
      t = Timer(duration, () {
        fn.call();
      });
      timers.add(t!);
    };
  }

  Function throttle(Function fn, Duration duration) {
    Timer? t;
    return () {
      if (t != null) return;
      t = Timer(duration, () {
        fn.call();
        t = null;
      });
      timers.add(t!);
    };
  }

  @override
  void initState() {
    showBottomNavigationBar = debounce(
      () => setState(() => isShowBottomNavigationBar = true),
      const Duration(milliseconds: 800),
    );
    noShowBottomNavigationBar = throttle(
      () => setState(() => isShowBottomNavigationBar = false),
      const Duration(milliseconds: 50),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer t = Timer(const Duration(seconds: 2), () {
        setState(() => isShowBottomNavigationBar = false);
      });
      timers.add(t);
    });
    super.initState();
  }

  @override
  void dispose() {
    for (var timer in timers) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Stack(
        children: [
          const MyNavigationBar(title: "Cards"),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: CardsCarousel(
              cardData: cardData,
              onCardSelected: (cardData) {
                setState(() {
                  selectedCardData = cardData;
                  cardPaymentController.animateTo(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              },
            ),
          ),
          TransactionBottomSheet(
            transactions: transactions,
            onScrollNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                noShowBottomNavigationBar();
              } else if (scrollNotification is ScrollUpdateNotification) {
                noShowBottomNavigationBar();
              } else if (scrollNotification is ScrollEndNotification) {
                showBottomNavigationBar();
              }
            },
          ),
          CardPayment(
            cardData: selectedCardData,
            controller: cardPaymentController,
          ),
        ],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: isShowBottomNavigationBar ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: const MyBottomNavigationBar(initIndex: 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
