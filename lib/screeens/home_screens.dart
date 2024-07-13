import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp/constants/constants.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Widget getweathericon(int num) {
    switch (num) {
      case >= 200 && < 300:
        return Image.asset("assets/images/1.png");
      case >= 300 && < 400:
        return Image.asset("assets/images/2.png");
      case >= 500 && < 600:
        return Image.asset("assets/images/3.png");
      case >= 600 && < 700:
        return Image.asset("assets/images/4.png");
      case >= 700 && < 800:
        return Image.asset("assets/images/5.png");
      case == 800:
        return Image.asset("assets/images/6.png");
      case > 800 && <= 804:
        return Image.asset("assets/images/7.png");
      default:
        return Image.asset("assets/images/7.png");
    }
  }

  String getgreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackcolor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ktransparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(5, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-5, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: ktransparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " 📍 ${state.weather.areaName}",
                            style: const TextStyle(
                                color: kwhitecolor,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            getgreeting(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                          getweathericon(state.weather.weatherConditionCode!),
                          Center(
                              child: Text(
                            "${state.weather.temperature!.celsius!.round()}° C",
                            style: const TextStyle(
                                color: kwhitecolor,
                                fontSize: 45,
                                fontWeight: FontWeight.w500),
                          )),
                          Center(
                              child: Text(
                            state.weather.weatherDescription!.toUpperCase(),
                            style: const TextStyle(
                                color: kwhitecolor,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                              child: Text(
                            DateFormat('EEEE dd •')
                                .add_jm()
                                .format(state.weather.date!),
                            style: const TextStyle(
                                color: kwhitecolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          )),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/11.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sunrise",
                                        style: TextStyle(
                                            color: kwhitecolor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat('')
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/12.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sunset",
                                        style: TextStyle(
                                            color: kwhitecolor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat('')
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: kgreycolor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/13.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Max",
                                        style: TextStyle(
                                            color: kwhitecolor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${state.weather.tempMax!.celsius!.round().toString()}°C",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/14.png",
                                    scale: 8,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Temp Min",
                                        style: TextStyle(
                                            color: kwhitecolor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "${state.weather.tempMin!.celsius!.round().toString()}°C",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
