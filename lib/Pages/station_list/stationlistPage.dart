import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/station_list/widgets/stationName.dart';

class StationListPage extends StatelessWidget {
  StationListPage({required this.departureOrarrival});
  String departureOrarrival;

  @override
  Widget build(BuildContext context) {
    final List<String> stations = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산'
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(departureOrarrival),
        ),
        body: ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, index) {
            return StationName(
                stationname: stations[index]); //StationListPage의 return 값
          },
        ));
  }
}
