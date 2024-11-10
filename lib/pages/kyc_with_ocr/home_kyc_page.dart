import 'package:flut_apps/pages/kyc_with_ocr/components/item_steps_kyc.dart';
import 'package:flutter/material.dart';

import 'components/card_steps_kyc.dart';

class KycWithOcrPage extends StatefulWidget {
  const KycWithOcrPage({super.key});

  @override
  State<KycWithOcrPage> createState() => _KycWithOcrPageState();
}

class _KycWithOcrPageState extends State<KycWithOcrPage> {
  ThemeData themeData() => Theme.of(context);
  double avanceStepKyc = 0;

  btnHeaderAction() => showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            color: const Color(0xFFFCC334),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'This information was gathered from your '
                    'registration information, so please Read carefully '
                    'and match it with your legal ID, you can edit and '
                    'save.',
                    style: TextStyle(
                      // color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: const ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                        Size(
                          double.infinity,
                          80,
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFF273C41),
                      ),
                    ),
                    child: const Text(
                      'Got it',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    btnHeaderSection() => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.green[50],
                      ),
                      side: const WidgetStatePropertyAll(
                        BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      minimumSize: const WidgetStatePropertyAll(
                        Size(
                          double.infinity,
                          50,
                        ),
                      ),
                    ),
                    onPressed: () => btnHeaderAction(),
                    child: const Text('I am iraqis'),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        avanceStepKyc = 0;
                      });
                      btnHeaderAction();
                    },
                    style: const ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                        Size(
                          double.infinity,
                          50,
                        ),
                      ),
                    ),
                    label: const Text('None iraqis'),
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconAlignment: IconAlignment.end,
                  ),
                )
              ],
            ),
          ),
        );

    getIconCard(double avanceStepKyc) {
      if (avanceStepKyc >= 0.66) {
        return Icons.co_present_rounded;
      } else if (avanceStepKyc >= 0.33) {
        return Icons.camera_alt;
      } else {
        return Icons.person_pin_rounded;
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            Container(
              color: const Color(0xFFCCE4CE),
              height: 200,
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Card(
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(Icons.arrow_back_ios),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'E - KYC Information',
                          style: themeData().textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: BuildCardStepKyc(
                        valueKycStep: avanceStepKyc,
                        iconCard: getIconCard(avanceStepKyc),
                      ),
                    ),
                    btnHeaderSection(),
                    const SizedBox(height: 20.0),
                    ItemStepKyc(
                      title: 'Scann your National ID*',
                      subtitle: 'It should be uploaded',
                      leadingIcon: Icons.person_pin_rounded,
                      onTap: () => setState(() {
                        avanceStepKyc = 0.33;
                      }),
                      active: avanceStepKyc >= 0.33,
                    ),
                    ItemStepKyc(
                      title: 'Take a selfie*',
                      subtitle: 'Background should be clear',
                      leadingIcon: Icons.camera_alt,
                      onTap: () => setState(() {
                        avanceStepKyc = 0.66;
                      }),
                      active: avanceStepKyc >= 0.66,
                    ),
                    ItemStepKyc(
                      title: 'Scann your Residency ID*',
                      subtitle: 'Demo document name',
                      leadingIcon: Icons.co_present_rounded,
                      onTap: () => setState(() {
                        avanceStepKyc = 1;
                      }),
                      active: avanceStepKyc >= 1,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(
                  18.0,
                ),
                child: FilledButton(
                  onPressed: avanceStepKyc == 1 ? () => {} : null,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      avanceStepKyc == 1
                          ? const Color(0xFF273C41)
                          : Colors.grey,
                    ),
                    minimumSize: const WidgetStatePropertyAll(
                      Size(
                        double.infinity,
                        80,
                      ),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: themeData().textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
