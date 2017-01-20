From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 4/4] ARM: imx6: adopt DT to new GPC binding
Date: Fri, 20 Jan 2017 16:52:25 +0100
Message-ID: <20170120155225.31905-5-l.stach@pengutronix.de>
References: <20170120155225.31905-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120155225.31905-1-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adopt the i.MX6Q/DL DT to the new and more flexible GPC binding.

Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q.dtsi   |  2 +-
 arch/arm/boot/dts/imx6qdl.dtsi | 38 +++++++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index e9a5d0b8c7b0..dd33849335b2 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -125,7 +125,7 @@
 			clocks = <&clks IMX6QDL_CLK_OPENVG_AXI>,
 				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
 			clock-names = "bus", "core";
-			power-domains = <&gpc 1>;
+			power-domains = <&pd_pu>;
 		};
 
 		ipu2: ipu@02800000 {
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 53e6e63cbb02..ce7069be5852 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1,3 +1,4 @@
+
 /*
  * Copyright 2011 Freescale Semiconductor, Inc.
  * Copyright 2011 Linaro Ltd.
@@ -148,7 +149,7 @@
 				 <&clks IMX6QDL_CLK_GPU3D_CORE>,
 				 <&clks IMX6QDL_CLK_GPU3D_SHADER>;
 			clock-names = "bus", "core", "shader";
-			power-domains = <&gpc 1>;
+			power-domains = <&pd_pu>;
 		};
 
 		gpu_2d: gpu@00134000 {
@@ -158,7 +159,7 @@
 			clocks = <&clks IMX6QDL_CLK_GPU2D_AXI>,
 				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
 			clock-names = "bus", "core";
-			power-domains = <&gpc 1>;
+			power-domains = <&pd_pu>;
 		};
 
 		timer@00a00600 {
@@ -425,7 +426,7 @@
 				clocks = <&clks IMX6QDL_CLK_VPU_AXI>,
 					 <&clks IMX6QDL_CLK_MMDC_CH0_AXI>;
 				clock-names = "per", "ahb";
-				power-domains = <&gpc 1>;
+				power-domains = <&pd_pu>;
 				resets = <&src 1>;
 				iram = <&ocram>;
 			};
@@ -788,14 +789,29 @@
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
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
