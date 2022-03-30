import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart_bloc/cart.dart';
import 'package:flutter_cart_bloc/item.dart';

import 'bloc/cart_bloc.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('catalog'),
          actions: [
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
            }, icon: const Icon(Icons.archive))
          ],
        ),
        body: BlocBuilder<CartBloc, List<Item>>(
          bloc: BlocProvider.of<CartBloc>(context),
          builder: (BuildContext context, List state) {
            return ListView(
                children: _itemList.map((e) => buildItem(e)).toList());
          },
        ));
  }

  Widget buildItem(Item item) {
    final isChecked = context.read<CartBloc>().state.contains(item);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(item.title, style: const TextStyle(fontSize: 31)),
        subtitle: Text("${item.price}"),
        trailing: IconButton(
          icon: isChecked
              ? const Icon(Icons.check, color: Colors.red)
              : const Icon(Icons.check),
          onPressed: () {
            debugPrint(isChecked.toString());
            setState(() {
              if (!isChecked) {
                context.read<CartBloc>().add(CardItemAdd(item));
              } else {
                context.read<CartBloc>().add(CartItemRemove(item));
              }
            });
          },
        ),
      ),
    );
  }
}
