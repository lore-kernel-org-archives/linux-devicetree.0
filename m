From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 1/2] ARM: dts: imx53: Add capture-subsystem device
Date: Sat, 19 Jan 2019 13:18:14 -0800
Message-ID: <20190119211815.25101-2-slongerbeam@gmail.com>
References: <20190119211815.25101-1-slongerbeam@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119211815.25101-1-slongerbeam@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add video capture_subsystem device node, and include both CSI ports.
Prepare for adding sensors by adding the parallel sensor anchor endpoints
to the CSI ports.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 arch/arm/boot/dts/imx53.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index b3300300aabe..a78a447c4b4d 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -31,6 +31,7 @@
 		i2c0 = &i2c1;
 		i2c1 = &i2c2;
 		i2c2 = &i2c3;
+		ipu0 = &ipu;
 		mmc0 = &esdhc1;
 		mmc1 = &esdhc2;
 		mmc2 = &esdhc3;
@@ -71,6 +72,11 @@
 		ports = <&ipu_di0>, <&ipu_di1>;
 	};
 
+	capture_subsystem {
+		compatible = "fsl,imx-capture-subsystem";
+		ports = <&ipu_csi0>, <&ipu_csi1>;
+	};
+
 	tzic: tz-interrupt-controller@fffc000 {
 		compatible = "fsl,imx53-tzic", "fsl,tzic";
 		interrupt-controller;
@@ -158,10 +164,16 @@
 
 			ipu_csi0: port@0 {
 				reg = <0>;
+
+				ipu_csi0_from_parallel_sensor: endpoint {
+				};
 			};
 
 			ipu_csi1: port@1 {
 				reg = <1>;
+
+				ipu_csi1_from_parallel_sensor: endpoint {
+				};
 			};
 
 			ipu_di0: port@2 {
-- 
2.17.1
