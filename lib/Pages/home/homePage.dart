import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/home/widgets/stationBox.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String Departure;
  late String Arrival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text('기차 예매')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationBox(
              onDepartureSelected: (String selectedDeparture) {
                Departure = selectedDeparture;
              },
              onArrivalSelected: (String selectedArrival) {
                Arrival = selectedArrival;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeatPage(
                              departureStation: Departure,
                              arrivalStation: Arrival),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      '좌석 선택',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ));
  }
}
