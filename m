From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 0/2]  Add two automotive field Evaluation boards from rockchip
Date: Sun, 11 Sep 2016 01:40:48 +0800
Message-ID: <1473529249-6151-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



Changes in v1:
- board rename
- add vendor prefix for i2c interfaced sensors
- use stdout-path to set the default console

Andy Yan (2):
  ARM: dts: add rockchip PX3 Evaluation board
  arm64: dts: rockchip: Add PX5 Evaluation board

 Documentation/devicetree/bindings/arm/rockchip.txt |   8 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3188-px3-evb.dts               | 337 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    | 304 +++++++++++++++++++
 5 files changed, 651 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3188-px3-evb.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts

-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
