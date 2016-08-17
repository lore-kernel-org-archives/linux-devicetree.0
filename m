From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: dts: blanche: add support for general purpose switches
Date: Wed, 17 Aug 2016 22:03:06 +0300
Message-ID: <10166368.YKl2X2iyOO@wasted.cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5383928.8UnDsUpmkz-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add support  for the  general purpose  software switches  SW2 and tactile
switches SW24/25 as a virtual keyboard (like it was done with the Lager/
Koelsch boards).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
This patch is against the 'renesas-devel-20160817-v4.8-rc2' of Simon Horman's
'renesas.git' repo.

 arch/arm/boot/dts/r8a7792-blanche.dts |   49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
+++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
@@ -11,6 +11,8 @@
 
 /dts-v1/;
 #include "r8a7792.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	model = "Blanche";
@@ -54,6 +56,53 @@
 		pinctrl-0 = <&lan89218_pins>;
 		pinctrl-names = "default";
 	};
+
+	keyboard {
+		compatible = "gpio-keys";
+
+		key-1 {
+			linux,code = <KEY_1>;
+			label = "SW2-1";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 10 GPIO_ACTIVE_LOW>;
+		};
+		key-2 {
+			linux,code = <KEY_2>;
+			label = "SW2-2";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 11 GPIO_ACTIVE_LOW>;
+		};
+		key-3 {
+			linux,code = <KEY_3>;
+			label = "SW2-3";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
+		};
+		key-4 {
+			linux,code = <KEY_4>;
+			label = "SW2-4";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
+		};
+		key-a {
+			linux,code = <KEY_A>;
+			label = "SW24";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
+		};
+		key-b {
+			linux,code = <KEY_B>;
+			label = "SW25";
+			wakeup-source;
+			debounce-interval = <20>;
+			gpios = <&gpio11 2 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &extal_clk {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
