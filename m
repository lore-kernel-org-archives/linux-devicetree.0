From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 08/11] ARM: dts: sun9i: a80-optimus: Add AXP809
 PMIC device node and regulators
Date: Tue,  2 Feb 2016 18:27:41 +0800
Message-ID: <1454408864-24112-9-git-send-email-wens@csie.org>
References: <1454408864-24112-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBNEJYK2QKGQEKY3FRWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454408864-24112-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AXP809 PMIC is the primary PMIC. It provides various supply voltages
for the SoC and other peripherals. The PMIC's interrupt line is
connected to NMI pin of the SoC.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 121 +++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index 958160e40fd0..7f6bf6138966 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -161,7 +161,7 @@
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>, <&mmc0_cd_pin_optimus>;
-	vmmc-supply = <&reg_vcc3v0>;
+	vmmc-supply = <&reg_dcdc1>;
 	bus-width = <4>;
 	cd-gpios = <&pio 7 18 GPIO_ACTIVE_HIGH>; /* PH8 */
 	cd-inverted;
@@ -171,7 +171,7 @@
 &mmc2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_8bit_pins>;
-	vmmc-supply = <&reg_vcc3v0>;
+	vmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
 	non-removable;
 	cap-mmc-hw-reset;
@@ -204,6 +204,123 @@
 
 &r_rsb {
 	status = "okay";
+
+	axp809: pmic@3a3 {
+		reg = <0x3a3>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp809.dtsi"
+
+&reg_aldo1 {
+	/* TODO: This should be handled by the USB PHY driver */
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc33-usbh";
+};
+
+&reg_aldo2 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pb-io-cam";
+};
+
+&reg_dc5ldo {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-cpus-09-usbh";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-3v";
+};
+
+&reg_dcdc2 {
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-gpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-cpua";
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vdd-sys-usb0-hdmi";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1425000>;
+	regulator-max-microvolt = <1575000>;
+	regulator-name = "vcc-dram";
+};
+
+&reg_dldo1 {
+	/*
+	 * The WiFi chip supports a wide range (3.0 ~ 4.8V) of voltages,
+	 * and so does this regulator (3.0 ~ 4.2V), but Allwinner SDK
+	 * always sets it to 3.3V.
+	 */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-wifi";
+};
+
+&reg_dldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-pl";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vcc-dvdd-cam";
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pe";
+};
+
+&reg_eldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-pm-codec-io1";
+};
+
+&reg_ldo_io0 {
+	regulator-always-on;
+	regulator-min-microvolt = <3000000>;
+	regulator-max-microvolt = <3000000>;
+	regulator-name = "vcc-pg";
+};
+
+&reg_ldo_io1 {
+	regulator-min-microvolt = <2500000>;
+	regulator-max-microvolt = <2500000>;
+	regulator-name = "vcc-pa-gmac-2v5";
+};
+
+&reg_rtc_ldo {
+	regulator-name = "vcc-rtc-vdd1v8-io";
 };
 
 &uart0 {
-- 
2.7.0
