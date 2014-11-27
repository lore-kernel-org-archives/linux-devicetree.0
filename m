From: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] apf27dev: add max5821 to the dts
Date: Thu, 27 Nov 2014 21:33:59 +0100
Message-ID: <1417120439-11784-1-git-send-email-tremyfr@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Philippe Reynes <tremyfr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx27-apf27dev.dts |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
index da306c5..bba3f41 100644
--- a/arch/arm/boot/dts/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/imx27-apf27dev.dts
@@ -59,6 +59,21 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reg_max5821: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "max5821-reg";
+			regulator-min-microvolt = <2500000>;
+			regulator-max-microvolt = <2500000>;
+			regulator-always-on;
+		};
+	};
 };
 
 &cspi1 {
@@ -107,6 +122,12 @@
 		compatible = "dallas,ds1374";
 		reg = <0x68>;
 	};
+
+	max5821@38 {
+		compatible = "maxim,max5821";
+		reg = <0x38>;
+		vref-supply = <&reg_max5821>;
+	};
 };
 
 &i2c2 {
-- 
1.7.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
