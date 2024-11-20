import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/home/widgets/stationBox.dart';
import 'package:flutter_train_app/Pages/seat/seatPage.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //stationBox로부터 넘겨받은 데이터를 저장하기 위한 class 변수
  late String Departure;
  late String Arrival;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('기차 예매')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationBox(
              //onStationSelected와 연결된 onDepartureSelected의 매개변수 selectedDeparture를 class 변수 Departure에 대입
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
            //좌석 선택 버튼
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () async {
                      //선택된 역의 정보를 SeatPage로 넘겨줌
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
