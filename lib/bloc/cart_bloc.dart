import 'package:flutter/material.dart';
import 'package:flutter_cart_bloc/item.dart';
import 'package:bloc/bloc.dart';

abstract class CartEvent {
  final Item item;

  CartEvent(this.item);
}

class CardItemAdd extends CartEvent {
  CardItemAdd(Item item) : super(item);
}

class CartItemRemove extends CartEvent {
  CartItemRemove(Item item) : super(item);
}

class CartBloc extends Bloc<CartEvent, List<Item>> {
  CartBloc() : super([]) {
    on<CardItemAdd>((event, emit) {
      debugPrint("CardItemAdd");
      state.add(event.item);
    });
    on<CartItemRemove>((event, emit) {
      debugPrint("CartItemRemove");
      state.remove(event.item);
    });
  }
}