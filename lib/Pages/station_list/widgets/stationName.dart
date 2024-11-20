import 'package:flutter/material.dart';

class StationName extends StatefulWidget {
  StationName({required this.stationname});
  final String stationname;

  @override
  State<StationName> createState() => _StationNameState();
}

class _StationNameState extends State<StationName> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        Theme.of(context).brightness == Brightness.dark; //다크모드를 위한 변수
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!, //container의 바닥 부분에만 색을 줌.
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context,
              widget.stationname); // 역을 선택하면 선택된 값이 반환되며, 이전 페이지인 홈페이지로 이동
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.stationname,
              style: TextStyle(
                color: isDarkMode ? Colors.grey[300]! : Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
