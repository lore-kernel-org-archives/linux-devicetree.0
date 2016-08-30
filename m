From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: dts: wheat: add SDHI0 support
Date: Wed, 31 Aug 2016 01:24:41 +0300
Message-ID: <1659137.gEKJxNrmrk@wasted.cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34968644.DhifNderY8-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Define the Wheat board dependent  part of  the SDHI0 (connected to the
micro-SD slot)  device node along with the necessary voltage regulator.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
This patch is against the 'renesas-devel-20160830-v4.8-rc4' of Simon Horman's
'renesas.git' repo plus the CAN patch posted yesterday.
Starting with this patch, SMSC LAN89218 Ethernet chip starts to misbehave on my
board...

 arch/arm/boot/dts/r8a7792-wheat.dts |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
+++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r8a7792.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Wheat";
@@ -54,6 +55,17 @@
 		pinctrl-0 = <&lan89218_pins>;
 		pinctrl-names = "default";
 	};
+
+	vcc_sdhi0: regulator-vcc-sdhi0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI0 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &extal_clk {
@@ -86,6 +98,11 @@
 		groups = "can1_data";
 		function = "can1";
 	};
+
+	sdhi0_pins: sdhi0 {
+		groups = "sdhi0_data4", "sdhi0_ctrl";
+		function = "sdhi0";
+	};
 };
 
 &scif0 {
@@ -108,3 +125,12 @@
 
 	status = "okay";
 };
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi0>;
+	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
