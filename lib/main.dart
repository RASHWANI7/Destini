import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          ' destini ',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.values[2],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    storyBrain.getstory(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),

              //the first button
              Padding(
                padding: const EdgeInsets.fromLTRB(1, 20, 1, 5),
                child: MaterialButton(
                  padding: EdgeInsets.all(9),
                  color: Colors.cyan,
                  height: 50,
                  onPressed: () {
                    setState(() {
                      storyBrain.nextstory(1);
                    });
                  },
                  child: Text(
                    storyBrain.getchoice1(),
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              //the second button
              Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: MaterialButton(
                    padding: EdgeInsets.all(4),
                    color: Colors.cyan[400],
                    height: 50,
                    onPressed: () {
                      setState(() {
                        storyBrain.nextstory(2);
                      });
                    },
                    child: Text(
                      storyBrain.getchoice2(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
