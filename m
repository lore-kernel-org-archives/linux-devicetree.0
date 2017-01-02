From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 1/5] ARM: dts: armada388-clearfog: add phy reset gpio-hog
Date: Mon, 02 Jan 2017 15:27:11 +0000
Message-ID: <E1cO4Vz-00005t-8n@rmk-PC.armlinux.org.uk>
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

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog-base.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/armada-388-clearfog-base.dts b/arch/arm/boot/dts/armada-388-clearfog-base.dts
index f86e1876fb38..da788ea40717 100644
--- a/arch/arm/boot/dts/armada-388-clearfog-base.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog-base.dts
@@ -74,7 +74,17 @@
 	phy = <&phy1>;
 };
 
+&gpio0 {
+	phy1_reset {
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "phy1-reset";
+	};
+};
+
 &mdio {
+	pinctrl-0 = <&mdio_pins &microsom_phy_clk_pins &clearfog_phy_pins>;
 	phy1: ethernet-phy@1 {
 		/*
 		 * Annoyingly, the marvell phy driver configures the LED
@@ -87,6 +97,11 @@
 };
 
 &pinctrl {
+	/* phy1 reset */
+	clearfog_phy_pins: clearfog-phy-pins {
+		marvell,pins = "mpp19";
+		marvell,function = "gpio";
+	};
 	rear_button_pins: rear-button-pins {
 		marvell,pins = "mpp44";
 		marvell,function = "gpio";
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
