import 'package:flutter/material.dart';
import '../widgets/custom_dropdown_button.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: _deviceWidth * 0.05),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerRight, child: _astroImageWidget()),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_pageTitle(), _bookRideWidget()],
              ),
            ],
          )),
    ));
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
          color: Colors.white, fontSize: 65, fontWeight: FontWeight.w800),
      textAlign: TextAlign.center,
    );
  }

  Widget _astroImageWidget() {
    return Container(
      height: _deviceHeight * 0.6,
      width: _deviceWidth,
      decoration: const BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.centerRight,
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/images/astro_moon.png"))),
    );
  }

  Widget _bookRideWidget() {
    return SizedBox(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellersInformationWidget(),
          _rideButton()
        ],
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    List<String> items = ['James Web Station', 'Preneure Station'];

    return CustomDropDownButtonClass(values: items, width: _deviceWidth);
  }

  Widget _travellersInformationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButtonClass(
            values: const ['1', '2', '3', '4'], width: _deviceWidth * 0.45),
        CustomDropDownButtonClass(
            values: const ['Economy', 'Business', 'First', 'Private'],
            width: _deviceWidth * 0.40),
      ],
    );
  }

  Widget _rideButton() {
    return Container(
      width: _deviceWidth,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          'Book Ride!',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
