From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 2/9] ARM: dts: armada388-clearfog: move sdhci pinctrl node to
 microsom
Date: Mon, 02 Jan 2017 14:58:46 +0000
Message-ID: <E1cO44U-00082N-TY@rmk-PC.armlinux.org.uk>
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

Move the SDHCI pinctrl node to the microsom file - the microsom can have
optional eMMC support which uses these same pinctrl settings, so it is
sensible to have these here.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts           | 8 +-------
 arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 7 +++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 3980d05f5ece..9bf399dd1786 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -257,12 +257,6 @@
 					marvell,pins = "mpp20";
 					marvell,function = "gpio";
 				};
-				clearfog_sdhci_pins: clearfog-sdhci-pins {
-					marvell,pins = "mpp21", "mpp28",
-						       "mpp37", "mpp38",
-						       "mpp39", "mpp40";
-					marvell,function = "sd0";
-				};
 				clearfog_spi1_cs_pins: spi1-cs-pins {
 					marvell,pins = "mpp55";
 					marvell,function = "spi1";
@@ -300,7 +294,7 @@
 				bus-width = <4>;
 				cd-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
 				no-1-8-v;
-				pinctrl-0 = <&clearfog_sdhci_pins
+				pinctrl-0 = <&microsom_sdhci_pins
 					     &clearfog_sdhci_cd_pins>;
 				pinctrl-names = "default";
 				status = "okay";
diff --git a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
index 8a84fe3e9c28..6608657b9994 100644
--- a/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
+++ b/arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi
@@ -99,6 +99,13 @@
 					marvell,pins = "mpp45";
 					marvell,function = "ref";
 				};
+				/* Optional eMMC */
+				microsom_sdhci_pins: microsom-sdhci-pins {
+					marvell,pins = "mpp21", "mpp28",
+						       "mpp37", "mpp38",
+						       "mpp39", "mpp40";
+					marvell,function = "sd0";
+				};
 			};
 
 			rtc@a3800 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
