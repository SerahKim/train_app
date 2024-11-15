import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/station_list/widgets/stationName.dart';

class StationListPage extends StatelessWidget {
  StationListPage({required this.depatureOrarrival});
  String depatureOrarrival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(depatureOrarrival),
        ),
        body: Column(
          children: [
            StationName(stationname: '수서'),
            StationName(stationname: '동탄'),
            StationName(stationname: '평택지제'),
            StationName(stationname: '천안아산'),
            StationName(stationname: '오송'),
            StationName(stationname: '대전'),
            StationName(stationname: '김천구미'),
            StationName(stationname: '동대구'),
            StationName(stationname: '경주'),
            StationName(stationname: '울산'),
            StationName(stationname: '부산'),
          ],
        ));
  }
}
