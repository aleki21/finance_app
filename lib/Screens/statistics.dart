import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/data/top.dart';
import 'package:finance_app/data/utility.dart';
import 'package:finance_app/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int index_color = 0;
  ValueNotifier kj = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: kj,
          builder: (context, value, child) {
            a = f[value];
            return custom();
          },
        ),
      ),
    );
  }

  CustomScrollView custom() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            // Wrap with Padding instead of Column
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Prevent infinite height
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Statistics',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          index_color = index;
                          kj.value = index;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              index_color == index
                                  ? const Color.fromARGB(255, 47, 125, 121)
                                  : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          day[index],
                          style: TextStyle(
                            color:
                                index_color == index
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Align(
                  // Align the "Expense" dropdown to the end
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Expense',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_downward_sharp, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Chart(indexx: index_color,),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Spending',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.swap_vert, size: 25, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('images/${a[index].name}.png', height: 40),
              ),
              title: Text(
                a[index].name,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
              subtitle: Text(
                '${[a[index].datetime.weekday - 1]}  ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                a[index].amount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: a[index].IN == 'Income' ? Colors.green : Colors.red,
                ),
              ),
            );
          }, 
          childCount: a.length,
          ),
        ),
      ],
    );
  }
}
