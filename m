From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 7/7] ARM: dts: imx6ull: add UART8 support
Date: Tue,  2 Jan 2018 17:42:23 +0100
Message-ID: <20180102164223.15230-7-stefan@agner.ch>
References: <20180102164223.15230-1-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180102164223.15230-1-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In i.MX 6ULL UART8 is part of the AIPS-3 memory map instead of
AIPS-1. Clocks and interrupts remain the same.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/imx6ull.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.dtsi
index bc2cd4fb8b12..571ddd71cdba 100644
--- a/arch/arm/boot/dts/imx6ull.dtsi
+++ b/arch/arm/boot/dts/imx6ull.dtsi
@@ -43,6 +43,9 @@
 #include "imx6ull-pinfunc.h"
 #include "imx6ull-pinfunc-snvs.h"
 
+/* Delete UART8 in AIPS-1 (i.MX6UL specific) */
+/delete-node/ &uart8;
+
 / {
 	soc {
 		aips3: aips-bus@2200000 {
@@ -56,6 +59,17 @@
 				compatible = "fsl,imx6ull-iomuxc-snvs";
 				reg = <0x02290000 0x4000>;
 			};
+
+			uart8: serial@2288000 {
+				compatible = "fsl,imx6ul-uart",
+					     "fsl,imx6q-uart";
+				reg = <0x02288000 0x4000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_UART8_IPG>,
+					 <&clks IMX6UL_CLK_UART8_SERIAL>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
