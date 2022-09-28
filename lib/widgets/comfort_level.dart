import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/utils/custom_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherData;
  const ComfortLevel({Key? key, required this.WeatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 20,),
          child: const Text(
            'Comfort Level',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          ),
        ),

        SizedBox(
          height: 180,
          child: SleekCircularSlider(
            min: 0,
            max: 100,
            initialValue: WeatherData.current.humidity.toDouble() ?? '',

            appearance: CircularSliderAppearance(

              size: 150,
              animationEnabled: true,

              customWidths: CustomSliderWidths(
                trackWidth: 12,
                progressBarWidth: 12,
                handlerSize: 0,
              ),
              
              customColors: CustomSliderColors(
                 hideShadow: true,
                 trackColor:
                     CustomColors.firstGradientColor.withAlpha(100),
                progressBarColors: [
                  CustomColors.firstGradientColor,
                  CustomColors.secondGradientColor,
                ],
              ),

              infoProperties: InfoProperties(
                bottomLabelText: 'Humidity',
                bottomLabelStyle: const TextStyle(
                  fontSize: 14,
                  letterSpacing: 0.3,
                  height: 1,

                ),
              ),
            ),

          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
            text: TextSpan(
               children: [
                 const TextSpan(
                    text: 'Feels Like ',
                      style:  TextStyle(
                          fontSize: 14,
                          height: 1,
                        color: CustomColors.textColorBlack,
    ),

        ),
                 TextSpan(
                   text: '${WeatherData.current.feelslike.toInt()}' ?? '',
                   style:  const TextStyle(
                     fontSize: 14,
                     height: 1,
                     color: CustomColors.textColorBlack,
                   ),

                 ),
    ],
    ),
        ),

            Container(
              height: 25,
              width: 1,
              margin: const EdgeInsets.only(left: 40, right: 40),
              color: CustomColors.dividerLine,
            ),


            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'UV Index ',
                    style:  TextStyle(
                      fontSize: 14,
                      height: 1,
                      color: CustomColors.textColorBlack,
                    ),

                  ),
                  TextSpan(
                    text: '${WeatherData.current.uvIndex.toInt()}' ?? '',
                    style:  const TextStyle(
                      fontSize: 14,
                      height: 1,
                      color: CustomColors.textColorBlack,
                    ),

                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
