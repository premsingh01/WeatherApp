import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String date = DateFormat('yMMMMd').format(DateTime.now());

  final GlobalController globalController = Get.find<GlobalController>();


  @override
  void initState() {
    getAddress(globalController.getLatitude().value , globalController.getLongitude().value);

    super.initState();
  }

  getAddress(lat , lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    print(placemarks);

    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: const TextStyle(
                fontSize: 35,
                height: 2,
              ),
            ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
              date,
            style:  const TextStyle(
              color: Colors.black54,
              height: 1.5,
            ),
          ),

        ),
        // Container(
        //   margin: const EdgeInsets.only(left: 20, right: 20),
        //   alignment: Alignment.topLeft,
        //   child: Text(
        //     globalController.getWeatherData()?.current.temperature.toString() ?? '',
        //     style: const TextStyle(
        //       fontSize: 35,
        //       height: 2,
        //     ),
        //   ),
        // ),
        // Container(
        //   margin: const EdgeInsets.only(left: 20, right: 20),
        //   alignment: Alignment.topLeft,
        //   child: Image.network(
        //     globalController.getWeatherData()?.current.weatherIcons.first.toString() ?? '',
        //   ),
        // ),
      ],
    );
  }
}
