From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/9] ARM: dts: sun7i: Add AXP209 support to
 various boards
Date: Mon, 30 Jun 2014 23:57:53 +0200
Message-ID: <1404165479-23785-4-git-send-email-hdegoede@redhat.com>
References: <1404165479-23785-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDRZXY4CYYORB7F2Y6OQKGQEFFMOFCQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
 arch/arm/boot/dts/sun7i-a20-cubieboard2.dts     | 10 ++++++++++
 arch/arm/boot/dts/sun7i-a20-cubietruck.dts      | 10 ++++++++++
 arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts       | 16 ++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 10 ++++++++++
 4 files changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
index a70f0b4..5368098 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubieboard2.dts
@@ -82,6 +82,16 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupt-parent = <&nmi_intc>;
+				interrupts = <0 8>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 
 		i2c1: i2c@01c2b000 {
diff --git a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
index 634d04b..f9ab5d4 100644
--- a/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
+++ b/arch/arm/boot/dts/sun7i-a20-cubietruck.dts
@@ -127,6 +127,16 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupt-parent = <&nmi_intc>;
+				interrupts = <0 8>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 
 		i2c1: i2c@01c2b000 {
diff --git a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
index 15c7922..4ee6b44 100644
--- a/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
+++ b/arch/arm/boot/dts/sun7i-a20-i12-tvbox.dts
@@ -111,6 +111,22 @@
 			status = "okay";
 		};
 
+		i2c0: i2c@01c2ac00 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c0_pins_a>;
+			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupt-parent = <&nmi_intc>;
+				interrupts = <0 8>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
 		gmac: ethernet@01c50000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&gmac_pins_mii_a>;
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
index 99faff1..aa384b5 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
@@ -131,6 +131,16 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c0_pins_a>;
 			status = "okay";
+
+			axp209: pmic@34 {
+				compatible = "x-powers,axp209";
+				reg = <0x34>;
+				interrupt-parent = <&nmi_intc>;
+				interrupts = <0 8>;
+
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
 		};
 
 		i2c1: i2c@01c2b000 {
-- 
2.0.0
