import 'package:ecommerc_web_handmade/models/carousel.dart';
import 'package:ecommerc_web_handmade/models/product.dart';
import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  children: <Widget>[
                    Header(),
                    CarouselContainer(),
                  ],
                ),
              ),
              Container(
                color: Colors.blueGrey[600],
                height: 80,
                width: double.infinity,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: Colors.black,
                            height: 1000,
                            width: width* 0.62,
                            child: DefaultTabController(
                              length: 5,
                              initialIndex: 0,
                              child: Scaffold(
                                appBar: AppBar(
                                  elevation: 1,
                                  title: TabBar(
                                    indicatorColor: Colors.red,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorWeight: 5,
                                    tabs: <Widget>[
                                      Tab(
                                        child: Text("NEW ARRIVALS"),
                                      ),
                                      Tab(
                                        child: Text("BESTSELLERS"),
                                      ),
                                      Tab(
                                        child: Text("SPECIAL OFFERS"),
                                      ),
                                      Tab(
                                        child: Text("MOST VIEWED"),
                                      ),
                                      Tab(
                                        child: Text("LINK"),
                                      )
                                    ],
                                  ),
                                ),
                                body: TabBarView(
                                  children: <Widget>[
                                    NewArrivalPage(),
                                    NewArrivalPage(),
                                    NewArrivalPage(),
                                    NewArrivalPage(),
                                    NewArrivalPage(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child:Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 13, left: 13),
                                    width: double.infinity,
                                    height: 50,
                                    color: Colors.red,
                                    child: Text(
                                      "CATEGORIES",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                CategoryBtn(
                                  title: "MEN",
                                ),
                                CategoryBtn(
                                  title: "WOMEN",
                                ),
                                CategoryBtn(
                                  title: "CHILDREN",
                                ),
                                CategoryBtn(
                                  title: "CUSTOM MENU",
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class NewArrivalPage extends StatelessWidget {
  const NewArrivalPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      height: 800,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.6),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var nprise = products[index].price -
              (products[index].discount / products[index].price) * 100;
          return Container(
              color: Colors.white,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            color: Colors.blueAccent,
                            height: 40,
                            width: 50,
                            child: FlatButton(
                                onPressed: () {

                                },
                                padding: EdgeInsets.all(5),
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            color: Colors.redAccent,
                            height: 40,
                            width: 50,
                            child: Center(
                                child: Text(
                                  "-${products[index].discount}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Image.asset(
                                products[index].imageUrl,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(
                          products[index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Divider(
                            color: Colors.grey[300],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${products[index].price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              nprise.toStringAsPrecision(5),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Divider(
                            color: Colors.grey[300],
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 180,
                          color: Colors.redAccent,
                          child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "ADD TO CART",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}

class CategoryBtn extends StatelessWidget {
  final String title;
  const CategoryBtn({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
      child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Icon(Icons.arrow_forward),
              SizedBox(
                width: 10,
              ),
              Text(this.title),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.add),
            ],
          )),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  final String title;
  final bool isSelected;

  const ButtonCustom({
    Key key,
    this.title,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 2),
        child: MaterialButton(
            onPressed: () {},
            height: 50,
            color: isSelected ? Colors.blueAccent : Colors.red,
            child: Center(
                child: Text(
                  this.title,
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ))),
      ),
    );
  }
}

class CarouselContainer extends StatelessWidget {
  const CarouselContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: <Widget>[
          CarouselBuilder(carousel: carousels[0],),
          SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                SidePicture(
                  imageUrl: "images/bg2.jpg",
                ),
                SizedBox(
                  height: 20,
                ),
                SidePicture(
                  imageUrl: "images/bg3.jpg",
                ),
                SizedBox(
                  height: 20,
                ),
                SidePicture(
                  imageUrl: "images/bg1.jpg",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CarouselBuilder extends StatefulWidget {
  final Carousel carousel;
  const CarouselBuilder({
    Key key, this.carousel,
  }) : super(key: key);

  @override
  _CarouselBuilderState createState() => _CarouselBuilderState();
}

class _CarouselBuilderState extends State<CarouselBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 850,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: widget.carousel.bgColors)),
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Image.asset(
                widget.carousel.imageUrl,
                height: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SidePicture extends StatelessWidget {
  final String imageUrl;
  const SidePicture({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
              image: AssetImage(this.imageUrl), fit: BoxFit.fill)),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            height: 120,
            color: Colors.white,
            child: Center(
              child: Text(
                "HAND MADE",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico"),
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 6,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.black12,
                height: 40,
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Flexible(
                      flex: 8,
                      child: Row(
                        children: <Widget>[
                          PageBtn(
                            title: "Home",
                            icon: Icons.home,
                          ),
                          PageBtn(
                            title: "Wish List(0)",
                            icon: Icons.favorite,
                          ),
                          PageBtn(
                            title: "Account",
                            icon: Icons.person,
                          ),
                          PageBtn(
                            title: "My Cart",
                            icon: Icons.shopping_cart,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "0 item(s) - 0.00",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.grey[200],
                      width: 578,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Welcome to Hand Made",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.exit_to_app,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Register",
                                  style: TextStyle(color: Colors.grey))
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.only(left: 8),
                        padding: EdgeInsets.only(left: 8),
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 50,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Text(
                              "Search entire store",
                              style:
                              TextStyle(fontSize: 20, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 40,
                  color: Colors.black12,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      BottomBtn(
                        label: "CATEGORIES",
                      ),
                      BottomBtn(
                        label: "SHOPS",
                      ),
                      BottomBtn(
                        label: "PRODUCTS",
                      ),
                      BottomBtn(
                        label: "INFORMATION",
                      ),
                      BottomBtn(
                        label: "BLOGS",
                      ),
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class BottomBtn extends StatelessWidget {
  final String label;
  const BottomBtn({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.only(right: 1),
        child: MaterialButton(
          onPressed: () {},
          height: 50,
          color: Colors.black,
          child: Center(
            child: Text(
              this.label,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class PageBtn extends StatelessWidget {
  final String title;
  final IconData icon;
  const PageBtn({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2, bottom: 1),
      child: FlatButton(
        onPressed: () {},
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Icon(
                this.icon,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                this.title,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
