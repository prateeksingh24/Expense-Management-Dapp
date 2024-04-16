import 'package:expense_management_dapp_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_management_dapp_app/features/debit/debit.dart';
import 'package:expense_management_dapp_app/models/transaction_model.dart';
import 'package:expense_management_dapp_app/util/colors.dart';
import 'package:flutter/material.dart';


class CreditPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const CreditPage({super.key, required this.dashboardBloc});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {

  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenAccent,
      body:Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text("Deposit Details",style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: "Enter the Address"
              ),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                  hintText: "Enter the Amount"
              ),
            ),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                  hintText: "Enter the Reason"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                widget.dashboardBloc.add(DashboardDepositEvent(
                    transactionModel: TransactionModel(
                        addressController.text,
                        int.parse(amountController.text),
                        reasonController.text,
                        DateTime.now())));
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    '+ DEPOSIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
