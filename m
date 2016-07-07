From: Hao Zhang <hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Developing Linux Kernel Driver for media Codec Driver
Date: Thu, 7 Jul 2016 16:12:21 +0800
Message-ID: <CAJeuY79hD7Zzp7j1D=AfW+MRqmmFdOxJUW_eyQE+L9MjtQHGow@mail.gmail.com>
Reply-To: hao5781286-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDKITZOARQMBBZU57C5QKGQECBV6FFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org
Cc: kernelnewbies-7JyXY6prKcjpASu1u0TL5ti2O/JbrIOy@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

hi all

i am developing a linux kernel driver for a 4-CH AHD2.0 RX and 9-CH
Audio Codec which is named nvp6124 .

wedsite : http://www.nextchip.com/ch/products/product.asp?hGubun=AHD.

below are few of its characteristics:

video codec:
it digitizes and decodes ntsc/pal/comet/AHD1.0/AHD2.O video signal into digital
video components which represents 8bit bt656/1120 4:2:2 byte interleave fotmat.

audio codec:
output pcm digital signal converted from analog audio input signals and analog
audio signals converted from pcm digital audio.

control interface:
control and configure through i2c interface.

video interface:
4ch analog video input and output 2ch digital signal, each channal has
8 data ports and a clk clock port
which can connect to the embedded processer.


audio interface(two i2s interface):
audio data convert to PCM data,and outputed via i2s interface .
PCM data can also input via i2s interface, the input audio data is
outputed via internal DAC.


i want to submit the driver, but i have some problem on the below points:

1.must i submit the driver through device tree binding? Does the
kernel tree accept the driver without device tree binding?
just see the video interface ,i know i2c port can binding below the
i2c node, but, how can i bind other data port and clock signal port
with device trees?

2.how to use device tree to bind device and how does the kernel uses
it to match device? can i obtain some document about this?

3.i creat the driver for Cubieboard one(allwinner a10 processer) and
Banana PI BPI-M1(allwinner a20 processer) ,if i submit patch
,which  kernel version shoudle i use ? must i use the lastest kernel
(download in www.kernel.org isn't the sdk of the board)in that boards
?

4.does someone know which lastest kernel version does Cubieboard one
and Banana PI BPI-M1 supports?

5.the maintainer doesn't has the device, how do they know the driver
is work well on my board? just buit without error or warning ?



Best regards :)

Hao Zhang
