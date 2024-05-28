import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  static final helper = AdsHelper._();

  AdsHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  RewardedAd? rewardedAd;
  NativeAd? nativeAd;
  AppOpenAd? appOpenAd;

  Future<void> loadBannerAd() async {
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("AddLoad");
        },
      ),
      request: const AdRequest(),
    );
    await bannerAd?.load();
  }

  void loadInterAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("error $error");
        },
      ),
    );
  }

  void loadRewardAd() {
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (error) {
            print("onAdFailedToLoad rewardedAd");
          },
        ));
  }

  Future loadNativeAd() async {
    nativeAd = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      listener: NativeAdListener(onAdLoaded: (ad) {
        print("onAdLoaded : loadNativeAd");
      }),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        cornerRadius: 30,
      ),
      request: AdRequest(),
    );
    await nativeAd?.load();
  }

  void loadOpenAppAd() {
    AppOpenAd.load(
        adUnitId: "ca-app-pub-3940256099942544/9257395921",
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            appOpenAd=ad;
          },
          onAdFailedToLoad: (error) {
            print("onAdFailedToLoad ");
          },
        ),
        orientation: AppOpenAd.orientationPortrait);
  }
}
