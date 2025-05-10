import 'package:finance_app/data/1.dart';

List<money> geter() {
  money upwork = money();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'upwork.png';
  upwork.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '15';
  starbucks.image = 'Star.png';
  starbucks.name = 'Starbucks';
  starbucks.time = 'today';
  money transfer = money();
  transfer.buy = true;
  transfer.fee = '100';
  transfer.image = 'Transfer.png';
  transfer.name = 'Transfer for Gideon';
  transfer.time = 'jan 30,2022';
  return [upwork, starbucks, transfer, upwork, starbucks, transfer, upwork];
}
