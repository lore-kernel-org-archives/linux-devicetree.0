From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sll: declare src module to be compatible to imx51's src
Date: Wed, 20 Jun 2018 16:38:37 +0800
Message-ID: <1529483917-18057-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

i.MX6SLL uses same SRC module as i.MX51, add "fsl,imx51-src"
compatible string to enable SRC driver to support setting
CPU resume address for cpu-idle and suspend/resume.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
index c9b0ccc..000e613 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -548,7 +548,7 @@
 			};
 
 			src: reset-controller@20d8000 {
-				compatible = "fsl,imx6sll-src";
+				compatible = "fsl,imx6sll-src", "fsl,imx51-src";
 				reg = <0x020d8000 0x4000>;
 				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
