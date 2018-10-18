//
//  VideoViewController.swift
//  iOS-Base
//
//  Created by Helmi Akbar on 18/10/18.
//  Copyright © 2018 Lutfi Azhar. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class VideoViewController: BaseViewController, AdvertasingViewControllerProtocol {
    
    @IBOutlet weak var playerContentView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var adverImgView: UIImageView!
    
    var idx: Int! = 0
    
    let videos = ["http://www.nacentapps.com/m3u8/index.m3u8", "http://www.html5videoplayer.net/videos/toystory.mp4"]
    var avPlayer:AVPlayer?
    
    let imageArray = ["img-daihatsu", "img-rexona", "img-cola-cola"]
    var imgIdx: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGesture()
        
        self.adverImgView.isHidden = true
    }
    
    //MARK: - TapGesture
    func addTapGesture() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeLeft.direction = .left
        self.playerContentView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.playerContentView.addGestureRecognizer(swipeRight)
    }
    
    func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
            if self.idx == 1 {
                self.idx = 0
            } else {
                self.idx = self.idx + 1
            }
            self.playVideo()
    }
    
    func playerDidFinishPlaying(note: NSNotification) {
        if self.idx == 1 {
            self.idx = 0
        } else {
            self.idx = self.idx + 1
        }
        self.playVideo()
    }

    //MARK: - ButtonAction
    @IBAction func showMenuBtn(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        popupController.modalPresentationStyle = .overFullScreen
        popupController.modalTransitionStyle = .crossDissolve
        
        self.present(popupController, animated: true, completion: nil)
    }
    
    @IBAction func playBtn(_ sender: Any) {
        self.playButton.isHidden = true
        self.playVideo()
        self.setTimer()
        self.setAdverTimer()
    }
    
    //MARK: - playVideo
    func playVideo() {
        self.avPlayer?.pause()
        self.avPlayer?.replaceCurrentItem(with: nil)
        let video = self.videos[self.idx]
        print(video)
        let playerItem = AVPlayerItem(url: URL(string: video)!)
        self.avPlayer = AVPlayer(playerItem: playerItem)
        let playerLayer = AVPlayerLayer(player: self.avPlayer)
        playerLayer.frame = self.playerContentView.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        self.playerContentView.layer.addSublayer(playerLayer)
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.avPlayer!.currentItem)
        self.avPlayer!.play()
    }
    
    //MARK: - Timer
    func setTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(self.autoShow), userInfo: nil, repeats: true)
    }
    
    func autoShow() {
        if self.adverImgView.isHidden == true {
            self.adverImgView.isHidden = false
            let image = self.imageArray[self.imgIdx]
            self.adverImgView.image = UIImage.init(named: image)
        } else {
            self.adverImgView.isHidden = true
            self.adverImgView.image = nil
            if self.imgIdx == 2 {
                self.imgIdx = 0
            } else {
                self.imgIdx = self.imgIdx + 1
            }

        }
    }
    
    func setAdverTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(self.autoShowAdver), userInfo: nil, repeats: true)
    }
    
    func autoShowAdver() {
        self.avPlayer!.pause()
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let popupController = storyboard.instantiateViewController(withIdentifier: "advertasing") as! AdvertasingViewController
        popupController.delegate = self
        popupController.modalPresentationStyle = .overFullScreen
        popupController.modalTransitionStyle = .crossDissolve
        
        self.present(popupController, animated: true, completion: nil)
    }
    
    //MARK: -CustomMethod
    func dismiss() {
        self.avPlayer!.play()
    }
}
