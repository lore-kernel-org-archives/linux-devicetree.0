From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 0/2] Add usb nodes on rk322x SoCs and enable usb on rk3229 evb
Date: Fri,  2 Jun 2017 15:04:23 +0800
Message-ID: <1496387065-21073-1-git-send-email-william.wu@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for usb on rk322x SoCs.

William Wu (2):
  ARM: dts: rockchip: add usb nodes on rk322x
  ARM: dts: rockchip: enable usb for rk3229 evb board

Tested on rk3229 evb board, and depended on the following
patches and config.
[1] https://patchwork.kernel.org/patch/9761507/
[2] https://patchwork.kernel.org/patch/9761511/
[3] https://patchwork.kernel.org/patch/9761515/
[4] https://patchwork.kernel.org/patch/9761519/
[5] enable CONFIG_PHY_ROCKCHIP_INNO_USB2

 arch/arm/boot/dts/rk3229-evb.dts |  74 +++++++++++++++++++++
 arch/arm/boot/dts/rk322x.dtsi    | 138 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 211 insertions(+), 1 deletion(-)

-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
