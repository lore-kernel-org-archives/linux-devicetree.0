From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/10] arm: dts: lpc32xx: enable SIC1 and SIC2 by default
Date: Fri, 20 Nov 2015 03:28:45 +0200
Message-ID: <1447982925-30138-11-git-send-email-vz@mleia.com>
References: <1447982925-30138-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447982925-30138-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

After moving to a new LPC32xx interrupt controller driver it is safe
to enable SIC1 and SIC2 devices, this allows to get working ADC, RTC,
I2C and USB peripheral controllers again after long period since ...

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 8dda6e7..603f005 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -341,8 +341,6 @@
 						 <&wakeup_int 24 20>, <&wakeup_int 29 8>,
 						 <&wakeup_int 30 6>, <&wakeup_int 31 7>,
 						 <&wakeup_pin 25 4>;
-
-				status = "disabled";
 			};
 
 			sic2: interrupt-controller@40010000 {
@@ -369,8 +367,6 @@
 						 <&wakeup_pin 16 28>, <&wakeup_pin 18 18>,
 						 <&wakeup_pin 23 7>, <&wakeup_pin 26 19>,
 						 <&wakeup_pin 30 12>;
-
-				status = "disabled";
 			};
 
 			uart1: serial@40014000 {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
