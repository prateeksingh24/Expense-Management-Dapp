import 'package:expense_management_dapp_app/features/credit/credit.dart';
import 'package:expense_management_dapp_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_management_dapp_app/features/debit/debit.dart';
import 'package:expense_management_dapp_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    dashboardBloc.add(DashboardInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      appBar: AppBar(
        title: const Text('Web3 Bank'),
        centerTitle: true,
        backgroundColor: AppColors.accent,
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case DashboardState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case DashboardErrorState:
              return Center(
                child: Text("Error"),
              );
            case DashboardSuccessState:
              final successState = state as DashboardSuccessState;
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://seeklogo.com/images/E/ethereum-eth-logo-CF9DCCA696-seeklogo.com.png',
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                             Text(
                              successState.balance.toString() + ' ETH',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CreditPage(dashboardBloc: dashboardBloc)));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.greenAccent,
                              ),
                              child: const Center(
                                child: Text(
                                  '+ CREDIT',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DebitPage(dashboardBloc: dashboardBloc)));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.redAccent,
                              ),
                              child: Center(
                                child: Text(
                                  '- DEBIT',
                                  style: TextStyle(
                                    color: Colors.red.shade600,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Transactions",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: ListView.builder(
                          itemCount: successState.transactions.length,
                          itemBuilder:
                            ( context, int index) {
                            return  Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        'https://seeklogo.com/images/E/ethereum-eth-logo-CF9DCCA696-seeklogo.com.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                    Text(
                                        successState.transactions[index].amount.toString()+' ETH',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    successState.transactions[index].address,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                   Text(
                                    successState.transactions[index].reason,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            );
                            },
                    ))
                  ],
                ),
              );


            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
