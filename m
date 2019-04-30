From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v2] arm64: dts: imx8mq: Add a node for irqsteer
Date: Tue, 30 Apr 2019 19:15:55 +0200
Message-ID: <72b64db0a3ae682d1c6f435fecf7876de2f57bc3.1556644355.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a node for the irqsteer interrupt controller found on the iMX8MQ
SoC.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

---
Changes from v1 as per comments from Lucas Stach
* Drop interrupt-parent
* Move compatible stings to a single line

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 2cc939cfbd75..311f536d3bbf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -798,6 +798,25 @@
 			};
 		};
 
+		bus@32c00000 { /* AIPS4 */
+			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x32c00000 0x32c00000 0x400000>;
+
+			irqsteer: interrupt-controller@32e2d000 {
+				compatible = "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
+				reg = <0x32e2d000 0x1000>;
+				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+				clock-names = "ipg";
+				fsl,channel = <0>;
+				fsl,num-irqs = <64>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		gpu: gpu@38000000 {
 			compatible = "vivante,gc";
 			reg = <0x38000000 0x40000>;
-- 
2.20.1
