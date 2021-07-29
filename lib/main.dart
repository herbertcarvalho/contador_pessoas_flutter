import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people =0;
  String _infoText ="Pode Entrar!";

  void _changePeople(int delta){
    setState(() {
      _people += delta;
      if(delta<0){
        _infoText="Mundo invertido";
      }else if(delta>10){
        _infoText= "Pode Entrar!";
      }else {
        _infoText= "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas : $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.only(right: 40, top: 20, bottom: 20)),
                  onPressed: () {
                    _changePeople(1);
                  },
                  child: Text(
                    "+1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(padding: EdgeInsets.only(left: 40, top: 20, bottom: 20)),
                  onPressed: () {
                    _changePeople(-1);
                  },
                  child: Text(
                    "-1",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
