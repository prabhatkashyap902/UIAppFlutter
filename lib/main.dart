import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Stateful Widget App",
    home: Scaffold(
      appBar: AppBar(),
      body: FavouriteCity(),
    ),
  ));
}

class FavouriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Favourite();
  }
}

class _Favourite extends State<FavouriteCity>{
  String name = "";
  var _currencies =["Rupees","Dollars","Pounds","Others"];
  var _currentCurrencies = "Rupees";

  @override
  Widget build(BuildContext context) {
    debugPrint("build is called!");
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[

          TextField(
            onChanged: (String nameInput){
              setState(() {
                debugPrint("setState is called!");
                name= nameInput;
              });
            },
          ),
          DropdownButton<String>(
            items: _currencies.map((String dropDownStringItem){
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String newValueSelected){
              setState(() {
               this._currentCurrencies=newValueSelected;
              });
            },
            value: _currentCurrencies,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
              child: Text("Your name is $name",
            style: TextStyle(color: Colors.pink)
            )
          )
        ],
      ),
    );
  }
}
