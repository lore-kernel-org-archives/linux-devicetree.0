From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/8] arm: dts: lpc32xx: add device node for the second pwm controller
Date: Sun, 18 Oct 2015 00:35:53 +0300
Message-ID: <1445117757-8073-5-git-send-email-vz@mleia.com>
References: <1445117757-8073-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445117757-8073-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

LPC32xx SoCs have two independent PWM controllers, they have different
clock parents, clock gates and even slightly different controls,
each of these two PWM controllers has one output channel. Due to
almost similar controls arranged in a row it is incorrectly assumed
that there is one PWM controller with two channels, fix this problem
in lpc32xx.dtsi, which at the moment prevents separate configuration
of different clock parents and gates for both PWM controllers.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
Changes from v1 to v2:
- none

 arch/arm/boot/dts/lpc32xx.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index fb0e9ae..be82992 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -290,9 +290,15 @@
 				status = "disabled";
 			};
 
-			pwm: pwm@4005C000 {
+			pwm1: pwm@4005C000 {
 				compatible = "nxp,lpc3220-pwm";
-				reg = <0x4005C000 0x8>;
+				reg = <0x4005C000 0x4>;
+				status = "disabled";
+			};
+
+			pwm2: pwm@4005C004 {
+				compatible = "nxp,lpc3220-pwm";
+				reg = <0x4005C004 0x4>;
 				status = "disabled";
 			};
 		};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
