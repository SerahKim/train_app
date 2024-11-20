import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class StationBox extends StatelessWidget {
  //_DepartureOrArrivalState에서 넘겨준 값을 받기 위한 변수
  StationBox({
    required this.onDepartureSelected,
    required this.onArrivalSelected,
  });

  final void Function(String selectedDeparture) onDepartureSelected;
  final void Function(String selectedArrival) onArrivalSelected;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; //다크모드를 위한 변수

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.maxFinite,
        height: 200,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Container(
                width: 100,
                child: DepartureOrArrival(
                  departureorarrival: '출발역',
                  onStationSelected:
                      onDepartureSelected, //_DepartureOrArrivalState와 연결
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
                child: DepartureOrArrival(
                  departureorarrival: '도착역',
                  onStationSelected:
                      onArrivalSelected, // //_DepartureOrArrivalState와 연결
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DepartureOrArrival extends StatefulWidget {
  DepartureOrArrival({
    required this.departureorarrival,
    required this.onStationSelected,
  });

  String departureorarrival;
  final void Function(String selectedStation)
      onStationSelected; // 선택된 역의 정보를 넘겨주기 위한 함수

  @override
  State<DepartureOrArrival> createState() => _DepartureOrArrivalState();
}

class _DepartureOrArrivalState extends State<DepartureOrArrival> {
  String selectedStationName = '선택';

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; //다크모드를 위한 변수

    return Column(
      children: [
        Text(
          widget
              .departureorarrival, //DepartureOrArrival에서 정의된 departureorarrival를 _DepartureOrArrivalState에서 사용, DepartureOrArrival은 stationBox로부터 값을 받는다.
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () async {
            //StationListPage로부터 반환 값을 받는 부분
            final selectedStation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StationListPage(
                  departureOrarrival: widget.departureorarrival,
                ),
              ),
            );
            //stationListPage로부터 역을 반환받은 경우, 즉 역이 선택된 경우
            if (selectedStation != null) {
              setState(() {
                selectedStationName = selectedStation;
              });
              //onStationSelected의 매개 변수에 selectedStation을 대입하여 선택된 역 정보 전달
              widget.onStationSelected(selectedStation);
            }
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              selectedStationName,
              style: TextStyle(
                fontSize: 40,
                color: isDarkMode ? Colors.grey[300] : Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
