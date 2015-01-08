From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 08/12] ARM: mvebu: a38x: Add more pinctrl functions
Date: Thu,  8 Jan 2015 18:38:10 +0100
Message-ID: <1420738694-6163-9-git-send-email-gregory.clement@free-electrons.com>
References: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420738694-6163-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

With the Armada 385 GP board more pinctrl functions depending of the
SoC are needed. Add them to the DTSI to avoid duplication.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-38x.dtsi | 47 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index 98885c58be29..63fe15174fee 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -204,6 +204,14 @@
 					marvell,function = "ge0";
 				};
 
+				ge1_rgmii_pins: ge-rgmii-pins-1 {
+					marvell,pins = "mpp21", "mpp27", "mpp28",
+						       "mpp29", "mpp30", "mpp31",
+						       "mpp32", "mpp37", "mpp38",
+						       "mpp39", "mpp40", "mpp41";
+					marvell,function = "ge1";
+				};
+
 				i2c0_pins: i2c-pins-0 {
 					marvell,pins = "mpp2", "mpp3";
 					marvell,function = "i2c0";
@@ -219,6 +227,17 @@
 					marvell,function = "ref";
 				};
 
+				ref_clk1_pins: ref-clk-pins-1 {
+					marvell,pins = "mpp46";
+					marvell,function = "ref";
+				};
+
+				spi0_pins: spi-pins-0 {
+					marvell,pins = "mpp22", "mpp23", "mpp24",
+						       "mpp25";
+					marvell,function = "spi0";
+				};
+
 				spi1_pins: spi-pins-1 {
 					marvell,pins = "mpp56", "mpp57", "mpp58",
 						       "mpp59";
@@ -234,6 +253,34 @@
 					marvell,pins = "mpp19", "mpp20";
 					marvell,function = "ua1";
 				};
+
+				sdhci_pins: sdhci-pins {
+					marvell,pins = "mpp48", "mpp49", "mpp50",
+						       "mpp52", "mpp53", "mpp54",
+						       "mpp55", "mpp57", "mpp58",
+						       "mpp59";
+					marvell,function = "sd0";
+				};
+
+				sata0_pins: sata-pins-0 {
+					marvell,pins = "mpp20";
+					marvell,function = "sata0";
+				};
+
+				sata1_pins: sata-pins-1 {
+					marvell,pins = "mpp19";
+					marvell,function = "sata1";
+				};
+
+				sata2_pins: sata-pins-2 {
+					marvell,pins = "mpp47";
+					marvell,function = "sata2";
+				};
+
+				sata3_pins: sata-pins-3 {
+					marvell,pins = "mpp44";
+					marvell,function = "sata3";
+				};
 			};
 
 			gpio0: gpio@18100 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
