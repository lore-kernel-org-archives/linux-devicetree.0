From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH 2/8] ARM: dts: imx: imx7d add iomuxc lpsr device node
Date: Tue, 18 Aug 2015 10:48:53 -0500
Message-ID: <1439912939-17535-2-git-send-email-aalonso@freescale.com>
References: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1439912939-17535-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

Add device tree node to support iomuxc-lpsr controller

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
 arch/arm/boot/dts/imx7d.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index b738ce0..00f70db 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -446,6 +446,11 @@
 				status = "disabled";
 			};
 
+			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+				compatible = "fsl,imx7d-iomuxc-lpsr";
+				reg = <0x302c0000 0x10000>;
+			};
+
 			gpt1: gpt@302d0000 {
 				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
 				reg = <0x302d0000 0x10000>;
-- 
2.1.4

