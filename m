From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 0/6] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Tue, 27 Sep 2016 00:53:07 +0530
Message-ID: <1474917787-29030-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is series add dts support for Engicam I.Core M6 qdl modules on 
top of */shawnguo/linux.git for-next.

Jagan Teki (6):
  of: Add vendor prefix for Engicam s.r.l company
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
  ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
  ARM: dts: imx6qdl-icore: Add usbhost support
  ARM: dts: imx6qdl-icore: Add usbotg support
  ARM: dts: imx6qdl-icore: Add FEC support

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6dl-icore.dts                 |  59 +++++
 arch/arm/boot/dts/imx6q-icore.dts                  |  59 +++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi               | 271 +++++++++++++++++++++
 5 files changed, 392 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
