From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 1/9] ARM: dts: armada388-clearfog: move SPI flash into
 microsom
Date: Mon, 02 Jan 2017 14:58:41 +0000
Message-ID: <E1cO44P-00082F-Ps@rmk-PC.armlinux.org.uk>
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

The optional SPI flash is fitted to the microsom, not the clearfog
board, so it should be specified in the microsom DTS include file.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts           | 14 ++------------
 arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 3e7c3a6237c3..3980d05f5ece 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -423,9 +423,8 @@
 
 &spi1 {
 	/*
-	 * We don't seem to have the W25Q32 on the
-	 * A1 Rev 2.0 boards, so disable SPI.
-	 * CS0: W25Q32 (doesn't appear to be present)
+	 * Add SPI CS pins for clearfog:
+	 * CS0: W25Q32 (not populated on uSOM)
 	 * CS1:
 	 * CS2: mikrobus
 	 */
@@ -434,13 +433,4 @@
 		     &mikro_spi_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	spi-flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "w25q32", "jedec,spi-nor";
-		reg = <0>; /* Chip select 0 */
-		spi-max-frequency = <3000000>;
-		status = "disabled";
-	};
 };
diff --git a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
index 8c9842237b60..8a84fe3e9c28 100644
--- a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
+++ b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
@@ -126,3 +126,17 @@
 
 	};
 };
+
+&spi1 {
+	/* The microsom has an optional W25Q32 on board, connected to CS0 */
+	pinctrl-0 = <&spi1_pins>;
+
+	w25q32: spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "w25q32", "jedec,spi-nor";
+		reg = <0>; /* Chip select 0 */
+		spi-max-frequency = <3000000>;
+		status = "disabled";
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
