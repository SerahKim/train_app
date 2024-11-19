import 'package:flutter/material.dart';

class SeatInfo extends StatelessWidget {
  SeatInfo(this.selectedRowName, this.selectedColNum, this.onSelectedSeat);

  String selectedRowName;
  int selectedColNum;
  void Function(String row, int col) onSelectedSeat;

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; //다크모드를 위한 변수
    return Expanded(
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            seatName('A', isDarkMode),
            SizedBox(width: 4),
            seatName('B', isDarkMode),
            SizedBox(width: 4),
            SeatNum(),
            SizedBox(width: 4),
            seatName('C', isDarkMode),
            SizedBox(width: 4),
            seatName('D', isDarkMode),
          ],
        ),
      ),
    );
  }

  Column seatName(String seatname, bool isDarkMode) {
    //A, B, C, D
    return Column(
      children: [
        Text(
          seatname,
          style: TextStyle(fontSize: 20),
        ),
        for (int i = 1; i <= 20; i++) seat(seatname, i, isDarkMode)
      ],
    );
  }

  Widget seat(String rowName, int colNum, bool isDarkMode) {
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
                      : isDarkMode
                          ? Colors.grey[700]
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
