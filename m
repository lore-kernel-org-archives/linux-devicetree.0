From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 7/9] ARM: dts: sun9i: Enable USB support on
 A80 Optimus board
Date: Sun, 25 Jan 2015 20:22:08 +0800
Message-ID: <1422188530-1794-8-git-send-email-wens@csie.org>
References: <1422188530-1794-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7N7SOTAKGQEH4IAJUY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1422188530-1794-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index c4de9cb9a5f6..16d30bb3a872 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -83,6 +83,18 @@
 	};
 };
 
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ehci2 {
+	status = "okay";
+};
+
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins_a>;
@@ -94,6 +106,14 @@
 	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 };
 
+&ohci0 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
 &pio {
 	led_pins_optimus: led-pins@0 {
 		allwinner,pins = "PH0", "PH1";
@@ -108,6 +128,20 @@
 		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
 		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 	};
+
+	usb1_vbus_pin_optimus: usb1_vbus_pin@1 {
+		allwinner,pins = "PH4";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
+
+	usb3_vbus_pin_optimus: usb3_vbus_pin@1 {
+		allwinner,pins = "PH5";
+		allwinner,function = "gpio_out";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
+	};
 };
 
 &mmc0 {
@@ -129,6 +163,18 @@
 	status = "okay";
 };
 
+&reg_usb1_vbus {
+	pinctrl-0 = <&usb1_vbus_pin_optimus>;
+	gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	status = "okay";
+};
+
+&reg_usb3_vbus {
+	pinctrl-0 = <&usb3_vbus_pin_optimus>;
+	gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
@@ -145,3 +191,17 @@
 	/* Enable internal pull-up */
 	allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
 };
+
+&usbphy1 {
+	vbus-supply = <&reg_usb1_vbus>;
+	status = "okay";
+};
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usbphy3 {
+	vbus-supply = <&reg_usb3_vbus>;
+	status = "okay";
+};
-- 
2.1.4
