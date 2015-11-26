From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH] arm: dts: berlin2q-marvell-dmp: add sdhci1 fully functionality
Date: Thu, 26 Nov 2015 21:13:08 +0800
Message-ID: <1448543588-1021-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The sdhci1 on Marvell BG2Q DMP board is used as sdcard interface, we
have gpios for card detection, write-protect, vqmmc and vmmc.

This patch adds pinmux for this sdcard interface, then adds regulators
for vmmc and vqmmc, lastly adds cd-gpios, wp-gpios properties.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 43 ++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
index cdcf89b..1fdc1d7 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -84,12 +84,51 @@
 			gpio = <&portb 12 GPIO_ACTIVE_HIGH>;
 			enable-active-high;
 		};
+
+		reg_sdio1_vmmc: regulator@3 {
+			compatible = "regulator-fixed";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-name = "sdio1_vmmc";
+			enable-active-high;
+			regulator-boot-on;
+			gpio = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		reg_sdio1_vqmmc: regulator@4 {
+			compatible = "regulator-gpio";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-name = "sdio1_vqmmc";
+			regulator-type = "voltage";
+			enable-active-high;
+			gpios = <&portb 16 GPIO_ACTIVE_HIGH>;
+			states = <3300000 0x1
+				  1800000 0x0>;
+		};
+	};
+};
+
+&soc_pinctrl {
+	sd1gpio_pmux: sd1pwr-pmux {
+		groups = "G23", "G32";
+		function = "gpio";
+	};
+
+	sd1_pmux: sd1-pmux {
+		groups = "G31";
+		function = "sd1";
 	};
 };
 
 &sdhci1 {
-	broken-cd;
-	sdhci,wp-inverted;
+	vmmc-supply = <&reg_sdio1_vmmc>;
+	vqmmc-supply = <&reg_sdio1_vqmmc>;
+	cd-inverted;
+	cd-gpios = <&portc 30 GPIO_ACTIVE_HIGH>;
+	wp-gpios = <&portd 0 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&sd1gpio_pmux>, <&sd1_pmux>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
