From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 4/4] ARM: imx6: adopt DT to new GPC binding
Date: Fri, 27 Jan 2017 19:37:28 +0100
Message-ID: <20170127183728.26701-4-l.stach@pengutronix.de>
References: <20170127183728.26701-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170127183728.26701-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adopt the i.MX6Q/DL DT to the new and more flexible GPC binding.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: adapt to changed domain supply name
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
index 53e6e63cbb02..8538b04af097 100644
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
+						power-supply = <&reg_pu>;
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
