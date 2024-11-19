import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class StationBox extends StatelessWidget {
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
                  onStationSelected: onDepartureSelected,
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
                  onStationSelected: onArrivalSelected,
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
  final void Function(String selectedStation) onStationSelected;

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
          widget.departureorarrival,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.grey[400] : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () async {
            final selectedStation = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StationListPage(
                  departureOrarrival: widget.departureorarrival,
                ),
              ),
            );
            if (selectedStation != null) {
              setState(() {
                selectedStationName = selectedStation;
              });
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
