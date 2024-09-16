import 'package:car_tental/app/constants.dart';
import 'package:car_tental/app/data.dart';
import 'package:car_tental/app/screens/available_cars.dart';
import 'package:car_tental/app/screens/book_car.dart';
import 'package:car_tental/app/screens/widgets/dealer_widget.dart';
import 'package:car_tental/app/screens/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final List<Car> cars = getCarList();
  final List<Dealer> dealers = getDealerList();

  final List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem? selectedItem;

  @override
  void initState() {
    setState(() => selectedItem = navigationItems[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Car Rental',
          style: GoogleFonts.mulish(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.only(left: 30),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 24, left: 16),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24,
                    ),
                  )
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOP DEALS', style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                          Row(
                            children: [
                              Text('view all', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor),
                            ],
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: cars.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return VehicleWidget(car: cars[index], index: index,);
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const AvailableCars()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: Container(
                          padding: const EdgeInsets.all(24),
                          height: 110,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Available Cars',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Long term and short term',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOP DEALERS', style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),

                          Row(
                            children: [
                              Text('view all', style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 12, color: kPrimaryColor),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: 180,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: dealers.length,
                        itemBuilder: (context, index) {
                          return DealerWidget(
                            index: index,
                            dealer: dealers[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> _buildNavigationItems() {
    return List.generate(navigationItems.length, (index) {
      return buildNavigationItem(navigationItems[index]);
    },);
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () => setState(() => selectedItem = item),
      child: SizedBox(
        width: 50,
        child: Stack(
          children: [
            selectedItem == item
              ? Center(
                child: Container(
                  height: 50,
                  width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                ),
              )
              : Container(),
              
              Center(
                child: Icon(
                  item.iconData,
                  color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }
}