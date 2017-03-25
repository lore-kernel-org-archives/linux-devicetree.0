From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] ARM: dts: clearfog: keep dts alphabetically ordered
Date: Sat, 25 Mar 2017 12:53:10 +0000
Message-ID: <E1crlBu-0002Gp-V4@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Keep the clearfog DTS file ordered alphabetically - Florian placed the
MDIO entry after pinctrl, which mis-orders the file.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts | 38 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index b9ad1641bcf3..e74904bcd0a0 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -183,25 +183,6 @@
 	};
 };
 
-&pinctrl {
-	clearfog_dsa0_clk_pins: clearfog-dsa0-clk-pins {
-		marvell,pins = "mpp46";
-		marvell,function = "ref";
-	};
-	clearfog_dsa0_pins: clearfog-dsa0-pins {
-		marvell,pins = "mpp23", "mpp41";
-		marvell,function = "gpio";
-	};
-	clearfog_spi1_cs_pins: spi1-cs-pins {
-		marvell,pins = "mpp55";
-		marvell,function = "spi1";
-	};
-	rear_button_pins: rear-button-pins {
-		marvell,pins = "mpp34";
-		marvell,function = "gpio";
-	};
-};
-
 &mdio {
 	status = "okay";
 
@@ -261,6 +242,25 @@
 	};
 };
 
+&pinctrl {
+	clearfog_dsa0_clk_pins: clearfog-dsa0-clk-pins {
+		marvell,pins = "mpp46";
+		marvell,function = "ref";
+	};
+	clearfog_dsa0_pins: clearfog-dsa0-pins {
+		marvell,pins = "mpp23", "mpp41";
+		marvell,function = "gpio";
+	};
+	clearfog_spi1_cs_pins: spi1-cs-pins {
+		marvell,pins = "mpp55";
+		marvell,function = "spi1";
+	};
+	rear_button_pins: rear-button-pins {
+		marvell,pins = "mpp34";
+		marvell,function = "gpio";
+	};
+};
+
 &spi1 {
 	/*
 	 * Add SPI CS pins for clearfog:
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
