From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: [PATCH] arm64: dts: imx8qxp: Add lsio_mu13 node
Date: Wed, 19 Jun 2019 00:05:16 +0300
Message-ID: <20190618210516.28866-1-daniel.baluta@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com, anson.huang@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, shengjiu.wang@nxp.com, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

lsio_mu13 node is used to communicate with DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index b2cb818c76c6..dcdbd86897ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -448,6 +448,14 @@
 			status = "disabled";
 		};
 
+		lsio_mu13: mailbox@5d280000 {
+			compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
+			reg = <0x5d280000 0x10000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+			power-domains = <&pd IMX_SC_R_MU_13A>;
+		};
+
 		lsio_gpio0: gpio@5d080000 {
 			compatible = "fsl,imx8qxp-gpio", "fsl,imx35-gpio";
 			reg = <0x5d080000 0x10000>;
-- 
2.17.1
