From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: socfpga: dtsi: add dw-wdt reset lines
Date: Fri, 12 May 2017 15:34:37 +0200
Message-ID: <f254e0ec6bdab730a2ee112010e2a96efd4a9ed8.1494595189.git-series.s.trumtrar@pengutronix.de>
References: <44e4e733055cfa2ed79091542c7bb17aa24afca9.1494595189.git-series.s.trumtrar@pengutronix.de>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44e4e733055cfa2ed79091542c7bb17aa24afca9.1494595189.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
In-Reply-To: <cover.e174fd0fa926fadf54e0f76e07f238bed3e162fc.1494595189.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
References: <cover.e174fd0fa926fadf54e0f76e07f238bed3e162fc.1494595189.git-series.s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
 arch/arm/boot/dts/socfpga.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 2c43c4d85dee..bd976cfc3b07 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -916,6 +916,7 @@
 			reg = <0xffd02000 0x1000>;
 			interrupts = <0 171 4>;
 			clocks = <&osc1>;
+			resets = <&rst L4WD0_RESET>;
 			status = "disabled";
 		};
 
@@ -924,6 +925,7 @@
 			reg = <0xffd03000 0x1000>;
 			interrupts = <0 172 4>;
 			clocks = <&osc1>;
+			resets = <&rst L4WD1_RESET>;
 			status = "disabled";
 		};
 	};
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
