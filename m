From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 09/19] ARM: dts: aspeed: Add PWM and tachometer node
Date: Fri, 15 Dec 2017 16:54:33 +1030
Message-ID: <20171215062443.23059-10-joel@jms.id.au>
References: <20171215062443.23059-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215062443.23059-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 9 +++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index fa52a01f50b5..f6fee40c04c0 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -189,6 +189,15 @@
 				clocks = <&syscon ASPEED_CLK_APB>;
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2400-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2400-vuart";
 				reg = <0x1e787000 0x40>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 5e6db2aa5c23..96a9d2fe3f0d 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -239,6 +239,15 @@
 				status = "disabled";
 			};
 
+			pwm_tacho: pwm-tacho-controller@1e786000 {
+				compatible = "aspeed,ast2500-pwm-tacho";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x1e786000 0x1000>;
+				clocks = <&syscon ASPEED_CLK_APB>;
+				status = "disabled";
+			};
+
 			vuart: serial@1e787000 {
 				compatible = "aspeed,ast2500-vuart";
 				reg = <0x1e787000 0x40>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
