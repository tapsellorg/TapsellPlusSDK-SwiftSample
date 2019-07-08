//
//  ViewController.swift
//  TapsellPlusSDK-SwiftSample
//
//  Created by Mahdi Toori on 4/17/1398 AP.
//  Copyright © 1398 Tapsell. All rights reserved.
//

import UIKit
import TapsellPlus
import TapsellPlusTapsellAdapter

class ViewController: UIViewController,
    TapsellPlusRequestAdDelegate,
    TapsellPlusShowAdDelegate,
    TapsellPlusNativeBannerDelegate,
    TapsellPlusBannerDelegate
{
        let interstitialBanner1Id   = "5d2209532cf21e0001a90c79" //tapsell
        let interstitialBanner2Id   = "5d220b2155028c0001e810af" //admob
        let rewardedVideo1Id        = "5d2207582cf21e0001a90c78" //tapsell
        let rewardedVideo2Id        = "5d2207bc55028c0001e810ae" //admob
        let rewardedVideo3Id        = "5d230bc36b8bf10001a96d5c" //unity
        let rewardedVideo4Id        = "5d230c2e6b8bf10001a96d5d" //chartboost
        let nativeBannerId          = "5d220b3b55028c0001e810b0" //tapsell
        let banner1Id               = "5d220b5655028c0001e810b1" //tapsell
        let banner2Id               = "5d220bd32cf21e0001a90c7a" //admob
    
    func onRequestFilled(_ zoneId:String) {
        print("banner ad filled")
    }
    
    func onSuccess(_ ad: UIView) {
        print("native banner success")
        nativeBannerView.isHidden = false
    }
    
    func onAdOpened(_ zoneId:String) {
        print("onAdOpened")
    }
    
    func onAdClosed(_ zoneId:String,_ completed: Bool) {
        print("onAdClosed")
    }
    
    func onReward(_ zoneId:String) {
        print("onReward")
    }
    
    func onReady(_ ad: TapsellPlusAdItem) {
        print("ad is ready")
        ad.show(self, self)
    }
    
    func onError(_ zoneId:String, _ code: Int) {
        print("code: \(code)")
    }
    
    @IBOutlet weak var bannerView: TapsellPlusBannerView!
    @IBOutlet weak var bannerView2: TapsellPlusBannerView!
    @IBOutlet weak var nativeBannerView: TapsellPlusNativeBannerView!
    
    @IBAction func getNativeBanner(_ sender: UIButton) {
        TapsellPlus.requestNativeBannerAd(self.nativeBannerId, nativeBannerView, self)
    }
    @IBAction func getInterstitialBanner1(_ sender: UIButton) {
        TapsellPlus.requestInterstitialAd(self.interstitialBanner1Id, self)
    }
    @IBAction func getInterstitialBanner2(_ sender: UIButton) {
        TapsellPlus.requestInterstitialAd(self.interstitialBanner2Id, self)
    }
    @IBAction func getRewardedVideo1(_ sender: UIButton) {
        TapsellPlus.requestRewardedVideoAd(self.rewardedVideo1Id, self)
    }
    @IBAction func getRewardedVideo2(_ sender: UIButton) {
        TapsellPlus.requestRewardedVideoAd(self.rewardedVideo2Id, self)
    }
    @IBAction func getRewardedVideo3(_ sender: UIButton) {
        TapsellPlus.requestRewardedVideoAd(self.rewardedVideo3Id, self)
    }
    @IBAction func getRewardedVideo4(_ sender: UIButton) {
        TapsellPlus.requestRewardedVideoAd(self.rewardedVideo4Id, self)
    }
    @IBAction func getBanner1(_ sender: UIButton) {
        TapsellPlus.requestBannerAd(self.banner1Id, bannerView, self)
    }
    @IBAction func getBanner2(_ sender: UIButton) {
        TapsellPlus.requestBannerAd(self.banner2Id, bannerView2, self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nativeBannerView.isHidden = true;
        nativeBannerView.titleLabelTag = 100;
        nativeBannerView.descriptionLabelTag = 101;
        nativeBannerView.logoImageTag = 102;
        nativeBannerView.mainImageTag = 103;
        nativeBannerView.callToActionButtonTag = 104;
        
        bannerView.size = .W320H50
        bannerView.rootControlView = self
        //        TapsellPlus.requestBannerAd(self.bannerId, bannerView, self)
        //
        bannerView2.size = .W320H50
        bannerView2.rootControlView = self
        //        TapsellPlus.requestBannerAd(self.banner2Id, bannerView2, self)
    }
    
    
    
}
