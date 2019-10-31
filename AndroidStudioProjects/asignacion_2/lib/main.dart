import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  BlendMode _blendMode;
  Color _color;

  @override
  void initState() {
    super.initState();
    _blendMode = BlendMode.difference;
    _color = Colors.purple;
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Image Filter App'),
        ),
      ),
      body: SingleChildScrollView(
        child: _image == null
            ? Center(
                child: Text('Please take a Photo'),
              )
            : Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter: ColorFilter.mode(
                              _color,
                              BlendMode.difference,
                            ),
                          ),
                          onPressed: () => setState(() {
                            _blendMode = BlendMode.difference;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter: ColorFilter.mode(
                              _color,
                              BlendMode.darken,
                            ),
                          ),
                          onPressed: () => setState(() {
                            _blendMode = BlendMode.darken;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter: ColorFilter.mode(
                              _color,
                              BlendMode.colorDodge,
                            ),
                          ),
                          onPressed: () => setState(() {
                            _blendMode = BlendMode.colorDodge;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter: ColorFilter.mode(
                              _color,
                              BlendMode.colorBurn,
                            ),
                          ),
                          onPressed: () => setState(() {
                            _blendMode = BlendMode.colorBurn;
                          }),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter:
                                ColorFilter.mode(Colors.purple, _blendMode),
                          ),
                          onPressed: () => setState(() {
                            _color = Colors.purple;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter:
                                ColorFilter.mode(Colors.redAccent, _blendMode),
                          ),
                          onPressed: () => setState(() {
                            _color = Colors.redAccent;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter:
                                ColorFilter.mode(Colors.blueGrey, _blendMode),
                          ),
                          onPressed: () => setState(() {
                            _color = Colors.blueGrey;
                          }),
                        ),
                      ),
                      Container(
                        width: 75,
                        height: 75,
                        child: FlatButton(
                          child: ColorFiltered(
                            child: Image.file(_image),
                            colorFilter:
                                ColorFilter.mode(Colors.orange, _blendMode),
                          ),
                          onPressed: () => setState(() {
                            _color = Colors.orange;
                          }),
                        ),
                      ),
                    ],
                  ),
                  ColorFiltered(
                    child: Container(
                      width: double.infinity,
                      child: Image.file(
                        _image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    colorFilter: ColorFilter.mode(_color, _blendMode),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
