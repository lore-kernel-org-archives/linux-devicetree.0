From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 5/9] ARM: dts: armada388-clearfog: move second PCIe port
Date: Mon, 02 Jan 2017 14:59:02 +0000
Message-ID: <E1cO44k-00082i-A7@rmk-PC.armlinux.org.uk>
References: <E1cO43Q-0007yJ-ON@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO43Q-0007yJ-ON-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the second PCIe port to the clearfog .dts file as this is only
present on the pro models.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts  | 51 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 28 ++--------------
 2 files changed, 54 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index a1176d23a444..1ee953112d23 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -54,6 +54,23 @@
 	compatible = "solidrun,clearfog-a1", "marvell,armada388",
 		"marvell,armada385", "marvell,armada380";
 
+	soc {
+		internal-regs {
+			usb3@f0000 {
+				/* CON2, nearest CPU, USB2 only. */
+				status = "okay";
+			};
+		};
+
+		pcie-controller {
+			pcie@3,0 {
+				/* Port 2, Lane 0. CON2, nearest CPU. */
+				reset-gpios = <&expander0 2 GPIO_ACTIVE_LOW>;
+				status = "okay";
+			};
+		};
+	};
+
 	dsa@0 {
 		compatible = "marvell,dsa";
 		dsa,ethernet = <&eth1>;
@@ -119,6 +136,40 @@
 	};
 };
 
+&expander0 {
+	/*
+	 * PCA9655 GPIO expander:
+	 *  0-CON3 CLKREQ#
+	 *  1-CON3 PERST#
+	 *  2-CON2 PERST#
+	 *  3-CON3 W_DISABLE
+	 *  4-CON2 CLKREQ#
+	 *  5-USB3 overcurrent
+	 *  6-USB3 power
+	 *  7-CON2 W_DISABLE
+	 *  8-JP4 P1
+	 *  9-JP4 P4
+	 * 10-JP4 P5
+	 * 11-m.2 DEVSLP
+	 * 12-SFP_LOS
+	 * 13-SFP_TX_FAULT
+	 * 14-SFP_TX_DISABLE
+	 * 15-SFP_MOD_DEF0
+	 */
+	pcie2_0_clkreq {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_LOW>;
+		input;
+		line-name = "pcie2.0-clkreq";
+	};
+	pcie2_0_w_disable {
+		gpio-hog;
+		gpios = <7 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "pcie2.0-w-disable";
+	};
+};
+
 &pinctrl {
 	clearfog_dsa0_clk_pins: clearfog-dsa0-clk-pins {
 		marvell,pins = "mpp46";
diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index fb02997a52a1..ef4fbc6db7cf 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -103,12 +103,12 @@
 				 * PCA9655 GPIO expander, up to 1MHz clock.
 				 *  0-CON3 CLKREQ#
 				 *  1-CON3 PERST#
-				 *  2-CON2 PERST#
+				 *  2-
 				 *  3-CON3 W_DISABLE
-				 *  4-CON2 CLKREQ#
+				 *  4-
 				 *  5-USB3 overcurrent
 				 *  6-USB3 power
-				 *  7-CON2 W_DISABLE
+				 *  7-
 				 *  8-JP4 P1
 				 *  9-JP4 P4
 				 * 10-JP4 P5
@@ -143,18 +143,6 @@
 						output-low;
 						line-name = "pcie1.0-w-disable";
 					};
-					pcie2_0_clkreq {
-						gpio-hog;
-						gpios = <4 GPIO_ACTIVE_LOW>;
-						input;
-						line-name = "pcie2.0-clkreq";
-					};
-					pcie2_0_w_disable {
-						gpio-hog;
-						gpios = <7 GPIO_ACTIVE_LOW>;
-						output-low;
-						line-name = "pcie2.0-w-disable";
-					};
 					usb3_ilimit {
 						gpio-hog;
 						gpios = <5 GPIO_ACTIVE_LOW>;
@@ -296,11 +284,6 @@
 				status = "okay";
 			};
 
-			usb3@f0000 {
-				/* CON2, nearest CPU, USB2 only. */
-				status = "okay";
-			};
-
 			usb3@f8000 {
 				/* CON7 */
 				status = "okay";
@@ -318,11 +301,6 @@
 				reset-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
 				status = "okay";
 			};
-			pcie@3,0 {
-				/* Port 2, Lane 0. CON2, nearest CPU. */
-				reset-gpios = <&expander0 2 GPIO_ACTIVE_LOW>;
-				status = "okay";
-			};
 		};
 	};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
