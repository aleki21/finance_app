import 'package:finance_app/data/1.dart';

List<money> geter_top() {
  money snap_food = money();
  snap_food.time = 'jan 30,2022';
  snap_food.image = 'food.png';
  snap_food.buy = true;
  snap_food.fee = '- \ksh 100';
  snap_food.name = 'macdonald';
  money snap = money();
  snap.image = 'Transfer.png';
  snap.time = 'today';
  snap.buy = true;
  snap.name = 'Transfer';
  snap.fee = '- \ksh 60';

  return [snap_food, snap];
}