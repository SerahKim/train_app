import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';
import 'package:flutter_train_app/Pages/station_list/widgets/stationName.dart';

class StationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.maxFinite,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: DepatureOrArrival(
                depatureorarrival: '출발역',
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: DepatureOrArrival(depatureorarrival: '도착역'),
            ),
          ],
        ),
      ),
    );
  }
}

class DepatureOrArrival extends StatelessWidget {
  DepatureOrArrival({required this.depatureorarrival});

  String depatureorarrival;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          depatureorarrival,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        StationListPage(depatureOrarrival: depatureorarrival)));
          },
          child: Text(
            '선택',
            style: TextStyle(fontSize: 40, color: Colors.black),
          ),
        )
      ],
    );
  }
}
