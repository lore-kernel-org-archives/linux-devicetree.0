From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] arm64: dts: imx8mn: Add "fsl,imx8mq-src" as src's fallback compatible
Date: Tue, 10 Sep 2019 10:39:19 -0400
Message-ID: <1568126359-2887-1-git-send-email-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

i.MX8MN can reuse i.MX8MQ's src driver, add "fsl,imx8mq-src" as
src's fallback compatible to enable it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 785f4c4..d94db95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -371,7 +371,7 @@
 			};
 
 			src: reset-controller@30390000 {
-				compatible = "fsl,imx8mn-src", "syscon";
+				compatible = "fsl,imx8mn-src", "fsl,imx8mq-src", "syscon";
 				reg = <0x30390000 0x10000>;
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				#reset-cells = <1>;
-- 
2.7.4
