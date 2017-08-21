From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/3] add usb support for rv1108 SoCs
Date: Mon, 21 Aug 2017 16:39:25 +0800
Message-ID: <1503304768-14520-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This serie adds USB related device nodes support for rv1108 SoCs, in addition,
Rockchip's rv1108-evb board has one usb otg controller and one usb host
controller, each controller connect with one usb-phy port through UTMI+
interface, the changes also enable usb related for rv1108-evb board.

Frank Wang (3):
  dt-bindings: update dt-binding for rv1108 SoCs
  ARM: dts: rockchip: add usb nodes for rv1108 SoCs
  ARM: dts: rockchip: enable usb for rv1108-evb

 .../devicetree/bindings/soc/rockchip/grf.txt       |  3 +
 arch/arm/boot/dts/rv1108-evb.dts                   | 24 +++++++
 arch/arm/boot/dts/rv1108.dtsi                      | 73 +++++++++++++++++++++-
 3 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
