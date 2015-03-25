From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [RESEND PATCH v6 2/2] ARM: dts: hip04: add GPIO pieces
Date: Wed, 25 Mar 2015 14:57:45 +0800
Message-ID: <1427266665-226718-3-git-send-email-wangzhou1@hisilicon.com>
References: <1427266665-226718-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427266665-226718-1-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hisilicon Soc hip04 has four GPIO controllers, each one has 32
GPIOs and can be configured to be an interrupt controller.The GPIO
controllers are compatible with the snps,dw-apb-gpio driver.
This patch add the corresponding device tree nodes.

Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm/boot/dts/hip04.dtsi | 75 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
index 2388145..267942a 100644
--- a/arch/arm/boot/dts/hip04.dtsi
+++ b/arch/arm/boot/dts/hip04.dtsi
@@ -269,6 +269,81 @@
 			interrupts = <0 372 4>;
 		};
 
+		gpio@4003000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4003000 0x1000>;
+
+			gpio3: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 392 4>;
+			};
+		};
+
+		gpio@4002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4002000 0x1000>;
+
+			gpio2: gpio-controller@0 {
+			compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 391 4>;
+			};
+		};
+
+		gpio@4001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4001000 0x1000>;
+
+			gpio1: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 390 4>;
+			};
+		};
+
+		gpio@4000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4000000 0x1000>;
+
+			gpio0: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 389 4>;
+			};
+		};
 	};
 
 	etb@0,e3c42000 {
-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
