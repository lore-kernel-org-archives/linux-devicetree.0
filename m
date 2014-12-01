From: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: rockchip: Add input voltage supply regulators in pmic for Marsboard
Date: Mon,  1 Dec 2014 18:37:26 +0000
Message-ID: <1417459046-13725-1-git-send-email-romain.perier@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Romain Perier <romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a-marsboard.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a-marsboard.dts b/arch/arm/boot/dts/rk3066a-marsboard.dts
index f766024..5999708 100644
--- a/arch/arm/boot/dts/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rk3066a-marsboard.dts
@@ -60,6 +60,14 @@
 		startup-delay-us = <100000>;
 		vin-supply = <&vcc_io>;
 	};
+
+	vsys: vsys-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+	};
 };
 
 &i2c1 {
@@ -72,8 +80,14 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 
+		vcc1-supply = <&vsys>;
+		vcc2-supply = <&vsys>;
+		vcc3-supply = <&vsys>;
+		vcc4-supply = <&vsys>;
 		vcc5-supply = <&vcc_io>;
 		vcc6-supply = <&vcc_io>;
+		vcc7-supply = <&vsys>;
+		vccio-supply = <&vsys>;
 
 		regulators {
 			vcc_rtc: regulator@0 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
