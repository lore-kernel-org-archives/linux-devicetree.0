From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH 0/6] ARM: dts: imx: ventana: dt cleanups
Date: Mon,  8 Sep 2014 23:07:25 -0700
Message-ID: <1410242851-30765-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series contains several clean-ups for the Gateworks Ventana boards
already in mainline largely based on conventions that have become standard
since the patches were originally committed. The final patch also adds
additional support for GW52xx CANbus that was not there previously but
depends on the prior patches.

Tim Harvey (6):
  ARM: dts: imx: ventana: remove unsupported dt nodes
  ARM: dts: imx: ventana: remove unused aliases
  ARM: dts: imx: ventana: use gpio constants
  ARM: dts: imx: ventana: configure padconf for all pins
  ARM: dts: imx: ventana: cleanup pinctrl groups
  ARM: dts: imx: ventana: add canbus support for GW52xx

 arch/arm/boot/dts/imx6q-gw5400-a.dts  | 203 +++++++++-----------
 arch/arm/boot/dts/imx6qdl-gw51xx.dtsi | 192 ++++++++-----------
 arch/arm/boot/dts/imx6qdl-gw52xx.dtsi | 314 +++++++++++++------------------
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 338 +++++++++++++---------------------
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 278 +++++++++++++---------------
 5 files changed, 542 insertions(+), 783 deletions(-)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
