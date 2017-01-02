From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 7/9] ARM: dts: armada388-clearfog: move rear button
Date: Mon, 02 Jan 2017 14:59:12 +0000
Message-ID: <E1cO44u-00082w-It@rmk-PC.armlinux.org.uk>
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

Move the rear button support into the clearfog pro support file.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts  | 18 ++++++++++++++++++
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index b56ce4a32519..51887b85dba4 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -126,6 +126,20 @@
 			};
 		};
 	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&rear_button_pins>;
+		pinctrl-names = "default";
+
+		button_0 {
+			/* The rear SW3 button */
+			label = "Rear Button";
+			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
+			linux,can-disable;
+			linux,code = <BTN_0>;
+		};
+	};
 };
 
 &eth1 {
@@ -183,6 +197,10 @@
 		marvell,pins = "mpp55";
 		marvell,function = "spi1";
 	};
+	rear_button_pins: rear-button-pins {
+		marvell,pins = "mpp34";
+		marvell,function = "gpio";
+	};
 };
 
 &spi1 {
diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index 30b75379377a..770d4bff6884 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -240,10 +240,6 @@
 					marvell,pins = "mpp24", "mpp25";
 					marvell,function = "ua1";
 				};
-				rear_button_pins: rear-button-pins {
-					marvell,pins = "mpp34";
-					marvell,function = "gpio";
-				};
 			};
 
 			sata@a8000 {
@@ -299,20 +295,6 @@
 			};
 		};
 	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-		pinctrl-0 = <&rear_button_pins>;
-		pinctrl-names = "default";
-
-		button_0 {
-			/* The rear SW3 button */
-			label = "Rear Button";
-			gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
-			linux,can-disable;
-			linux,code = <BTN_0>;
-		};
-	};
 };
 
 &spi1 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
