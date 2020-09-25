import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  width: 250,
                  height: 250,
                ),
              ),
              height: 160,
            )),
            Positioned(
              child: Container(
                  height: 154,
                  child: Align(
                    child: Text(
                      "GO",
                      style: TextStyle(
                        fontSize: 140,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.04,
              right: MediaQuery.of(context).size.width * 0.2,
              child: Container(
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.32,
              child: Container(
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
