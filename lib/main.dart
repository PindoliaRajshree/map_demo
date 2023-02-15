import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:map_demo/models/followers.dart';

void main() {
  runApp(MaterialApp(
    title: "Map Demo",
    debugShowCheckedModeBanner: false,
    home: mapscreen(),
  ));
}

class mapscreen extends StatefulWidget {
  const mapscreen({Key? key}) : super(key: key);

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {
  var widthsize, heightsize;

  late GoogleMapController _controller;
  LatLng _center = LatLng(36.83540826682888, -119.76494844519549);
  Location _location = Location();

  List<followers> list = [
    followers("Dina", "assets/female.png"),
    followers("John", "assets/male.png"),
    followers("Jessica", "assets/female.png"),
    followers("Alison", "assets/male.png"),
    followers("Antonia", "assets/female.png"),
    followers("Dina", "assets/female.png"),
    followers("John", "assets/male.png"),
    followers("Jessica", "assets/female.png"),
    followers("Alison", "assets/male.png"),
    followers("Antonia", "assets/female.png"),
  ];

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
    _location.onLocationChanged.listen((event) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(event.latitude!, event.longitude!),
          zoom: 15.0,
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    widthsize = MediaQuery.of(context).size.width;
    heightsize = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: GoogleMap(
                padding: EdgeInsets.all(10),
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 15.0,
                ),
                onMapCreated: _onMapCreated,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                height: 290,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                        cursorColor: Colors.black45,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(233, 231, 231, 1.0),
                          suffixIcon: Icon(
                            Icons.my_location,
                            color: Color.fromRGBO(33, 121, 243, 1),
                            size: 24.0,
                          ),
                          hintText: "Enter your Destination",
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Your Favourites',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(233, 231, 231, 1.0),
                          radius: 20,
                          child: Icon(
                            Icons.home_filled,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Doctors Drive, L.A., California',
                                softWrap: false,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: Color.fromRGBO(181, 178, 174, 1.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color.fromRGBO(181, 178, 174, 1.0),
                      indent: 55,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(233, 231, 231, 1.0),
                          radius: 20,
                          child: Icon(
                            Icons.business_center,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Work',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Acacia, Blue Lake, California',
                                softWrap: false,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          size: 30,
                          color: Color.fromRGBO(181, 178, 174, 1.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      color: Color.fromRGBO(181, 178, 174, 1.0),
                      indent: 55,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    showBottomSheetDialog(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.greenAccent,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black12,
                  child: Icon(
                    Icons.apps,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: heightsize-90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0)),
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 40,bottom: 20),
                            child: ListView(
                              children: [
                                Text('Andrew Kumar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text('UI/UX Designer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black12,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,right: 20),
                                  child: Text('I\'m a positive person. I love to travel and discovery new place.',
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){},
                                      child: Material(
                                        color: Colors.purple,
                                        borderRadius: BorderRadius.circular(30),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 25,right: 25,top: 8,bottom: 8),
                                          child: Text('FOLLOW',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25,),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text('170',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Followers',
                                            style: TextStyle(
                                              color: Colors.black12,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20,),
                                      VerticalDivider(
                                        color: Colors.black12,
                                        thickness: 2,
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        children: [
                                          Text('104',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Followings',
                                            style: TextStyle(
                                              color: Colors.black12,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20,),
                                      VerticalDivider(
                                        color: Colors.black12,
                                        thickness: 2,
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        children: [
                                          Text('1,024',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text('Likes',
                                            style: TextStyle(
                                              color: Colors.black12,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Divider(
                                  color: Colors.black12,
                                  thickness: 5,
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('Followers',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    Text('View all',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.purple,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  height: 100,
                                  child: ListView.builder(
                                    itemCount: list.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context,index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.transparent,
                                              backgroundImage: AssetImage(list[index].image.toString()),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(list[index].name.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Divider(
                                  color: Colors.black12,
                                  thickness: 5,
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 10,),
                                    Text('Posted',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15),
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 20,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: List.generate(10,
                                            (index) => Image.asset(
                                              'assets/flower.jpg',
                                              height: 35,
                                              width: 35,
                                            ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.greenAccent,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 34,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
