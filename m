From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 01/19] ARM: sunxi: dt: Add sunxi-common-regulators
 include file
Date: Sat,  1 Mar 2014 20:26:20 +0100
Message-ID: <1393701998-3553-2-git-send-email-hdegoede@redhat.com>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB5PIZCMAKGQET7OAMIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393701998-3553-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Most sunxi boards with a sata connector also have a gpio controlled connector
for sata target power and almost all sunxi boards have a gpio controlled vbus
for usb1 and usb2.

This commit adds an include file for the regulators representing these
supplies, avoiding the need to copy and paste the regulator code to allmost
all sunxi board dts files.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sunxi-common-regulators.dtsi | 75 ++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 arch/arm/boot/dts/sunxi-common-regulators.dtsi

diff --git a/arch/arm/boot/dts/sunxi-common-regulators.dtsi b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
new file mode 100644
index 0000000..18eeac0
--- /dev/null
+++ b/arch/arm/boot/dts/sunxi-common-regulators.dtsi
@@ -0,0 +1,75 @@
+/*
+ * sunxi boards common regulator (ahci target power supply, usb-vbus) code
+ *
+ * Copyright 2014 - Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/ {
+	soc@01c00000 {
+		pio: pinctrl@01c20800 {
+			ahci_pwr_pin_a: ahci_pwr_pin@0 {
+				allwinner,pins = "PB8";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			usb1_vbus_pin_a: usb1_vbus_pin@0 {
+				allwinner,pins = "PH6";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+
+			usb2_vbus_pin_a: usb2_vbus_pin@0 {
+				allwinner,pins = "PH3";
+				allwinner,function = "gpio_out";
+				allwinner,drive = <0>;
+				allwinner,pull = <0>;
+			};
+		};
+	};
+
+	reg_ahci_5v: ahci-5v {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&ahci_pwr_pin_a>;
+		regulator-name = "ahci-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pio 1 8 0>;
+		status = "disabled";
+	};
+
+	reg_usb1_vbus: usb1-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb1_vbus_pin_a>;
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pio 7 6 0>;
+		status = "disabled";
+	};
+
+	reg_usb2_vbus: usb2-vbus {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_vbus_pin_a>;
+		regulator-name = "usb2-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpio = <&pio 7 3 0>;
+		status = "disabled";
+	};
+};
-- 
1.9.0
