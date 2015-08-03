From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6ul: enable GPC as extended interrupt controller
Date: Tue, 4 Aug 2015 01:12:12 +0800
Message-ID: <1438621932-29738-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable GPC as extended interrupt controller of
GIC, as GPC needs to manage wakeup source for
low power modes.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 138309a..af865d3 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -124,7 +124,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "simple-bus";
-		interrupt-parent = <&intc>;
+		interrupt-parent = <&gpc>;
 		ranges;
 
 		pmu {
@@ -414,7 +414,10 @@
 			gpc: gpc@020dc000 {
 				compatible = "fsl,imx6ul-gpc", "fsl,imx6q-gpc";
 				reg = <0x020dc000 0x4000>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&intc>;
 			};
 
 			iomuxc: iomuxc@020e0000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
