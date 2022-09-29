import 'package:flutter/material.dart';
import 'package:weatherapp/utils/custom_colors.dart';

class DetailsWidget extends StatelessWidget {
  final String imageLink;
  final  value;
  const DetailsWidget({Key? key, required this.imageLink, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 60,
      child: Column(
        children: [

          //Images From asset
          Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CustomColors.cardColor,
              borderRadius: BorderRadius.circular(10),
          ),

            child: Image.asset(imageLink),

          ),

          //Data Value from API
          SizedBox(
            height: 20,
            width: 50,
            child: Text(
              value.toString(),
            style: const TextStyle(
              fontSize: 12,
            ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
