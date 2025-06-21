import 'package:flutter/material.dart';
import 'package:memories/components/BackgroundWidget.dart';
import 'package:memories/components/MemoriesScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(
            opacity: 0.4,
            blurX: 0,
            blurY: 1,
            link:"https://lh3.googleusercontent.com/pw/AP1GczPgag5Nd2Yw0vDNRUozJxXrf6sraEnW1B_k3E17ug108JRW5DeL2Sq1G0_0SLCE324qbB-8TYguOqruhUtdHJDUcd14KXncTSD5x5BTQJcFGLxASQGoqKuXrtPJWol9iGSHUcJRfELT1GJNEaE3aiIwe8N_Ihu3J-aH9hRbZvjlaWQoPsBbyHfe6yB3V7htpgQBP3f9iQw_XDsOhY5Wmzt6KQTee8e7fmue8Qy7p6PrGWE9tbGdiycVbMsLhhoJcho7-n4usUEk5Z47ioOiDnlCVBG0aC1L8ZP4lC7AaWJg71g-EeKlm46bym_bmAGCl20Ukagy7Nt1IBMDsMd79K6B7eW0eeaQlFF68w6HsMERRsgs6OACXCdeUkOBK45nuhfwrYnM2DHnVO9yL8hAQbzR7bcFPNGTAO0p12huc0Xt5j32tKZtJhGOJTWHycvLgtUdlIpSEgFROUBKdqCKR1jRSHQiagis9D30ZqwWmyUBnVYl2AVR0zVc74HYTscEnYICww7CaaUd9X5ActT_3l66Cx5pBQz5BXJNoQgF08al7E2ILS_0fDqtJCe37RJHH2IN4qHkHxebmiuM0pgRNIy9q93X3uKz3HMoqJKHK9oinTxYMUtxVUuLNbBUrxHqPBc3Ikg_Y2arhqSd0gm1arzP3PcWERLjHyWPBTtUAmsLwD1m4gVBEO6S8iw9B9m2Xf1sOTX1_V2BSioTLbN2TziZDBTmh3XV5raanLtie0SC-G4Ktv6PPI5SfBjBRipRtXfyRIgHdwW7_v5F7F0rZeVvFU3arBh4DRbEZH6GwgAdTARswtjNG_Nm5vaSf9RTRt3GV4H_zcgpIMav0xfDofYiMVIc63vD-VFHcc_OgByMp9H-zU46u6_yx4QAEH_vkkVRQ9JPPVr5zWgCAT8Fq613-0e1mjkA9eP-ZQaaeIud7FJCIcDbm4U6fJ2t3OFvLA7FAtkEvOZDAr_X7O-Gyu12aKaXsMS4eMqy_jlGcHydb8Qua1uyLtJNC1-ETkdTPvo=w390-h520-no?authuser=0",),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            // color: Colors.redAccent,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Are you ready for your memory roller coaster ?", style: TextStyle(color: Colors.white, fontSize: 40),),
                    const SizedBox(height: 50,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => MemoriesScreen(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 700),
                            ),
                          );

                        },
                        child: const Text("Let's goooo", style: TextStyle(color: Colors.black, fontSize: 40),))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}