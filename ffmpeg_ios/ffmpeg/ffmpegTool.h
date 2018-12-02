//
//  ffmpegTool.h
//  ffmpeg_ios
//
//  Created by Yang Jiangang on 2018/12/2.
//  Copyright © 2018 Yang Jiangang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ffmpegTool : NSObject

+ (BOOL)ffmpeg:(NSString *)str;

+ (BOOL)gifToMp4:(NSString *)inputStr output:(NSString *)outputStr;

+ (BOOL)transcode:(NSString *)str output:(NSString *)outputStr;

@end

NS_ASSUME_NONNULL_END
