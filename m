From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/3] ARM: imx6: adopt DT to new GPC binding
Date: Mon, 23 Nov 2015 16:07:03 +0100
Message-ID: <1448291223-9938-4-git-send-email-l.stach@pengutronix.de>
References: <1448291223-9938-1-git-send-email-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448291223-9938-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adopt the i.MX6Q/DL DT to the new and more flexible GPC binding.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 2b6cc8bf3c5c..0426a1cbf24e 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -402,7 +402,7 @@
 				clocks = <&clks IMX6QDL_CLK_VPU_AXI>,
 					 <&clks IMX6QDL_CLK_MMDC_CH0_AXI>;
 				clock-names = "per", "ahb";
-				power-domains = <&gpc 1>;
+				power-domains = <&pd_pu>;
 				resets = <&src 1>;
 				iram = <&ocram>;
 			};
@@ -765,14 +765,29 @@
 				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 90 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&intc>;
-				pu-supply = <&reg_pu>;
-				clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
-					 <&clks IMX6QDL_CLK_GPU3D_SHADER>,
-					 <&clks IMX6QDL_CLK_GPU2D_CORE>,
-					 <&clks IMX6QDL_CLK_GPU2D_AXI>,
-					 <&clks IMX6QDL_CLK_OPENVG_AXI>,
-					 <&clks IMX6QDL_CLK_VPU_AXI>;
-				#power-domain-cells = <1>;
+				clocks = <&clks IMX6QDL_CLK_IPG>;
+				clock-names = "ipg";
+
+				pgc {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					power-domain@0 {
+						reg = <0>;
+						#power-domain-cells = <0>;
+					};
+					pd_pu: power-domain@1 {
+						reg = <1>;
+						#power-domain-cells = <0>;
+						domain-supply = <&reg_pu>;
+						clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
+						         <&clks IMX6QDL_CLK_GPU3D_SHADER>,
+						         <&clks IMX6QDL_CLK_GPU2D_CORE>,
+						         <&clks IMX6QDL_CLK_GPU2D_AXI>,
+						         <&clks IMX6QDL_CLK_OPENVG_AXI>,
+						         <&clks IMX6QDL_CLK_VPU_AXI>;
+					};
+				};
 			};
 
 			gpr: iomuxc-gpr@020e0000 {
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
