import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/utils/custom_colors.dart';
import 'package:weatherapp/widgets/details_widget.dart';

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

        //windSpeed , cloud , humidity
        Column(

          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                DetailsWidget(imageLink: 'assets/windspeed.png', value: '${globalController.getWeatherData()?.current.windSpeed} Km/h'),
                DetailsWidget(imageLink: 'assets/clouds.png', value: '${globalController.getWeatherData()?.current.cloudcover} %'),
                DetailsWidget(imageLink: 'assets/humidity.png', value: '${globalController.getWeatherData()?.current.humidity} %'),

              ],
            ),



          ],
        ),



        const SizedBox(height: 30,),



        // windDir, visibility
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            DetailsWidget(imageLink: 'assets/compass.png', value: '${globalController.getWeatherData()?.current.windDir} '),
            DetailsWidget(imageLink: 'assets/visibility_img.png', value: '${globalController.getWeatherData()?.current.visibility} '),

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
