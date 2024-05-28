import 'package:aso_ads/ads_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    var adHelper = AdsHelper.helper;
    adHelper.loadBannerAd().then((value) {
      setState(() {});
    });
    adHelper.loadNativeAd().then((value) {
      setState(() {});
    });
    adHelper.loadInterAd();
    adHelper.loadRewardAd();
    adHelper.loadOpenAppAd();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (AdsHelper.helper.bannerAd != null)
              SizedBox(
                height: AdsHelper.helper.bannerAd?.size.height.toDouble() ?? 0,
                width: AdsHelper.helper.bannerAd?.size.width.toDouble() ?? 0,
                child: AdWidget(ad: AdsHelper.helper.bannerAd!),
              ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (AdsHelper.helper.nativeAd != null)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 320, // minimum recommended height
                  maxWidth: 400,
                  maxHeight: 400,
                ),
                child: AdWidget(ad: AdsHelper.helper.nativeAd!),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (AdsHelper.helper.interstitialAd != null) {
            // AdsHelper.helper.interstitialAd?.show();
            //AdsHelper.helper.loadInterAd();


            // AdsHelper.helper.rewardedAd?.show(
            //   onUserEarnedReward: (ad, reward) {
            //     print("onUserEarnedReward ${reward.amount}");
            //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reward ${reward.amount}")));
            //   },
            // );
            //AdsHelper.helper.loadRewardAd();

            // print("AdsHelper.helper.appOpenAd ${AdsHelper.helper.appOpenAd}");
            // AdsHelper.helper.appOpenAd?.show();
            // AdsHelper.helper.loadOpenAppAd();
          } else {
            print("Ad is not load ");
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
