import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/item.dart';

import 'bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartBloc, List<Item>>(
        builder: (BuildContext context, state) {
          int sum = context
              .read<CartBloc>()
              .state
              .map((e) => e.price)
              .reduce((value, element) => value + element);
          return Center(
            child: Text(
              "합계: $sum",
              style: const TextStyle(fontSize: 30),
            ),
          );
        },
      ),
    );
  }
}
