import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Container(
                width: 100,
                child: DepatureOrArrival(
                  depatureorarrival: '출발역',
                ),
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Container(
                width: 100,
                child: DepatureOrArrival(depatureorarrival: '도착역'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DepatureOrArrival extends StatefulWidget {
  DepatureOrArrival({required this.depatureorarrival});

  String depatureorarrival;

  @override
  State<DepatureOrArrival> createState() => _DepatureOrArrivalState();
}

class _DepatureOrArrivalState extends State<DepatureOrArrival> {
  String name = '선택';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.depatureorarrival,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () async {
            // StationListPage에서 반환되는 값을 받아오는 부분
            final selectedStation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StationListPage(
                    depatureOrarrival: widget.depatureorarrival),
              ),
            );
            if (selectedStation != null) {
              setState(() {
                name = selectedStation; // 반환된 값을 업데이트합니다.
              });
            }
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
