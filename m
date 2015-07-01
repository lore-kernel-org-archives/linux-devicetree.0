From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] arm: dts: socfpga: Provide the gpio numbers in the controller nodes.
Date: Wed,  1 Jul 2015 21:34:03 +0200
Message-ID: <ae92c1716c6eaa816e07c1551dc1113d6021e93b.1435777856.git.rcochran@linutronix.de>
References: <cover.1435777856.git.rcochran@linutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1435777856.git.rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch provides the base gpio numbers in accordance with the published
data sheet.

Signed-off-by: Richard Cochran <rcochran-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index d9176e6..b3eecc1 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -559,6 +559,7 @@
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
+				snps,base = <0>;
 				snps,nr-gpios = <29>;
 				reg = <0>;
 				interrupt-controller;
@@ -579,6 +580,7 @@
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
+				snps,base = <29>;
 				snps,nr-gpios = <29>;
 				reg = <0>;
 				interrupt-controller;
@@ -599,6 +601,7 @@
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
+				snps,base = <58>;
 				snps,nr-gpios = <27>;
 				reg = <0>;
 				interrupt-controller;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
