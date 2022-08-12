

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/home_layout/get_location/get_location.dart';
import 'package:weather_app/home_layout/models/weather_model.dart';
import 'package:weather_app/home_layout/shared/remote.dart';

class HomeLayout extends  StatelessWidget {

  var client = WeatherData();
  WeatherModel? data ;


  info()async{
    var position =await GetPosition();
    data = await client.getData(position.latitude,position.longitude);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String dateAndTime ='${DateTime.now()}';
    String x = dateAndTime.substring(0, 10);

    return Scaffold(
      backgroundColor: Color(0xff081b25),
      body: FutureBuilder(
        future: info(),
        builder: (context,snapshot)=> data==null ? const Center(child: CircularProgressIndicator()) : Column(
          children: [
            Container(
              height: size.height*0.75,
              width: size.width,
              margin: const EdgeInsets.only(left: 15.0,right: 15.0,),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40.0),
                  gradient:const LinearGradient(
                    colors: [
                      Color(0xff955cd1),
                      Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.2,0.85],
                  )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?.cityName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 26.0,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    x,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.white.withOpacity(0.55),
                    ),
                  ),
                  Image(image: NetworkImage('https:${data?.icon}'),width: size.width*0.5,fit: BoxFit.fill,),
                  Text(
                    data?.condition,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      color: Colors.white.withOpacity(0.75),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data?.temp}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                          color: Colors.white.withOpacity(0.90,),
                        ),
                      ),
                      Text(
                        'o',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          color: Colors.white.withOpacity(0.90,),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0,),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Image(image: AssetImage('assets/images/wind.png'),width: 40.0,height: 40.0,),
                            const SizedBox(height: 10.0,),
                            Text(
                              '${data?.wind} km/h',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.57),
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Text(
                              'Wind',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.55),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Image(image: AssetImage('assets/images/cloud.png'),width: 40.0,height: 40.0,),
                            const SizedBox(height: 10.0,),
                            Text(
                              '${data?.humidity}',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.57),
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.55),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Image(image: AssetImage('assets/images/wind_dir.png'),width: 40.0,height: 40.0,),
                            const SizedBox(height: 10.0,),
                            Text(
                              data?.windDirection,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white.withOpacity(0.57),
                              ),
                            ),
                            const SizedBox(height: 12.0,),
                            Text(
                              'Wind Direction',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                color: Colors.white.withOpacity(0.55),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Gust',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.gust} kp/h',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(height: 26.0,),
                      const Text(
                        'Pressure',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.pressure} hpa',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     const Text(
                        'UV',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.uv}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(height: 26.0,),
                      const Text(
                        'Precipitation',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.pricipition} mm',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     const Text(
                        'Wind',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.wind} km/h',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.65),
                        ),
                      ),
                      const SizedBox(height: 26.0,),
                      const Text(
                        'Last Update',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.white30,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        '${data?.lastUpdate}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Colors.green.withOpacity(0.65),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}



