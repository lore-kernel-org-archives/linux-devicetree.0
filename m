From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: sun7i: Add new i12-tvbox board
Date: Wed, 21 May 2014 19:43:31 +0200
Message-ID: <1400694211-29903-2-git-send-email-hdegoede@redhat.com>
References: <1400694211-29903-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORBS6L6ONQKGQEK5KOYSI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1400694211-29903-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The i12 tvbox is an A20 based android tvbox, with 512M / 1G RAM, 4G nand flash,
ap6210 or ap6330 sdio wifi + bt (broadcom sdio wifi + uart attached brcm bt),
2USB host ports using USB-A receptacles and a micro-usb receptacle for USB OTG,
and 100Mbit ethernet using an IP101a phy.

The PCB is labelled i12-a20 hence I've named the board i12-a20. It is used
in noname allwinner A20 tv-boxes, which are sometimes sold with Q5 or
QT840A as product name.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts | 176 ++++++++++++++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1d9c50d..b40be4e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -349,6 +349,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += \
 	sun6i-a31-m9.dtb \
 	sun7i-a20-cubieboard2.dtb \
 	sun7i-a20-cubietruck.dtb \
+	sun7i-a20-i12-tvbox.dtb \
 	sun7i-a20-olinuxino-micro.dtb
 dtb-$(CONFIG_ARCH_TEGRA) += tegra20-harmony.dtb \
 	tegra20-iris-512.dtb \
diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
new file mode 100644
index 0000000..b77308e
--- /dev/null
+++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
@@ -0,0 +1,176 @@
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
+/include/ "sun7i-a20.dtsi"
+/include/ "sunxi-common-regulators.dtsi"
+
+/ {
+	model = "I12 / Q5 / QT840A A20 tvbox";
+	compatible = "allwinner,i12-tvbox", "allwinner,sun7i-a20";
+
+	soc@01c00000 {
+		mmc0: mmc@01c0f000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
+			vmmc-supply = <&reg_vcc3v3>;
+			bus-width = <4>;
+			cd-gpios = <&pio 7 1 0>; /* PH1 */
+			cd-inverted;
+			status = "okay";
+		};
+
+		mmc3: mmc@01c12000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc3_pins_a>;
+			vmmc-supply = <&reg_vmmc3>;
+			bus-width = <4>;
+			non-removable;
+			status = "okay";
+		};
+
+		usbphy: phy@01c13400 {
+			usb1_vbus-supply = <&reg_usb1_vbus>;
+			usb2_vbus-supply = <&reg_usb2_vbus>;
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
+		ehci1: usb@01c1c000 {
+			status = "okay";
+		};
+
+		ohci1: usb@01c1c400 {
+			status = "okay";
+		};
+
+		pinctrl@01c20800 {
+			mmc3_pins_a: mmc3@0 {
+				/* AP6210 / AP6330 requires pull-up */
+				allwinner,pull = <1>;
+			};
+
+			vmmc3_pin_i12_tvbox: vmmc3_pin@0 {
+				allwinner,pins = "PH2";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			vmmc3_io_pin_i12_tvbox: vmmc3_io_pin@0 {
+				allwinner,pins = "PH12";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			gmac_power_pin_i12_tvbox: gmac_power_pin@0 {
+				allwinner,pins = "PH21";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			led_pins_i12_tvbox: led_pins@0 {
+				allwinner,pins = "PH9", "PH20";
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
+
+		gmac: ethernet@01c50000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&gmac_pins_mii_a>;
+			phy = <&phy1>;
+			phy-mode = "mii";
+			phy-supply = <&reg_gmac_3v3>;
+			status = "okay";
+
+			phy1: ethernet-phy@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_i12_tvbox>;
+
+		red {
+			label = "i12_tvbox:red:usr";
+			gpios = <&pio 7 9 1>;
+		};
+
+		blue {
+			label = "i12_tvbox:blue:usr";
+			gpios = <&pio 7 20 0>;
+		};
+	};
+
+	reg_usb1_vbus: usb1-vbus {
+		status = "okay";
+	};
+
+	reg_usb2_vbus: usb2-vbus {
+		status = "okay";
+	};
+
+	reg_vmmc3: vmmc3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc3_pin_i12_tvbox>;
+		regulator-name = "vmmc3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		gpio = <&pio 7 2 0>;
+	};
+
+	reg_vmmc3_io: vmmc3-io {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc3_io_pin_i12_tvbox>;
+		regulator-name = "vmmc3-io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/* This controls VCC-PI, must be always on! */
+		regulator-always-on;
+		enable-active-high;
+		gpio = <&pio 7 12 0>;
+	};
+
+	reg_gmac_3v3: gmac-3v3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac_power_pin_i12_tvbox>;
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+		gpio = <&pio 7 21 0>;
+	};
+};
-- 
1.9.0
