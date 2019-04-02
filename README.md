# ffmpeg_ios

ios platform ffmpeg tool
support libx264

git clone https://github.com/JiangangYang/ffmpeg_ios --recursive

cd ffmpeg_ios

# build libx264 
  
  cd x264-ios
  
  ./build-x264.sh arm64
  
  ./build-x264.sh lipo
  
# build ffmpeg 

  cd FFmpeg-iOS-build-script
  
  ./build-ffmpeg.sh arm64
  
  ./build-ffmpeg.sh lipo
  
# build ffmpegTool

 cd ffmpeg_ios
 
 open ffmpeg_ios.xcodeproj/
 
 run ffmpeg targets
 
# run ffmpeg_ios targets 
