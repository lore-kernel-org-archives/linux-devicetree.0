From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 0/5] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Fri, 14 Oct 2016 14:57:18 +0530
Message-ID: <1476437243-13297-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is series add dts support for Engicam I.Core M6 qdl modules. just
rebased on top of linux-next of previous set[1].

[1] http://www.spinics.net/lists/kernel/msg2358233.html

Jagan Teki (5):
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
  ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
  ARM: dts: imx6qdl-icore: Add usbhost support
  ARM: dts: imx6qdl-icore: Add usbotg support
  ARM: dts: imx6qdl-icore: Add FEC support

 arch/arm/boot/dts/Makefile           |   2 +
 arch/arm/boot/dts/imx6dl-icore.dts   |  59 ++++++++
 arch/arm/boot/dts/imx6q-icore.dts    |  59 ++++++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi | 271 +++++++++++++++++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
