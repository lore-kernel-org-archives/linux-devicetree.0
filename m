From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/4] One fix and some improvements for RK3288 Popmetal board
Date: Sun,  4 Sep 2016 16:32:17 +0800
Message-ID: <1472977937-758-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


This series fix one sensor i2c device address on Popmetal
board, and change some pinctrl description to make it more
clearly, also enable the usb otg function on this board.


Andy Yan (4):
  ARM: dts: rockchip: enable usbotg for Popemtal-rk3288 board
  ARM: dts: rockchip: fix i2c address L3G4200D on PopMetal-RK3288 board
  include: dt-bindings: Add more GPIO bank and index definition for
    rockchip pinctrl
  ARM: dts: use definition in rockchip pinctrl header to describe gpios
    on Popmetal-RK3288

 arch/arm/boot/dts/rk3288-popmetal.dts  | 36 +++++++++++++++++++++-------------
 include/dt-bindings/pinctrl/rockchip.h | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 14 deletions(-)

-- 
2.7.4



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
