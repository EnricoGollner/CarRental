import 'package:car_tental/app/constants.dart';
import 'package:car_tental/app/data.dart';
import 'package:car_tental/app/screens/book_car.dart';
import 'package:car_tental/app/screens/widgets/vehicle_widget.dart';
import 'package:flutter/material.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({super.key});

  @override
  State<AvailableCars> createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  final List<Filter> _filters = getFilterList();
  Filter? _selectedFilter;

  @override
  void initState() {
    setState(() => _selectedFilter = _filters.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Available Cars ${getCarList().length.toString()})',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.8,
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: getCarList().map((car) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookCar(car: car)));
                      },
                      child: VehicleWidget(index: null, car: car));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
          _buildFilterIcon(),
          Row(
            children:_buildFilters(),
          ),
        ]),
      ),
    );
  }
  
  Widget _buildFilterIcon() {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
  
  List<Widget> _buildFilters() {
    return List.generate(_filters.length, (index) {
      return _buildFilter(_filters[index]);
    });
  }

  Widget _buildFilter(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedFilter = filter);
      },
      child: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(
            filter.name,
            style: TextStyle(
              color: _selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
              fontSize: 14,
              fontWeight: _selectedFilter == filter ? FontWeight.bold : FontWeight.w400,
            ),
        ),
      ),
    );
  }
}