import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/home/homePage.dart';
import 'package:flutter_train_app/Pages/home/widgets/stationBox.dart';
import 'package:flutter_train_app/Pages/seat/Widgets/seatInfo.dart';
import 'package:flutter_train_app/Pages/station_list/stationlistPage.dart';

class SeatPage extends StatefulWidget {
  SeatPage({required this.departureStation, required this.arrivalStation});

  String departureStation;
  String arrivalStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  late String departureStation;
  late String arrivalStation;
  String selectedRowName = '';
  int selectedColNum = 0;

  @override
  void initState() {
    super.initState();
    departureStation = widget.departureStation; // widget의 값으로 초기화
    arrivalStation = widget.arrivalStation;
  }

  void onSelecetedSeat(String row, int col) {
    setState(() {
      selectedRowName = row;
      selectedColNum = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; //다크모드를 위한 변수
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          Row(
            // 출발역과 도착역을 확인할 수 있는 부분
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                departureStation,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              Text(
                arrivalStation,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            //선택됨, 선택안됨
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  )),
              SizedBox(width: 4),
              Text(
                '선택됨',
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[700] : Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(8),
                  )),
              SizedBox(width: 4),
              Text(
                '선택안됨',
              ),
            ],
          ),
          SizedBox(height: 20),
          SeatInfo(selectedRowName, selectedColNum, onSelecetedSeat),
          Container(
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('예약하시겠습니까?'),
                          content: Text('좌석 : $selectedRowName' +
                              '-' +
                              '$selectedColNum'),
                          actions: [
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('취소',
                                  style: TextStyle(color: Colors.red)),
                            ),
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  '예매하기',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
