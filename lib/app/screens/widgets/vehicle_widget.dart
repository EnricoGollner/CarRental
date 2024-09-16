import 'package:car_tental/app/constants.dart';
import 'package:car_tental/app/data.dart';
import 'package:flutter/material.dart';

class VehicleWidget extends StatelessWidget {
  final int? index;
  final Car car;

  const VehicleWidget({super.key, required this.index, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(right: index == null ? 0 : 16, left: index == null ? 0 : 16),
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  car.condition,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: Center(
              child: Image.asset(
              car.images[0],
              fit: BoxFit.fitWidth,
            )
            ),
          ),
          const SizedBox(height: 24),
          Text(
            car.model,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            car.brand,
            style: const TextStyle(
              height: 1,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'per ${car.condition == 'Daily' ? 'day' : car.condition == 'Weekly' ? 'week' : 'day'}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}