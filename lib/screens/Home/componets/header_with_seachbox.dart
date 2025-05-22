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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 2),
      height: size.height * 0.14,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.26 - 30,
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.white70, size: 18),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                address,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white70,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}