import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Rhymeside extends StatefulWidget{
  const Rhymeside({super.key});
  @override
  State<Rhymeside> createState() => _RhymesideState();
}

class _RhymesideState extends State<Rhymeside> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:50,
          color: Color(0xFF618898),
          child: Row(
            children: [
              SizedBox(width: 50,),
              Expanded(
                  child:Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      filled: true,
                      fillColor: Color(0xFFEEEEEE),

                      hintText: 'Find rhymes for:',
                    ),
                  ),
              )),
              SizedBox(width: 50,),
              ElevatedButton(child: Text("Find", style: TextStyle(color: Colors.black87),), onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFB6D6E3)),),
              SizedBox(width: 70,),
            ],
          ),
        ),
      Padding(padding: EdgeInsets.symmetric(
        vertical: 10
      ),
      child:Wrap(
        spacing: 10.0, // Space between children
        runSpacing: 10.0, // Space between lines
        children: List.generate(
        10,
    (index) => Container(
      decoration: BoxDecoration(
          border : Border.all(color: Colors.black87),
          borderRadius: BorderRadius.all(Radius.circular(10)),

      ),
        child: Padding(padding: EdgeInsets.symmetric(
          horizontal: 8,vertical: 8
        )
            ,child: Text("Legendary"+(index).toString(),
            style: TextStyle(
              fontFamily: "Roboto",
              color: Colors.black87
            ),))),
        )
      ))],
    );
  }
}