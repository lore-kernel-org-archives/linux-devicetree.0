From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH v6 1/6] ARM: dts: imx: imx7d add iomuxc lpsr device node
Date: Fri, 25 Sep 2015 16:05:57 -0500
Message-ID: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

Add device tree node to support iomuxc-lpsr controller, fsl,iput-sel
phandle allows to get input select register base address which is
shared from main iomuxc controller.

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
Changes for V2: Resend
Changes for V3: Add phandle to get input select register base address
Changes for V4: Resend
Changes for V5: Rename property to fsl,input-sel
Changes for V6: Resend

 arch/arm/boot/dts/imx7d.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 15c2193..92ef0a9 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -446,6 +446,12 @@
 				status = "disabled";
 			};
 
+			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+				compatible = "fsl,imx7d-iomuxc-lpsr";
+				reg = <0x302c0000 0x10000>;
+				fsl,input-sel = <&iomuxc>;
+			};
+
 			gpt1: gpt@302d0000 {
 				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
 				reg = <0x302d0000 0x10000>;
-- 
2.1.4

