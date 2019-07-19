From: Wen He <wen.he_1@nxp.com>
Subject: [v2 2/4] arm64: dts: ls1028a: Add properties for HDP Controller.
Date: Fri, 19 Jul 2019 18:09:40 +0800
Message-ID: <20190719100942.12016-2-wen.he_1@nxp.com>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, robh+dt@kernel.org
Cc: leoyang.li@nxp.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch enables the HDP controller driver on the LS1028A.

Signed-off-by: Alison Wang <aslion.wang@nxp.com>
Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index aef5b06a98d5..19612ad9a4a1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -91,6 +91,13 @@
 		clock-output-names= "pclk";
 	};
 
+	hdpclk: clock-hdpcore {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <162500000>;
+		clock-output-names= "hdpclk";
+	};
+
 	reboot {
 		compatible ="syscon-reboot";
 		regmap = <&dcfg>;
@@ -558,7 +565,25 @@
 
 		port {
 			dp0_out: endpoint {
+				remote-endpoint = <&dp1_out>;
+			};
+		};
+	};
 
+	hdptx0: display@f200000 {
+		compatible = "fsl,ls1028a-dp";
+		reg = <0x0 0xf1f0000 0x0 0xffff>,
+		    <0x0 0xf200000 0x0 0xfffff>;
+		interrupts = <0 221 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&sysclk>, <&hdpclk>, <&dpclk>,
+			 <&dpclk>, <&dpclk>, <&pclk>, <&dpclk>;
+		clock-names = "clk_ipg", "clk_core", "clk_pxl",
+			      "clk_pxl_mux", "clk_pxl_link", "clk_apb",
+			      "clk_vif";
+
+		port {
+			dp1_out: endpoint {
+				remote-endpoint = <&dp0_out>;
 			};
 		};
 	};
-- 
2.17.1
