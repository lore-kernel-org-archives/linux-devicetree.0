From: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 1/4] ARM: dts: imx6ul: Add flexcan1 and flexcan2 support
Date: Sat, 20 Feb 2016 11:20:49 +0100
Message-ID: <1455963652-24618-2-git-send-email-michael@amarulasolutions.com>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455963652-24618-1-git-send-email-michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support for FLEXCAN1 and FLEXCAN2.

Signed-off-by: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 99b6465..cd32d1d 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -14,6 +14,8 @@
 
 / {
 	aliases {
+		can0 = &flexcan1;
+		can1 = &flexcan2;
 		ethernet0 = &fec1;
 		ethernet1 = &fec2;
 		gpio0 = &gpio1;
@@ -234,6 +236,28 @@
 					clock-names = "ipg", "per";
 					status = "disabled";
 				};
+
+				flexcan1: can@02090000 {
+					compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
+					reg = <0x02090000 0x4000>;
+					interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX6UL_CLK_CAN1_IPG>,
+						 <&clks IMX6UL_CLK_CAN1_SERIAL>;
+					clock-names = "ipg", "per";
+					stop-mode = <&gpr 0x10 1 0x10 17>;
+					status = "disabled";
+				};
+
+				flexcan2: can@02094000 {
+					compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
+					reg = <0x02094000 0x4000>;
+					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX6UL_CLK_CAN2_IPG>,
+						 <&clks IMX6UL_CLK_CAN2_SERIAL>;
+					clock-names = "ipg", "per";
+					stop-mode = <&gpr 0x10 2 0x10 18>;
+					status = "disabled";
+				};
 			};
 
 			gpt1: gpt@02098000 {
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
