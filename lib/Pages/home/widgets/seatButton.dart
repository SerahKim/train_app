import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/home/widgets/stationBox.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class SeatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SeatPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text(
              '좌석 선택',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
