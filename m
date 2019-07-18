From: Anson.Huang@nxp.com
Subject: [PATCH 2/4] ARM: dts: imx6sl: move GIC to right location in DT
Date: Thu, 18 Jul 2019 17:15:06 +0800
Message-ID: <20190718091508.3248-2-Anson.Huang@nxp.com>
References: <20190718091508.3248-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718091508.3248-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

GIC is inside of SoC from architecture perspective, it should
be located inside of soc node in DT.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sl.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index b36fc01..3a96b55 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -77,15 +77,6 @@
 		};
 	};
 
-	intc: interrupt-controller@a01000 {
-		compatible = "arm,cortex-a9-gic";
-		#interrupt-cells = <3>;
-		interrupt-controller;
-		reg = <0x00a01000 0x1000>,
-		      <0x00a00100 0x100>;
-		interrupt-parent = <&intc>;
-	};
-
 	clocks {
 		ckil {
 			compatible = "fixed-clock";
@@ -133,6 +124,15 @@
 			clocks = <&clks IMX6SL_CLK_OCRAM>;
 		};
 
+		intc: interrupt-controller@a01000 {
+			compatible = "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x00a01000 0x1000>,
+			      <0x00a00100 0x100>;
+			interrupt-parent = <&intc>;
+		};
+
 		L2: l2-cache@a02000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x00a02000 0x1000>;
-- 
2.7.4
