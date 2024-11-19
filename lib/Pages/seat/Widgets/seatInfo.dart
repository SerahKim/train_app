import 'package:flutter/material.dart';

class SeatInfo extends StatelessWidget {
  SeatInfo(this.selectedRowName, this.selectedColNum, this.onSelectedSeat);

  String selectedRowName;
  int selectedColNum;

  void Function(String row, int col) onSelectedSeat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            seatName('A'),
            SizedBox(width: 4),
            seatName('B'),
            SizedBox(width: 4),
            SeatNum(),
            SizedBox(width: 4),
            seatName('C'),
            SizedBox(width: 4),
            seatName('D'),
          ],
        ),
      ),
    );
  }

  Column seatName(String seatname) {
    //A, B, C, D
    return Column(
      children: [
        Text(
          seatname,
          style: TextStyle(fontSize: 20),
        ),
        for (int i = 1; i <= 20; i++) seat(seatname, i)
      ],
    );
  }

  Widget seat(String rowName, int colNum) {
    //A, B, C, D 좌석
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: 50,
        height: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              onSelectedSeat(rowName, colNum);
              print('열 이름 : $rowName');
              print('행 숫자 : $colNum');
            },
            child: Container(
              decoration: BoxDecoration(
                  color: rowName == selectedRowName && colNum == selectedColNum
                      ? Colors.purple
                      : Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }

  Column SeatNum() {
    //1, 2, 3, 4...
    return Column(
      children: [
        Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
        for (int i = 1; i <= 20; i++) seatNumber(i),
      ],
    );
  }

  Widget seatNumber(int seatnum) {
    //1, 2, 3, 4 좌석
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Container(
        width: 50,
        height: 50,
        child: Center(
            child: Text(
          '$seatnum',
          style: TextStyle(fontSize: 18),
        )),
      ),
    );
  }
}
