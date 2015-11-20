From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/10] arm: dts: lpc32xx: add description of IC wakeup controllers
Date: Fri, 20 Nov 2015 03:28:41 +0200
Message-ID: <1447982925-30138-7-git-send-email-vz@mleia.com>
References: <1447982925-30138-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447982925-30138-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change adds System Control Block simple bus device tree node and
populates it with two first subdevices, wakeup controllers connected
to LPC32xx interrupt controllers MIC, SIC1 and SIC2.

The change also assigns a name to MIC controller and set its wakeup
sources.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index fbf1984b..b2735dd 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -295,6 +295,18 @@
 					clocks = <&xtal_32k>, <&xtal>;
 					clock-names = "xtal_32k", "xtal";
 				};
+
+				wakeup_int: wakeup-controller@20 {
+					compatible = "nxp,lpc3220-wakeup";
+					reg = <0x20 0x10>;
+					#wakeup-cells = <2>;
+				};
+
+				wakeup_pin: wakeup-controller@30 {
+					compatible = "nxp,lpc3220-wakeup";
+					reg = <0x30 0x10>;
+					#wakeup-cells = <2>;
+				};
 			};
 
 			/*
@@ -305,9 +317,13 @@
 			 */
 			mic: interrupt-controller@40008000 {
 				compatible = "nxp,lpc3220-mic";
-				interrupt-controller;
 				reg = <0x40008000 0xC000>;
+				interrupt-controller;
+				interrupt-controller-name = "mic";
 				#interrupt-cells = <2>;
+
+				wakeup-sources = <&wakeup_int 7 29>,
+						 <&wakeup_int 25 27>;
 			};
 
 			uart1: serial@40014000 {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
