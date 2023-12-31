import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/widgets/creditCard/creditCard.dart';

class CardsCarousel extends StatefulWidget {
  final List<CardData> cardData;
  final Function(CardData)? onCardSelected;
  const CardsCarousel({Key? key, this.cardData = const [], this.onCardSelected}) : super(key: key);

  @override
  State<CardsCarousel> createState() => _CardsCarouselState();
}

class _CardsCarouselState extends State<CardsCarousel> {
  final CarouselController _controller = CarouselController();
  int _current = 0;
  List<Widget> cards = [];

  @override
  void initState() {
    cards = widget.cardData
        .map(
          (e) => GestureDetector(
            onTap: () => widget.onCardSelected?.call(e),
            child: CreditCard(
              creditCardNumber: e.creditCardNumber,
              expiresDate: e.expiresDate,
              balance: e.balance,
              cardType: e.cardType,
              cardColor: e.cardColor,
              primaryTextColor: e.primaryTextColor,
              secondaryTextColor: e.secondaryTextColor,
            ),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: cards,
          carouselController: _controller,
          options: CarouselOptions(
            height: 220,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            viewportFraction: 0.85,
            enableInfiniteScroll: false,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cards.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(_current == entry.key ? 0.7 : 0.2),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
