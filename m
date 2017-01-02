From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 5/5] ARM: dts: armada388-clearfog: move uart nodes
Date: Mon, 02 Jan 2017 15:27:32 +0000
Message-ID: <E1cO4WK-00006O-3M@rmk-PC.armlinux.org.uk>
References: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO4UH-0008SR-GW-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move the uart nodes over to use the label form to reference the serial
devices, rather than replicating the device node path.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dtsi          | 14 +++++++-------
 arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index 6149699eefc2..0f5938bede53 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -93,13 +93,6 @@
 				wp-inverted;
 			};
 
-			serial@12100 {
-				/* mikrobus uart */
-				pinctrl-0 = <&mikro_uart_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-			};
-
 			usb@58000 {
 				/* CON3, nearest  power. */
 				status = "okay";
@@ -305,3 +298,10 @@
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&uart1 {
+	/* mikrobus uart */
+	pinctrl-0 = <&mikro_uart_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
index 681962a6395b..458884ff4c8c 100644
--- a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
+++ b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
@@ -69,12 +69,6 @@
 				 */
 				status = "okay";
 			};
-
-			serial@12000 {
-				pinctrl-0 = <&uart0_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-			};
 		};
 	};
 };
@@ -144,3 +138,9 @@
 		status = "disabled";
 	};
 };
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
