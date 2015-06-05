From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/20] ARM: dts: sun4i: Enable USB DRC on Chuwi
 V7 CW0825
Date: Fri,  5 Jun 2015 21:02:11 +0200
Message-ID: <1433530943-12599-9-git-send-email-hdegoede@redhat.com>
References: <1433530943-12599-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBV7EY6VQKGQENCKEVAQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1433530943-12599-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

Enable the otg/drc usb controller on the Chuwi V7 CW0825 tablet.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
index 5878a0b..1430568 100644
--- a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
+++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
@@ -114,6 +114,30 @@
 	status = "okay";
 };
 
+&otg_sram {
+	status = "okay";
+};
+
+&pio {
+	usb0_id_detect_pin: usb0_id_detect_pin@0 {
+		allwinner,pins = "PH4";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+
+	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
+		allwinner,pins = "PH5";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
+	};
+};
+
+&reg_usb0_vbus {
+	status = "okay";
+};
+
 &reg_usb2_vbus {
 	status = "okay";
 };
@@ -124,7 +148,17 @@
 	status = "okay";
 };
 
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &usbphy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_id_detect_pin>, <&usb0_vbus_detect_pin>;
+	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
+	usb0_vbus_det-gpio = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+	usb0_vbus-supply = <&reg_usb0_vbus>;
 	usb2_vbus-supply = <&reg_usb2_vbus>;
 	status = "okay";
 };
-- 
2.4.2
