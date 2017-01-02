From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 6/9] ARM: dts: armada388-clearfog: move SPI CS1
Date: Mon, 02 Jan 2017 14:59:07 +0000
Message-ID: <E1cO44p-00082p-F7@rmk-PC.armlinux.org.uk>
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

Move the SPI CS1 configuration to the clearfog .dts file as this is only
present on pro models.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts  | 14 ++++++++++++++
 arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 ++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 1ee953112d23..b56ce4a32519 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -179,4 +179,18 @@
 		marvell,pins = "mpp23", "mpp41";
 		marvell,function = "gpio";
 	};
+	clearfog_spi1_cs_pins: spi1-cs-pins {
+		marvell,pins = "mpp55";
+		marvell,function = "spi1";
+	};
+};
+
+&spi1 {
+	/*
+	 * Add SPI CS pins for clearfog:
+	 * CS0: W25Q32 (not populated on uSOM)
+	 * CS1:
+	 * CS2: mikrobus
+	 */
+	pinctrl-0 = <&spi1_pins &clearfog_spi1_cs_pins &mikro_spi_pins>;
 };
diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
index ef4fbc6db7cf..30b75379377a 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
+++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
@@ -227,10 +227,6 @@
 					marvell,pins = "mpp20";
 					marvell,function = "gpio";
 				};
-				clearfog_spi1_cs_pins: spi1-cs-pins {
-					marvell,pins = "mpp55";
-					marvell,function = "spi1";
-				};
 				mikro_pins: mikro-pins {
 					/* int: mpp22 rst: mpp29 */
 					marvell,pins = "mpp22", "mpp29";
@@ -323,12 +319,10 @@
 	/*
 	 * Add SPI CS pins for clearfog:
 	 * CS0: W25Q32 (not populated on uSOM)
-	 * CS1:
+	 * CS1: PIC microcontroller (Pro models)
 	 * CS2: mikrobus
 	 */
-	pinctrl-0 = <&spi1_pins
-		     &clearfog_spi1_cs_pins
-		     &mikro_spi_pins>;
+	pinctrl-0 = <&spi1_pins &mikro_spi_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
