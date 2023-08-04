part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class AddToChartEvent extends CheckoutEvent {
  final Product product;
  AddToChartEvent({
    required this.product,
  });
}

class RemoveFromCartEvent extends CheckoutEvent {
  final Product product;
  RemoveFromCartEvent({
    required this.product,
  });
}
