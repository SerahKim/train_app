import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/home/widgets/seatButton.dart';
import 'package:flutter_train_app/Pages/home/widgets/stationBox.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text('기차 예매')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationBox(),
            SizedBox(
              height: 20,
            ),
            SeatButton()
          ],
        ));
  }
}
