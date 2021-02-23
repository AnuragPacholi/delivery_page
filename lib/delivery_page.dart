import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DeliveryPage extends StatefulWidget {
  @override
  _DeliveryPageState createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.red800,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16, top: 18),
      ),
      body: VStack([
        VxBox(
                child: [
          Row(
            children: [
              Text(
                'Delivery Options Near You',
                style: TextStyle(
                    fontFamily: GoogleFonts.berkshireSwash().fontFamily,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Vx.white),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ].column())
            .alignTopCenter
            .makeCentered()
            .h(50),
        VxBox(
                child: [
          Row(
            children: [
              VxBox()
                  .size(80, 120)
                  // .neumorphic(
                  //     color: Vx.gray100, elevation: 0) // Comment this line.
                  .bgImage(DecorationImage(
                    image: AssetImage('assets/guy.png'),
                  ))
                  .alignBottomLeft
                  .make(),
              VxBox()
                  .size(195, 125)
                  // .neumorphic(
                  //     color: Vx.gray100, elevation: 0) // Comment this line.
                  .bgImage(DecorationImage(
                    image: AssetImage('assets/truck.png'),
                  ))
                  .alignCenterRight
                  .make(),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ].column())
            .padding(Vx.mV0)
            .alignTopCenter
            .makeCentered()
            .h(140),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: VxBox(
              child: VStack([
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Vx.red700,
              unselectedLabelColor: Vx.red500,
              labelStyle: TextStyle(
                  fontFamily: GoogleFonts.lobster().fontFamily, fontSize: 20),
              tabs: [
                Tab(
                  text: "Domestic",
                ),
                Tab(
                  text: "International",
                )
              ],
            ),
            TabBarView(controller: _tabController, children: [
              // First Tab Agriculture.
              VStack([
                "Deliver Products Domestically!"
                    .richText
                    .red400
                    .bold
                    .size(15)
                    .make()
                    .centered(),
                Productcard(
                  title: "DTDC Courier Service",
                  subtitle: "0.5KM away from your location",
                  imageadd: "assets/truck/1.png",
                ),
                Productcard(
                  title: "Shree Maruti Parcel Service",
                  subtitle: "2KM away from your location",
                  imageadd: "assets/truck/2.png",
                ),
                Productcard(
                  title: "Parcel and Cargo Xpress",
                  subtitle: "5KM away from your location",
                  imageadd: "assets/truck/3.jpg",
                ),
                Productcard(
                  title: "OnDot Courier and Cargo Ltd",
                  subtitle: "8KM away from your location",
                  imageadd: "assets/truck/4.jpg",
                ),
                Productcard(
                  title: "Cargo Express PACX",
                  subtitle: "10KM away from your location",
                  imageadd: "assets/truck/5.jpg",
                )
              ]).scrollVertical().p12(),

              // Second Tab Handicrafts.
              VStack([
                "Deliver Products Internationally!"
                    .richText
                    .red400
                    .bold
                    .size(15)
                    .make()
                    .centered(),
                Productcard(
                  title: "DHL",
                  subtitle: "2KM away from your location",
                  imageadd: "assets/company/1.png",
                ),
                Productcard(
                  title: "FedX",
                  subtitle: "5KM away from your location",
                  imageadd: "assets/company/2.png",
                ),
                Productcard(
                  title: "UPS",
                  subtitle: "7KM away from your location",
                  imageadd: "assets/company/3.png",
                ),
                Productcard(
                  title: "Blue Dart",
                  subtitle: "8KM away from your location",
                  imageadd: "assets/company/4.png",
                ),
                Productcard(
                  title: "Amazon Logistics",
                  subtitle: "2KM away from your location",
                  imageadd: "assets/company/5.png",
                )
              ]).scrollVertical().p12()
            ]).expand()
          ])).gray100.make(),
        ).expand()
      ]),
    );
  }
}

// Product Cards.
class Productcard extends StatelessWidget {
  final String title, subtitle, imageadd;

  Productcard({Key key, this.title, this.subtitle, this.imageadd})
      : super(key: key);

  // var pic1 = "assets/images/wheat.jpg";
  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.asset(imageadd).wh(context.percentWidth * 35, 90).cornerRadius(20),
      20.widthBox,
      VStack(
        [
          title.text.bold.red600.make(),
          3.heightBox,
          subtitle.text.make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "(100)".text.xs.red400.make(),
          ].row()
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).expand()
    ]).backgroundColor(Vx.gray200).cornerRadius(20).py(10);
  }
}
