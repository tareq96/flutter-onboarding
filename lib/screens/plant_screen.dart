import 'package:flutter/material.dart';
import 'package:plant_shop/animations/fadeAnimation.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/static_data/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class PlantScreen extends StatefulWidget {
  final Plant plant;

  PlantScreen({this.plant});

  @override
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.support_1,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  color: MyColors.primaryColor,
                  height: 550.0,
                  padding: EdgeInsets.fromLTRB(25.0, 50.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: MyColors.support_1,
                              size: 30.0,
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {
                              print('Cart icon pressed');
                            },
                            padding: EdgeInsets.all(10.0),
                            shape: CircleBorder(),
                            elevation: 2.0,
                            child: Icon(
                              Icons.shopping_cart,
                              color: MyColors.support_1,
                              size: 35.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      FadeAnimation(
                        0,
                        [
                          Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 1.0)),
                          Track("translateX").add(Duration(milliseconds: 600), Tween(begin: -MediaQuery.of(context).size.width, end: 0.0)),
                        ],
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.plant.category.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: MyColors.support_1.withOpacity(0.7),
                                    letterSpacing: 1.1),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                widget.plant.name,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: MyColors.support_1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 40.0),
                              Text(
                                'from'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: MyColors.support_1.withOpacity(0.7),
                                    letterSpacing: 1.1),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '\$${widget.plant.price}',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: MyColors.support_1,
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'size'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            color: MyColors.support_1
                                                .withOpacity(0.7),
                                            letterSpacing: 1.1),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        widget.plant.size,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: MyColors.support_1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.0),
                              RawMaterialButton(
                                onPressed: () {
                                  print('Add to cart pressed');
                                },
                                padding: EdgeInsets.all(15.0),
                                fillColor: MyColors.support_2,
                                shape: CircleBorder(),
                                elevation: 2.0,
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: MyColors.support_1,
                                  size: 35.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 25.0,
                  right: 0.0,
                  child: Hero(
                    tag: widget.plant.imageUrl,
                    child: Image(
                      height: 280.0,
                      width: 280.0,
                      image: AssetImage(widget.plant.imageUrl),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 300.0,
              transform: Matrix4.translationValues(0.0, -20.0, 0.0),
              decoration: BoxDecoration(
                color: MyColors.support_1,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'All to know...',
                        style: TextStyle(
                          wordSpacing: 2.0,
                          fontSize: 30.0,
                          color: MyColors.support_2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        widget.plant.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: MyColors.ui_1,
                          fontWeight: FontWeight.w500,
                          height: 1.5
                        ),
                      ),
                    ],
                  ),
                ),            
            ),
          ],
        ),
      ),
    );
  }
}
