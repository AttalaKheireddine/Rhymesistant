import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rhymesistant/scraping.dart';

class Rhymeside extends StatefulWidget{
  const Rhymeside({super.key});
  @override
  State<Rhymeside> createState() => _RhymesideState();
}

class _RhymesideState extends State<Rhymeside> {
  Widget _bottomWidge = Text("Waiting for LOWERCASE inputs.... (Also don't use this app "
      "for non-restricted poem writing pretty please :) )");
  @override
  Widget build(BuildContext context) {
    final rhymeTextFieldController = TextEditingController();
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
                      onSubmitted: (value){
                        setState((){ _bottomWidge = makeFutureBuilderForWord(value.toLowerCase());});
                      },
                      textAlign: TextAlign.center,
                    controller: rhymeTextFieldController,

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
              ElevatedButton(child: Text("Find", style: TextStyle(color: Colors.black87),), onPressed: (){
                setState(() {
                  String input = rhymeTextFieldController.text.trim().toLowerCase();
                  _bottomWidge = makeFutureBuilderForWord(input);
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFB6D6E3)),),
              SizedBox(width: 70,),
            ],
          ),
        ),
      Expanded(child:Padding(padding: EdgeInsets.symmetric(
        vertical: 15, horizontal: 15
      ),
     child: _bottomWidge,))],
    );
  }

  Widget makeFutureBuilderForWord(String word){

    return FutureBuilder(
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error} occurred',
              style: TextStyle(fontSize: 18),
            ),
          );

          // if we got our data
        } else if (snapshot.hasData) {
          // Extracting data from snapshot object
          final data = snapshot.data as List<String>;
          if (data.isEmpty) {return Text("NoRhymesFound, check spelling or internet connection");}
          return wrapFromWords(data, context);
        }}

    return CircularProgressIndicator();
  }, future: scrape(word),);}
}

Widget wrapFromWords(List<String> words, BuildContext context){

  return SingleChildScrollView(
    child: Wrap(
      spacing: 10.0, // Space between children
      runSpacing: 10.0, // Space between lines
      children: List.generate(
        words.length,
            (index) => Container(
            decoration: BoxDecoration(
              border : Border.all(color: Colors.black87),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(padding: const EdgeInsets.symmetric(
                horizontal: 8,vertical: 8
            )
                ,child: Text(words[index],
                  style: const TextStyle(
                    fontSize: 20,
                      fontFamily: "Roboto",
                      color: Colors.black87
                  ),))),
      )
    ));
}

