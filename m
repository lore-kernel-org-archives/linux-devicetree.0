From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/5] some devicetree changes for rk3288 boards
Date: Sat,  1 Jul 2017 10:02:42 +0800
Message-ID: <1498874567-11219-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since Guillaume have send patches for mali gpu node, let's enable it in more boards.

Jacob Chen (5):
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-tinker
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-evb
  ARM: dts: rockchip: enable ARM Mali GPU on rk3288-fennec
  ARM: dts: rockchip: enable saradc for rk3288-evb
  ARM: dts: rockchip: enable adc key for rk3288-evb

 arch/arm/boot/dts/rk3288-evb.dtsi   | 56 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/rk3288-fennec.dts |  5 ++++
 arch/arm/boot/dts/rk3288-tinker.dts |  5 ++++
 3 files changed, 66 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
