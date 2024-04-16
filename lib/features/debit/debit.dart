 import 'package:expense_management_dapp_app/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:expense_management_dapp_app/models/transaction_model.dart';
import 'package:expense_management_dapp_app/util/colors.dart';
import 'package:flutter/material.dart';

class DebitPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const DebitPage({super.key, required this.dashboardBloc});

  @override
  State<DebitPage> createState() => _DebitPageState();
}

class _DebitPageState extends State<DebitPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.redAccent,
        body:Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text("Withdraw Details",style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(
                height: 20,
              ),
              // TextField(
              //   controller: addressController,
              //   decoration: InputDecoration(
              //       hintText: "Enter the Address"
              //   ),
              // ),
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
                  widget.dashboardBloc.add(DashboardWithdrawEvent(
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
                    color: Colors.red.shade700,
                  ),
                  child: Center(
                    child: Text(
                      '- Withdraw',
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
