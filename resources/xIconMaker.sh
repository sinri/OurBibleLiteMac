#!/bin/bash

echo This script convert the target Icon_1024.png into other iOS required size
echo +++++++++++++++++++++++++++++++++++++
echo Thine, Jehovah, is the greatness, and the power, and the glory, and the splendour, and the majesty\; for all that is in the heavens and on the earth is thine: thine, Jehovah, is the kingdom, and thou art exalted as Head above all\; 
echo               -- 1 Chronicles 29:11
echo +++++++++++++++++++++++++++++++++++++
for var in 29 58 87 40 120 57 114 180 120 80 76 152 50 100 72 144 60 16 32 64 128 256 512 167 20
do
	echo now converting ${var}
	# echo acting [convert -resize ${var}x${var} Icon_1024.png Icon_${var}.png]
	convert -resize ${var}x${var}! Icon_1024.png Icon_${var}.png
done
echo +++++++++++++++++++++++++++++++++++++
echo All Hail Sinri Edogawa!
echo +++++++++++++++++++++++++++++++++++++
echo This script convert the target LaunchImage_RHD55.png 1242x2208 into other iOS required size

# echo Converting LaunchImage RHD 5.5 Inch 1242x2208
# convert -resize 1242x2208! LaunchImage_RHD55.png LaunchImage_RHD55.png
echo Converting LaunchImage RHD 4.7 Inch 750x1334 
convert -resize 750x1334! LaunchImage_RHD55.png LaunchImage_RHD47.png
echo Converting LaunchImage 2x 640x960
convert -resize 640x960! LaunchImage_RHD55.png LaunchImage_2x.png
echo Converting LaunchImage R 4 Inch 640x1136
convert -resize 640x1136! LaunchImage_RHD55.png LaunchImage_R4.png
echo Converting LaunchImage 1x 320x480
convert -resize 320x480! LaunchImage_RHD55.png LaunchImage_1x.png
echo Converting LaunchImage Pad1x 768x1024
convert -resize 768x1024! LaunchImage_RHD55.png LaunchImage_P1.png
echo Converting LaunchImage Pad2x 1536x2048
convert -resize 1536x2048! LaunchImage_RHD55.png LaunchImage_P2.png

echo OK now!
