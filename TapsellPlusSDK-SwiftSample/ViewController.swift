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
        let interstitialBannerId   = "5e3915c0a609650001935c90"
        let rewardedVideoId        = "5e3917754535200001dee755"
        let nativeBannerId         = "5e39173d4535200001dee754"
        let bannerId               = "5e391757a609650001935c93"
    
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
    @IBOutlet weak var nativeBannerView: TapsellPlusNativeBannerView!
    
    @IBAction func getNativeBanner(_ sender: UIButton) {
        TapsellPlus.requestNativeBannerAd(self.nativeBannerId, nativeBannerView, self)
    }
    @IBAction func getInterstitialBanner(_ sender: UIButton) {
        TapsellPlus.requestInterstitialAd(self.interstitialBannerId, self)
    }
    @IBAction func getRewardedVideo(_ sender: UIButton) {
        TapsellPlus.requestRewardedVideoAd(self.rewardedVideoId, self)
    }
    @IBAction func getBanner(_ sender: UIButton) {
        TapsellPlus.requestBannerAd(self.bannerId, bannerView, self)
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
    }
    
    
    
}
