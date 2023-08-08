import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_dropdown_button.dart';

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
        padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   mainAxisSize: MainAxisSize.max,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [_pageTitle(), _astroImageWidget(), _bookRideWidget()],
        // ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: _astroImageWidget(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_pageTitle(), _bookRideWidget()],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _pageTitle() {
    return const Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 80,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _astroImageWidget() {
    return Container(
      width: _deviceWidth * 0.65,
      height: _deviceHeight * 0.60,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/astro_moon.png")),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    return CustomDropDownButtonClass(
        values: const ["Moka_one station", "Sudo station", "Youston station"],
        width: _deviceWidth);
  }

  Widget _travellersInformationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropDownButtonClass(
            values: const ["1", "2", "3", "4"], width: _deviceWidth * 0.45),
        CustomDropDownButtonClass(
            values: const ["Economy", "Business", "First", "Private"],
            width: _deviceWidth * 0.40)
      ],
    );
  }

  Widget _bookRideWidget() {
    return Container(
      height: _deviceHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _destinationDropDownWidget(),
          _travellersInformationWidget(),
          _rideButton(),
        ],
      ),
    );
  }

  Widget _rideButton() {
    return Container(
      margin: EdgeInsets.only(bottom: _deviceHeight * 0.005),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: _deviceWidth,
      child: MaterialButton(
        onPressed: () {},
        child: const Text(
          "Book ride",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
