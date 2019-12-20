import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:plant_shop/animations/fadeAnimation.dart';
import 'package:plant_shop/models/plant_model.dart';
import 'package:plant_shop/screens/plant_screen.dart';
import 'package:plant_shop/static_data/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int _selectedPage = 0;

  _renderCard(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => PlantScreen(plant: plants[index]),
            )
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 30.0, bottom: 40.0),
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: plants[index].imageUrl,
                      child: Image(
                        height: 280.0,
                        width: 280.0,
                        image: AssetImage(plants[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    right: 30.0,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'From'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 13.0,
                              color: MyColors.support_1.withOpacity(0.7),
                              letterSpacing: 1.1),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '\$${plants[index].price}',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: MyColors.support_1,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 40.0,
                    left: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plants[index].category.toUpperCase(),
                          style: TextStyle(
                              fontSize: 13.0,
                              color: MyColors.support_1.withOpacity(0.7),
                              letterSpacing: 1.2),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          plants[index].name,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: MyColors.support_1,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 100.0,
              child: RawMaterialButton(
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
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.support_1,
        body: ListView(
          padding: EdgeInsets.fromLTRB(25.0, 50.0, 0.0, 0.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1.5,
                  [
                    Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 1.0)),
                    Track("translateY").add(
                            Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
                            curve: Curves.easeOut),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: MyColors.ui_1.withOpacity(0.7),
                          size: 35.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                            color: MyColors.ui_1.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: MyColors.support_2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                  1.5,
                  [
                    Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 1.0)),
                    Track("translateY").add(
                      Duration(milliseconds: 600), Tween(begin: -1550.0, end: 0.0),curve: Curves.easeOut),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          'Top Picks',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.0),
                FadeAnimation(
                  1.5,
                  [
                    Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 1.0)),
                    Track("translateX").add(Duration(milliseconds: 500), Tween(begin: MediaQuery.of(context).size.width, end: 0.0)),
                  ],
                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    labelColor: MyColors.support_2,
                    unselectedLabelColor: MyColors.ui_1.withOpacity(0.5),
                    labelPadding: EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 0.0),
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'Top',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Outdoor',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Indoor',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'New Arrivals',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Limited Edition',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                  1.5,
                  [
                    Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 1.0, end: 1.0)),
                    Track("translateX").add(Duration(milliseconds: 500), Tween(begin: MediaQuery.of(context).size.width, end: 0.0)),
                  ],
                  Container(
                    height: 500.0,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: plants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _renderCard(index);
                      },
                      onPageChanged: (int index) {
                        setState(() {
                          _selectedPage = index;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: MyColors.support_2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        plants[_selectedPage].description,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: MyColors.ui_1,
                          fontWeight: FontWeight.w500,
                          height: 1.5
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
