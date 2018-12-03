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

+ (BOOL)ffmpeg:(NSString *)str progress:(void(^)(float progress,int result))progress;

@end

NS_ASSUME_NONNULL_END
