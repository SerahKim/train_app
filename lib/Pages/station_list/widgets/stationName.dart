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
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context, widget.stationname); // 선택된 값 반환
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.stationname,
              style: TextStyle(
                color: Colors.black,
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
