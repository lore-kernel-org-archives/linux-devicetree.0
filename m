From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 02/11] ARM: dts: imx6qdl: Add compatible, clocks, irqs to MIPI CSI-2 node
Date: Mon, 12 Jun 2017 11:23:55 -0700
Message-ID: <1497291844-14632-3-git-send-email-steve_longerbeam@mentor.com>
References: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

Add to the MIPI CSI2 receiver node: compatible strings,
interrupt sources, and clocks.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index 50534dd..381b482 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1140,7 +1140,14 @@
 			};
 
 			mipi_csi: mipi@021dc000 {
+				compatible = "fsl,imx6-mipi-csi2";
 				reg = <0x021dc000 0x4000>;
+				interrupts = <0 100 0x04>, <0 101 0x04>;
+				clocks = <&clks IMX6QDL_CLK_HSI_TX>,
+					 <&clks IMX6QDL_CLK_VIDEO_27M>,
+					 <&clks IMX6QDL_CLK_EIM_PODF>;
+				clock-names = "dphy", "ref", "pix";
+				status = "disabled";
 			};
 
 			mipi_dsi: mipi@021e0000 {
-- 
2.7.4
