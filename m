From: Rostislav Lisovy <lisovy@gmail.com>
Subject: [PATCH 2/4] ARM: dts: i.MX53: Internal keyboard controller
Date: Tue, 22 Oct 2013 19:07:21 +0200
Message-ID: <1382461643-16790-3-git-send-email-lisovy@gmail.com>
References: <1382461643-16790-1-git-send-email-lisovy@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382461643-16790-1-git-send-email-lisovy@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>
Cc: pisa@cmp.felk.cvut.cz, Rostislav Lisovy <lisovy@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rostislav Lisovy <lisovy@gmail.com>

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 55e83d1..362eca0 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -281,6 +281,14 @@
 				#interrupt-cells = <2>;
 			};
 
+			kpp: kpp@53f94000 {
+				compatible = "fsl,imx53-kpp", "fsl,imx21-kpp";
+				reg = <0x53f94000 0x4000>;
+				interrupts = <60>;
+				clocks = <&clks 0>;
+				status = "disabled";
+			};
+
 			wdog1: wdog@53f98000 {
 				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
 				reg = <0x53f98000 0x4000>;
-- 
1.7.10.4
