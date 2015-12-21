From: Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
Subject: [PATCH] clk: bcm2835: Add PWM clock support to the device tree
Date: Mon, 21 Dec 2015 21:12:59 +0100
Message-ID: <1450728779-2599-1-git-send-email-repk@triplefau.lt>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Remi Pommarel <repk-lovNVp52yxIDGOk2Oe9MvA@public.gmane.org>
---

With the upcomming PWM clock patch (see https://lkml.org/lkml/2015/12/6/74)
PWM can now be used and can be added in the RPI devicetree.

 arch/arm/boot/dts/bcm2835-rpi.dtsi |  4 ++++
 arch/arm/boot/dts/bcm2835.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index 3572f03..55801e0 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -60,3 +60,7 @@
 	status = "okay";
 	bus-width = <4>;
 };
+
+&pwm {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index aef64de..fe8d17c 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -149,6 +149,16 @@
 			status = "disabled";
 		};
 
+		pwm: pwm@7e20c000 {
+			compatible = "brcm,bcm2835-pwm";
+			reg = <0x7e20c000 0x28>;
+			clocks = <&clocks BCM2835_CLOCK_PWM>;
+			assigned-clocks = <&clocks BCM2835_CLOCK_PWM>;
+			assigned-clock-rates = <10000000>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		sdhci: sdhci@7e300000 {
 			compatible = "brcm,bcm2835-sdhci";
 			reg = <0x7e300000 0x100>;
-- 
2.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
