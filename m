From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: boundary: remove hardcoded LVDS bus format
Date: Fri,  2 Dec 2016 10:08:38 +0100
Message-ID: <20161202090843.22613-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series removes the hardcoded bus format for the LVDS display nodes of our
platforms.

The reason is that our latest 7" display uses a 24-bit interface and therefore
can't work properly without this series.
https://patchwork.kernel.org/patch/9458053/

Regards,
Gary

Gary Bisson (5):
  ARM: dts: imx6qdl-nit6xlite: remove hardcoded LVDS bus format
  ARM: dts: imx6qdl-nitrogen6_max: remove hardcoded LVDS bus format
  ARM: dts: imx6qdl-nitrogen6_som2: remove hardcoded LVDS bus format
  ARM: dts: imx6qdl-nitrogen6x: remove hardcoded LVDS bus format
  ARM: dts: imx6qdl-sabrelite: remove hardcoded LVDS bus format

 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi      | 2 --
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi  | 4 ----
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 2 --
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi     | 2 --
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi      | 2 --
 5 files changed, 12 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
