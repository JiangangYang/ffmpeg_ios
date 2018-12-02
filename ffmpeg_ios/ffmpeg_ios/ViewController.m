//
//  ViewController.m
//  ffmpeg_ios
//
//  Created by Yang Jiangang on 2018/12/2.
//  Copyright © 2018 Yang Jiangang. All rights reserved.
//

#import "ViewController.h"
#import <ffmpeg/ffmpeg.h>

#define DocumentDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define BundlePath(res) [[NSBundle mainBundle] pathForResource:res ofType:nil]
#define DocumentPath(res) [DocumentDir stringByAppendingPathComponent:res]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    BOOL result = [DCFFmpegTool gifToMp4:BundlePath(@"3.gif") output:DocumentPath(@"output.mp4")];
    
    //    BOOL result = [DCFFmpegTool ffmpeg:[NSString stringWithFormat:@"ffmpeg -f gif -i %@ %@",BundlePath(@"3.gif"),DocumentPath(@"output.mp4")]];
    
    // ffmpeg -f image2 -i c:\temp\%02d.jpg -vcodec libx264 -r 10 -b 200k  test.mp4
    //    BOOL result = [DCFFmpegTool ffmpeg:[NSString stringWithFormat:@"ffmpeg -f image2 -loop 1 -y -i %@ -c:a copy -s 1280x720 -r 30 -b:v 1.5M -pix_fmt yuv420p -t 4 -movflags faststart %@",BundlePath(@"100.png"),DocumentPath(@"output.mp4")]];
    
    // ffmpeg -r 25 -loop 1 -i ~/IMG_8679.JPG -pix_fmt yuv420p -vcodec libx264 -b:v 600k -r:v 25 -preset medium -crf 30 -s 720x576 -vframes 250 -r 25 -t 10 ~/a.mp4
    //    BOOL result = [DCFFmpegTool ffmpeg:[NSString stringWithFormat:@"ffmpeg -r 25 -loop 1 -i %@ -pix_fmt yuv420p -vcodec libx264 -b:v 600k -r:v 25 -preset medium -crf 30 -s 720x576 -vframes 250 -r 25 -t 10 %@",BundlePath(@"100.png"),DocumentPath(@"output.mp4")]];
    
    // ffmpeg -loop 1 -i theLastImage.png -c:v libx264 -t 4 -pix_fmt yuv420p -vf scale=720:960 materialVideo.mp4
//    BOOL result = [ffmpegTool ffmpeg:[NSString stringWithFormat:@"ffmpeg -loop 1 -i %@ -c:v libx264 -t 4 -pix_fmt yuv420p -vf scale=720:960 -y %@",BundlePath(@"dongci.png"),DocumentPath(@"output.mp4")]];
    
    BOOL result = [ffmpegTool ffmpeg:[NSString stringWithFormat:@"ffmpeg -i %@ -c:v libx264 -b 200k -r 24 -vf scale=720:960 -y %@",BundlePath(@"dongci.MP4"),DocumentPath(@"output.mp4")]];
    
    //    BOOL result = [DCFFmpegTool ffmpeg:@"ffmpeg --help full | grep loop"];
    
    //    BOOL result = [DCFFmpegTool ffmpeg:@"ffmpeg -muxers"];
    //    BOOL result = [DCFFmpegTool ffmpeg:@"ffmpeg -h muxer=png"];
    //     BOOL result = [DCFFmpegTool ffmpeg:@"ffmpeg -formats"];
    
    NSLog(@"result:%d",result);
}


@end
