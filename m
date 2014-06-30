From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/9] ARM: dts: sun4i: Add AXP209 support to
 various boards
Date: Mon, 30 Jun 2014 23:57:52 +0200
Message-ID: <1404165479-23785-3-git-send-email-hdegoede@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORB6V2Y6OQKGQEYEUJQEI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1404165479-23785-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Zoltan HERPAI <wigyori-1V5s5g7wVVk@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

At a node for the axp209, and where necessary the i2c controller to the dts
for various boards. Note the axp209 regulators are omitted as we don't have
any use for them yet, and on some boards were not sure how exactly they are
wired up.

Adding support for just the axp209 without the regulators is still useful, as
it will give us power-button and poweroff support.

Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
[hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Drop the regulator bits for now]
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/sun4i-a10-a1000.dts          |  9 +++++++++
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts     |  9 +++++++++
 arch/arm/boot/dts/sun4i-a10-hackberry.dts      | 15 +++++++++++++++
 arch/arm/boot/dts/sun4i-a10-inet97fv2.dts      | 21 +++++++++++++++------
 arch/arm/boot/dts/sun4i-a10-mini-xplus.dts     | 15 +++++++++++++++
 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts | 15 +++++++++++++++
 arch/arm/boot/dts/sun4i-a10-pcduino.dts        |  9 +++++++++
 7 files changed, 87 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10-a1000.dts b/arch/arm/boot/dts/sun4i-a10-a1000.dts
index 0b97c07..55d9510 100644
--- a/arch/arm/boot/dts/sun4i-a10-a1000.dts
+++ b/arch/arm/boot/dts/sun4i-a10-a1000.dts
@@ -98,6 +98,15 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 	};
 
diff --git a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
index c200eac..539b693 100644
--- a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
@@ -90,6 +90,15 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 
 		i2c1: i2c@01c2b000 {
diff --git a/arch/arm/boot/dts/sun4i-a10-hackberry.dts b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
index 547fadc..21df4e3 100644
--- a/arch/arm/boot/dts/sun4i-a10-hackberry.dts
+++ b/arch/arm/boot/dts/sun4i-a10-hackberry.dts
@@ -92,6 +92,21 @@
 			pinctrl-0 = <&uart0_pins_a>;
 			status = "okay";
 		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
 	};
 
 	reg_emac_3v3: emac-3v3 {
diff --git a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
index f13723e..6b0c378 100644
--- a/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
+++ b/arch/arm/boot/dts/sun4i-a10-inet97fv2.dts
@@ -40,12 +40,6 @@
 			status = "okay";
 		};
 
-		i2c0: i2c@01c2ac00 {
-			pinctrl-names = "default";
-			pinctrl-0 = <&i2c0_pins_a>;
-			status = "okay";
-		};
-
 		usbphy: phy@01c13400 {
 			usb1_vbus-supply = <&reg_usb1_vbus>;
 			usb2_vbus-supply = <&reg_usb2_vbus>;
@@ -67,6 +61,21 @@
 		ohci1: usb@01c1c400 {
 			status = "okay";
 		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
 	};
 
 	reg_usb1_vbus: usb1-vbus {
diff --git a/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts b/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
index c01cea5..387770d 100644
--- a/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
+++ b/arch/arm/boot/dts/sun4i-a10-mini-xplus.dts
@@ -57,6 +57,21 @@
 			pinctrl-0 = <&uart0_pins_a>;
 			status = "okay";
 		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
 	};
 
 	reg_usb1_vbus: usb1-vbus {
diff --git a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
index d46a7db..d046d56 100644
--- a/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
+++ b/arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts
@@ -91,6 +91,21 @@
 			pinctrl-0 = <&uart0_pins_a>;
 			status = "okay";
 		};
+
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/sun4i-a10-pcduino.dts b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
index fb03bcc..6675bcd 100644
--- a/arch/arm/boot/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/boot/dts/sun4i-a10-pcduino.dts
@@ -76,6 +76,15 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupts = <0>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 	};
 
-- 
2.0.0
