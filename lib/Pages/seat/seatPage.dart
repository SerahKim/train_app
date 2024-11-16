import 'package:flutter/material.dart';
import 'package:flutter_train_app/Pages/seat/Widgets/seatName.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              TextButton(
                //버튼을 클릭하면
                onPressed: () {},
                child: Text(
                  '출발역',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
              ),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
              TextButton(
                onPressed: () {},
                child: Text(
                  '도착역',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
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
                    color: Colors.grey[300]!,
                    borderRadius: BorderRadius.circular(8),
                  )),
              SizedBox(width: 4),
              Text(
                '선택안됨',
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColumnSeat('A'),
                  SizedBox(width: 4),
                  ColumnSeat('B'),
                  SizedBox(width: 4),
                  SeatNum(),
                  SizedBox(width: 4),
                  ColumnSeat('C'),
                  SizedBox(width: 4),
                  ColumnSeat('D'),
                ],
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {},
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
