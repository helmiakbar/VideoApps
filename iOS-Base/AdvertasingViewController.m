//
//  AdvertasingViewController.m
//  iOS-Base
//
//  Created by Helmi Akbar on 18/10/18.
//  Copyright © 2018 Lutfi Azhar. All rights reserved.
//

#import "AdvertasingViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AdvertasingViewController ()
    @property (nonatomic) AVPlayer *avPlayer;
@end

@implementation AdvertasingViewController

    - (void)viewDidLoad {
        [super viewDidLoad];
    
        NSLog(@"fsf");
    
        NSString *urlstr=@"http://playertest.longtailvideo.com/adaptive/captions/playlist.m3u8";
        NSURL *fileURL=[NSURL URLWithString:urlstr];
        
        self.avPlayer = [AVPlayer playerWithURL:fileURL];
        self.avPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        AVPlayerLayer *videoLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
        videoLayer.frame = self.view.bounds;
        videoLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        [self.view.layer addSublayer:videoLayer];
        [self.avPlayer play];
    
        [self performSelector:@selector(closeAdver) withObject:nil afterDelay:15.0f];
    }
    
    //MARK: CustomMethod
    -(void) closeAdver {
        [self.delegate dismiss];
        [self dismissViewControllerAnimated:YES completion:nil];
    }


@end
