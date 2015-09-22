From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] ARM: dts: sun7i: Enable USB DRC on orangepi-mini
Date: Tue, 22 Sep 2015 15:36:02 +0200
Message-ID: <1442928966-6418-3-git-send-email-hdegoede@redhat.com>
References: <1442928966-6418-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBTFSQWYAKGQEX4E2GVY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1442928966-6418-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable the otg/drc usb controller on the orangepi-mini.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
index 73cd81ee..4f65664 100644
--- a/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
+++ b/arch/arm/boot/dts/sun7i-a20-orangepi-mini.dts
@@ -156,7 +156,18 @@
 	status = "okay";
 };
 
+&otg_sram {
+	status = "okay";
+};
+
 &pio {
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PH4";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
 	mmc0_cd_pin_orangepi: mmc0_cd_pin@0 {
 		allwinner,pins = "PH10";
 		allwinner,function = "gpio_in";
@@ -225,6 +236,10 @@
 	regulator-name = "avcc";
 };
 
+&reg_usb0_vbus {
+	status = "okay";
+};
+
 &reg_usb1_vbus {
 	pinctrl-0 = <&usb1_vbus_pin_bananapro>;
 	gpio = <&pio 7 26 GPIO_ACTIVE_HIGH>; /* PH26 */
@@ -243,7 +258,21 @@
 	status = "okay";
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
 &usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>;
+	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_vbus_power-supply = <&usb_power_supply>;
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb1_vbus-supply = <&reg_usb1_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
-- 
2.4.3
