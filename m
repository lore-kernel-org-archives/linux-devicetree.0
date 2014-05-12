From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dts: sun5i: Add new A10s r7 hdmi tv dongle board
Date: Mon, 12 May 2014 14:11:06 +0200
Message-ID: <1399896666-6366-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBX7UYKNQKGQE2C3T66Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The R7 tv-dongle is an A10s based hdmi tv dongle, with 1G RAM, 4G nand flash,
and rtl8189es sdio wifi. It has a standard male hdmi connector, an USB host
port using an USB-A receptacle and a micro-usb receptacle for both power
and USB OTG.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts | 100 ++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 3a38a66..e4c5a79 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -341,6 +341,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += \
 	sun4i-a10-olinuxino-lime.dtb \
 	sun4i-a10-pcduino.dtb \
 	sun5i-a10s-olinuxino-micro.dtb \
+	sun5i-a10s-r7-tv-dongle.dtb \
 	sun5i-a13-olinuxino.dtb \
 	sun5i-a13-olinuxino-micro.dtb \
 	sun6i-a31-app4-evb1.dtb \
diff --git a/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
new file mode 100644
index 0000000..43a9376
--- /dev/null
+++ b/arch/arm/boot/dts/sun5i-a10s-r7-tv-dongle.dts
@@ -0,0 +1,100 @@
+/*
+ * Copyright 2014 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/dts-v1/;
+/include/ "sun5i-a10s.dtsi"
+/include/ "sunxi-common-regulators.dtsi"
+
+/ {
+	model = "R7 A10s hdmi tv-stick";
+	compatible = "allwinner,r7-tv-dongle", "allwinner,sun5i-a10s";
+
+	soc@01c00000 {
+		mmc0: mmc@01c0f000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_r7>;
+			vmmc-supply = <&reg_vcc3v3>;
+			bus-width = <4>;
+			cd-gpios = <&pio 6 1 0>; /* PG1 */
+			cd-inverted;
+			status = "okay";
+		};
+
+		mmc1: mmc@01c10000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc1_pins_a>;
+			vmmc-supply = <&reg_vcc3v3>;
+			bus-width = <4>;
+			non-removable;
+			status = "okay";
+		};
+
+		usbphy: phy@01c13400 {
+			usb1_vbus-supply = <&reg_usb1_vbus>;
+			status = "okay";
+		};
+
+		ehci0: usb@01c14000 {
+			status = "okay";
+		};
+
+		ohci0: usb@01c14400 {
+			status = "okay";
+		};
+
+		pinctrl@01c20800 {
+			mmc0_cd_pin_r7: mmc0_cd_pin@0 {
+				allwinner,pins = "PG1";
+				allwinner,function = "gpio_in";
+				allwinner,drive = <0>;
+				allwinner,pull = <1>;
+			};
+
+			led_pins_r7: led_pins@0 {
+				allwinner,pins = "PB2";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <1>;
+				allwinner,pull = <0>;
+			};
+
+			usb1_vbus_pin_r7: usb1_vbus_pin@0 {
+				allwinner,pins = "PG13";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+		};
+
+		uart0: serial@01c28000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&uart0_pins_a>;
+			status = "okay";
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_r7>;
+
+		green {
+			label = "r7-tv-dongle:green:usr";
+			gpios = <&pio 1 2 0>;
+			default-state = "on";
+		};
+	};
+
+	reg_usb1_vbus: usb1-vbus {
+		pinctrl-0 = <&usb1_vbus_pin_r7>;
+		gpio = <&pio 6 13 0>;
+		status = "okay";
+	};
+};
-- 
1.9.0
