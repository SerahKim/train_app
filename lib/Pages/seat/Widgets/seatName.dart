import 'package:flutter/material.dart';

Column ColumnSeat(String ColumnName) {
  //A, B, C, D
  return Column(
    children: [
      Text(
        ColumnName,
        style: TextStyle(fontSize: 20),
      ),
      for (int i = 1; i <= 20; i++) seat()
    ],
  );
}

Widget seat() {
  //A, B, C, D 좌석
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: SizedBox(
      width: 50,
      height: 50,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300]!, borderRadius: BorderRadius.circular(8)),
        ),
      ),
    ),
  );
}

Column SeatNum() {
  //1, 2, 3, 4
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
