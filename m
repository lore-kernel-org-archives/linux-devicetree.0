From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 7/8] arm: dts: lpc32xx: add device nodes for standard timers
Date: Sun, 18 Oct 2015 00:35:56 +0300
Message-ID: <1445117757-8073-8-git-send-email-vz@mleia.com>
References: <1445117757-8073-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445117757-8073-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vzy-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Vladimir Zapolskiy <vzy-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>

NXP LPC32xx SoCs have 6 standard timers, add device nodes to describe
them.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
- none, new change

 arch/arm/boot/dts/lpc32xx.dtsi | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index a595a4b..ba91b20 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -271,11 +271,31 @@
 				#gpio-cells = <3>; /* bank, pin, flags */
 			};
 
+			timer4: timer@4002C000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x4002C000 0x1000>;
+				interrupts = <0x3 0>;
+				status = "disabled";
+			};
+
+			timer5: timer@40030000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x40030000 0x1000>;
+				interrupts = <0x4 0>;
+				status = "disabled";
+			};
+
 			watchdog: watchdog@4003C000 {
 				compatible = "nxp,pnx4008-wdt";
 				reg = <0x4003C000 0x1000>;
 			};
 
+			timer0: timer@40044000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x40044000 0x1000>;
+				interrupts = <0x10 0>;
+			};
+
 			/*
 			 * TSC vs. ADC: Since those two share the same
 			 * hardware, you need to choose from one of the
@@ -297,6 +317,12 @@
 				status = "disabled";
 			};
 
+			timer1: timer@4004C000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x4004C000 0x1000>;
+				interrupts = <0x11 0>;
+			};
+
 			key: key@40050000 {
 				compatible = "nxp,lpc3220-key";
 				reg = <0x40050000 0x1000>;
@@ -304,6 +330,13 @@
 				status = "disabled";
 			};
 
+			timer2: timer@40058000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x40058000 0x1000>;
+				interrupts = <0x12 0>;
+				status = "disabled";
+			};
+
 			pwm1: pwm@4005C000 {
 				compatible = "nxp,lpc3220-pwm";
 				reg = <0x4005C000 0x4>;
@@ -315,6 +348,13 @@
 				reg = <0x4005C004 0x4>;
 				status = "disabled";
 			};
+
+			timer3: timer@40060000 {
+				compatible = "nxp,lpc3220-timer";
+				reg = <0x40060000 0x1000>;
+				interrupts = <0x13 0>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
