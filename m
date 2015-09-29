From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: add all hi6220 uart nodes
Date: Tue, 29 Sep 2015 13:29:12 -0700
Message-ID: <1443558552-5734-1-git-send-email-tyler.baker@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds all UART nodes for the Hi6220 SoC. Recently a board[1] has
been developed to standardize UART access across all the 96boards consumer
edition boards. To use this hardware on HiKey we must configure and enable
UART3. However, to ensure backward compatibility we must keep UART0 enabled
as well.

I have removed the hard coded clock index values in favor of using the ones
already defined in include/dt-bindings/clock/hi6220-clock.h.

This patch was boot tested on top of next-20150929, with both UART
configurations.

[1] http://www.seeedstudio.com/depot/96Boards-UART-p-2525.html?ref=newInBazaar

Signed-off-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  4 +++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 43 +++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index e36a539..34486bc 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -18,6 +18,10 @@
 
 	aliases {
 		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
 	};
 
 	chosen {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 3f03380..82d2488 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/hi6220-clock.h>
 
 / {
 	compatible = "hisilicon,hi6220";
@@ -164,8 +165,48 @@
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
+			clocks = <&ao_ctrl HI6220_UART0_PCLK>,
+				 <&ao_ctrl HI6220_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
 		};
+
+		uart1: uart@f7111000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf7111000 0x0 0x1000>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_ctrl HI6220_UART1_PCLK>,
+				 <&sys_ctrl HI6220_UART1_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: uart@f7112000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf7112000 0x0 0x1000>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_ctrl HI6220_UART2_PCLK>,
+				 <&sys_ctrl HI6220_UART2_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart3: uart@f7113000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf7113000 0x0 0x1000>;
+			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_ctrl HI6220_UART3_PCLK>,
+				 <&sys_ctrl HI6220_UART3_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+
+		uart4: uart@f7114000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf7114000 0x0 0x1000>;
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sys_ctrl HI6220_UART4_PCLK>,
+				 <&sys_ctrl HI6220_UART4_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
 	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
