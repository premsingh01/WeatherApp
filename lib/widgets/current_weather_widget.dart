import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/utils/custom_colors.dart';

import 'comfort_level.dart';

class CurrentWeatherWidget extends StatelessWidget  {
  const CurrentWeatherWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find<GlobalController>();

    return Column(
      children: [

        //temperature area
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Container(
              // margin: const EdgeInsets.only(left: 20, right: 20),
              // alignment: Alignment.topLeft,
              child: Image.network(globalController.getWeatherData()?.current.weatherIcons.first.toString() ?? '',
              height: 80,
              width: 80,
              ),
            ),

            Container(
              height: 50,
              width: 1,
              color: CustomColors.dividerLine,
            ),

            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${globalController.getWeatherData()?.current.temperature.toString() ?? 'temp'}°',
                      style: const TextStyle(
                        fontSize: 68,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.textColorBlack,
                      ),
                    ),

                    TextSpan(
                      text: '${globalController.getWeatherData()?.current.weatherDescriptions[0].toString() ?? ''}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.textColorBlack,
                      ),
                    ),

                  ],

                ),
            ),
          ],
        ),

        const Divider(
          height: 40,
          thickness: 1.5,
          indent: 10,
          endIndent: 10,
          color: CustomColors.dividerLine,
        ),


        //more weather details - weather icon, weather description, wind speed, humidity,

        //images onf windSpeed , cloud , humidity
        Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //windspeed
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Image.asset('assets/windspeed.png'),
                ),

                //clouds
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Image.asset('assets/clouds.png'),
                ),

                //humidity
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Image.asset('assets/humidity.png'),
                ),
              ],
            ),



          ],
        ),

        //values of windspeed,clouds,humidity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 50,
              child: Text(
                '${globalController.getWeatherData()?.current.windSpeed} Km/h',
                style: const TextStyle(
                  fontSize: 12,
                ),

                 textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 20,
              width: 50,
              child: Text(
                '${globalController.getWeatherData()?.current.cloudcover} %',
                style: const TextStyle(
                  fontSize: 12,
                ),

                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 20,
              width: 50,
              child: Text(
                '${globalController.getWeatherData()?.current.humidity} %',
                style: const TextStyle(
                  fontSize: 12,
                ),

                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        const SizedBox(height: 30,),


        //images of windDir, visibility
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //windDir
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: CustomColors.cardColor,
                  borderRadius: BorderRadius.circular(10),

              ),
              child: Image.asset('assets/compass.png'),
            ),

            //visibility
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration:  BoxDecoration(
                color: CustomColors.cardColor,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Image.asset('assets/visibility_img.png'),
            ),
          ],
        ),

        //values of winDirection, visibility
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 50,
              child: Text(
                '${globalController.getWeatherData()?.current.windDir} ',
                style: const TextStyle(
                  fontSize: 12,
                ),

                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(
              height: 20,
              width: 50,
              child: Text(
                '${globalController.getWeatherData()?.current.visibility} ',
                style: const TextStyle(
                  fontSize: 12,
                ),

                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        const Divider(
          height: 40,
          thickness: 1.5,
          indent: 10,
          endIndent: 10,
          color: CustomColors.dividerLine,
        ),


        ComfortLevel(WeatherData: globalController.getWeatherData()!),



      ],
    );


  }

}
