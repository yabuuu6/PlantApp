import 'package:flutter/material.dart';

import 'package:plant_app/constants.dart';

class HeaderWithProfileInfo extends StatelessWidget {
  const HeaderWithProfileInfo({
    Key? key,
    required this.size,
    required this.name,
    required this.address,
  }) : super(key: key);

  final Size size;
  final String name;
  final String address;

  
}