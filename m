From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/2] Add usb3 ctrl node on RK3328 SoCs and enable usb3 host on RK3328 evb
Date: Thu, 17 Aug 2017 15:35:40 +0800
Message-ID: <1502955342-21985-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add support for usb3 controller on RK3328 SoCs.
This series don't include usb3 phy patches, and I will try
to submit usb3 phy patches individually later.
Tested on RK3328 evaluation board.

William Wu (2):
  arm64: dts: rockchip: add usb3 controller node for RK3328 SoCs
  arm64: dts: rockchip: enable usb3 for RK3328 evaluation board

 .../devicetree/bindings/usb/rockchip,dwc3.txt      |  4 +++-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |  9 ++++++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           | 27 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
