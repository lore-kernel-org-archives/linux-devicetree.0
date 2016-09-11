From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/5] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Mon, 12 Sep 2016 00:00:36 +0530
Message-ID: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is series add dts support for Engicam I.Core M6 qdl modules.

Jagan Teki (5):
  of: Add vendor prefix for Engicam s.r.l company
  ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
  ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
  ARM: dts: imx6qdl-icore: Add usbhost support
  ARM: dts: imx6qdl-icore: Add usbotg support

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6dl-icore.dts                 |  59 ++++++
 arch/arm/boot/dts/imx6q-icore.dts                  |  59 ++++++
 arch/arm/boot/dts/imx6qdl-icore.dtsi               | 235 +++++++++++++++++++++
 5 files changed, 356 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
