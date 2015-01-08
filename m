From: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] ARM: mediatek: Add sysirq device node to mt6592 dtsi
Date: Thu,  8 Jan 2015 14:23:10 +0800
Message-ID: <1420698191-10878-1-git-send-email-howard.chen@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Mediatek
	SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add sysirq node to mt6592.dtsi and also correct timer interrupt flag.
The old setting works because boot loader already set it.
With a sysirq device node, the timer interrupt can use a correct value.

Signed-off-by: Howard Chen <howard.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/mt6592.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mt6592.dtsi b/arch/arm/boot/dts/mt6592.dtsi
index 31e5a09..67c8174 100644
--- a/arch/arm/boot/dts/mt6592.dtsi
+++ b/arch/arm/boot/dts/mt6592.dtsi
@@ -18,7 +18,7 @@
 
 / {
 	compatible = "mediatek,mt6592";
-	interrupt-parent = <&gic>;
+	interrupt-parent = <&sysirq>;
 
 	cpus {
 		#address-cells = <1>;
@@ -81,18 +81,25 @@
 	timer: timer@10008000 {
 		compatible = "mediatek,mt6577-timer";
 		reg = <0x10008000 0x80>;
-		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&system_clk>, <&rtc_clk>;
 		clock-names = "system-clk", "rtc-clk";
 	};
 
+	sysirq: interrupt-controller@10200220 {
+		compatible = "mediatek,mt6592-sysirq", "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10200220 0x1c>;
+	};
+
 	gic: interrupt-controller@10211000 {
 		compatible = "arm,cortex-a7-gic";
 		interrupt-controller;
 		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
 		reg = <0x10211000 0x1000>,
 		      <0x10212000 0x1000>;
 	};
-
 };
-
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
