From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-ntirogen6x: remove duplicate iomux entry
Date: Fri, 25 Nov 2016 00:16:38 +0100
Message-ID: <20161124231638.12840-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NANDF_CS2 pad is also part of the wlan-vmmcgrp iomux group.

Removing is from the usdhc2grp group avoids the following error:
imx6q-pinctrl 20e0000.iomuxc: pin MX6Q_PAD_NANDF_CS2 already requested
by regulators:regulator@4; cannot claim for 2194000.usdhc
imx6q-pinctrl 20e0000.iomuxc: pin-187 (2194000.usdhc) status -22
imx6q-pinctrl 20e0000.iomuxc: could not request pin 187
(MX6Q_PAD_NANDF_CS2) from group usdhc2grp on device 20e0000.iomuxc

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index e476d01..26d0604 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -533,7 +533,6 @@
 				MX6QDL_PAD_SD2_DAT1__SD2_DATA1		0x17071
 				MX6QDL_PAD_SD2_DAT2__SD2_DATA2		0x17071
 				MX6QDL_PAD_SD2_DAT3__SD2_DATA3		0x17071
-				MX6QDL_PAD_NANDF_CS2__GPIO6_IO15	0x000b0
 			>;
 		};
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
