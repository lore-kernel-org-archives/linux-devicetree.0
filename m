From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: sun9i: a80-optimus: Enable AP6330 WiFi
Date: Fri, 28 Oct 2016 18:11:53 +0800
Message-ID: <20161028101154.7350-3-wens@csie.org>
References: <20161028101154.7350-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028101154.7350-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The board has a Ampak AP6330 WiFi/BT/FM module. Inside it is a Broadcom
BCM4330 WiFi/BT/FM combo IC. The WiFi portion is connected to mmc1, with
the enabling pin connected to PL2. The AC100 RTC provides a low power
clock signal.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index ceb6ef15d669..7e036b2be762 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -105,6 +105,14 @@
 		enable-active-high;
 		gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
 	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&ac100_rtc 1>;
+		clock-names = "ext_clock";
+		/* enables internal regulator and de-asserts reset */
+		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 WL-PMU-EN */
+	};
 };
 
 &ehci0 {
@@ -130,6 +138,21 @@
 	status = "okay";
 };
 
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>, <&wifi_en_pin_optimus>;
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_cldo3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&mmc1_pins {
+	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+};
+
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_8bit_pins>;
@@ -199,6 +222,13 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
+
+	wifi_en_pin_optimus: wifi_en_pin@0 {
+		allwinner,pins = "PL2";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
 };
 
 &r_rsb {
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
