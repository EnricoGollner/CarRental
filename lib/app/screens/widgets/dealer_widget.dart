import 'package:car_tental/app/data.dart';
import 'package:flutter/material.dart';

class DealerWidget extends StatelessWidget {
  final int index;
  final Dealer dealer;

  const DealerWidget({super.key, required this.index, required this.dealer});

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
    width: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image), 
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          height: 60,
          width: 60,
        ),

        const SizedBox(height: 16),

        Text(
          dealer.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        Text(
          "${dealer.offers} offers",
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
  }
}