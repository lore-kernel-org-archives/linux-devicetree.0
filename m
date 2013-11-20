From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v8 1/4] ARM: dts: imx27 iomux device node
Date: Wed, 20 Nov 2013 09:45:48 +0100
Message-ID: <1384937151-11160-2-git-send-email-mpa@pengutronix.de>
References: <1384937151-11160-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384937151-11160-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a iomux node for imx27 pinctrl driver. The gpio
registers are embedded in the iomux memory area. So this patch moves
them into the iomux node for a better hardware description.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx27.dtsi | 125 +++++++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 58 deletions(-)

diff --git a/arch/arm/boot/dts/imx27.dtsi b/arch/arm/boot/dts/imx27.dtsi
index b7a1c6d..f119296 100644
--- a/arch/arm/boot/dts/imx27.dtsi
+++ b/arch/arm/boot/dts/imx27.dtsi
@@ -10,6 +10,7 @@
  */
 
 #include "skeleton.dtsi"
+#include "imx27-pingrp.h"
 
 / {
 	aliases {
@@ -235,64 +236,72 @@
 				status = "disabled";
 			};
 
-			gpio1: gpio@10015000 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015000 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio2: gpio@10015100 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015100 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio3: gpio@10015200 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015200 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio4: gpio@10015300 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015300 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio5: gpio@10015400 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015400 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-			};
-
-			gpio6: gpio@10015500 {
-				compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
-				reg = <0x10015500 0x100>;
-				interrupts = <8>;
-				gpio-controller;
-				#gpio-cells = <2>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
+			iomuxc: iomuxc@10015000 {
+				compatible = "fsl,imx27-iomuxc";
+				reg = <0x10015000 0x600>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				gpio1: gpio@10015000 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015000 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				gpio2: gpio@10015100 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015100 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				gpio3: gpio@10015200 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015200 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				gpio4: gpio@10015300 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015300 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				gpio5: gpio@10015400 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015400 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
+
+				gpio6: gpio@10015500 {
+					compatible = "fsl,imx27-gpio", "fsl,imx21-gpio";
+					reg = <0x10015500 0x100>;
+					interrupts = <8>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+				};
 			};
 
 			audmux: audmux@10016000 {
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
