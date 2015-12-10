From: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: sun7i: Olimex A20-SOM-EVB: Add
 LRADC keys
Date: Thu, 10 Dec 2015 21:31:59 +0100
Message-ID: <1449779521-754-2-git-send-email-merker@debian.org>
References: <1449779521-754-1-git-send-email-merker@debian.org>
Reply-To: merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDP2XNNJ7IFBBCODU6ZQKGQEORVU7RY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449779521-754-1-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Olimex A20-SOM-EVB is an evaluation board for the Olimex
A20-SOM system-on-module.  It provides a set of android-style
buttons (labeled "VOL+", "VOL-", "MENU", "SEARCH", "HOME", "ESC"
and "ENTER") which are connected to a low-resolution ADC via a
resistor network.

This patch adds appropriate button definitions to the board
dts. The voltages assigned to the keys are specified in the
board schematics published by the manufacturer.

Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
index b7fe102..6562a6bc 100644
--- a/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olimex-som-evb.dts
@@ -1,5 +1,6 @@
 /*
  * Copyright 2015 - Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * Copyright 2015 - Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
  *
  * This file is dual-licensed: you can use it either under the terms
  * of the GPL or the X11 license, at your option. Note that this dual
@@ -45,6 +46,7 @@
 #include "sunxi-common-regulators.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
@@ -110,6 +112,60 @@
 	};
 };
 
+&lradc {
+	vref-supply = <&reg_vcc3v0>;
+	status = "okay";
+
+	button@190 {
+		label = "Volume Up";
+		linux,code = <KEY_VOLUMEUP>;
+		channel = <0>;
+		voltage = <190000>;
+	};
+
+	button@390 {
+		label = "Volume Down";
+		linux,code = <KEY_VOLUMEDOWN>;
+		channel = <0>;
+		voltage = <390000>;
+	};
+
+	button@600 {
+		label = "Menu";
+		linux,code = <KEY_MENU>;
+		channel = <0>;
+		voltage = <600000>;
+	};
+
+	button@800 {
+		label = "Search";
+		linux,code = <KEY_SEARCH>;
+		channel = <0>;
+		voltage = <800000>;
+	};
+
+	button@980 {
+		label = "Home";
+		linux,code = <KEY_HOMEPAGE>;
+		channel = <0>;
+		voltage = <980000>;
+	};
+
+	button@1180 {
+		label = "Esc";
+		linux,code = <KEY_ESC>;
+		channel = <0>;
+		voltage = <1180000>;
+	};
+
+	button@1400 {
+		label = "Enter";
+		linux,code = <KEY_ENTER>;
+		channel = <0>;
+		voltage = <1400000>;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
-- 
2.1.4
